#!/usr/bin/env pwsh
####
# Automatically installs fonts from provided source path.
#
# Usage:
#   install_fonts.ps1 <string: path to the fonts to install>
####
# @todo
#   find better names for the variables
####
# @see  https://4sysops.com/archives/install-fonts-with-a-powershell-script/
#       https://powershell.org/forums/topic/install-fonts-using-invoke-command/
# @since 2020-03-26
# @author stev leibelt <artodeto@bazzline.net>
####

#define mandatory parameters
param(
    [Parameter(Mandatory=$true, Position=0)]
    [ValidateNotNull()]
    [string]$sourcePathOfTheFonts
)

if (!(Test-Path $sourcePathOfTheFonts)) {
    Write-Host ":: Invalid argument provided."
    Write-Host $("   Source path of the fonts >>" + $sourcePathOfTheFonts + "<< is not a valid path.")

    Exit
}

$destinationPathOfTheFonts  = "C:\Windows\Fonts"
$objShell                   = New-Object -ComObject Shell.Application
$openType                   = "(Open Type)"
$regPath                    = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
$sourceFolderObject         = $objShell.namespace($sourcePathOfTheFonts)
$trueType                   = "(True Type)"

Write-Host ":: Installing fonts."
Write-Host $("   Source path: >>" + $sourcePathOfTheFonts + "<<.")
Write-Host $("   Regestry path: >>" + $regPath + "<<.")

Foreach ($file in $sourceFolderObject.items()) {
    $fontName   = $($sourceFolderObject.getDetailsOf($file, 21));
    $fileType   = $($sourceFolderObject.getDetailsOf($file, 2));

    if ($fileType -like "OpenTyper*") {
        $regKeyName = $fontName,$openType -join " "
    } ElseIf ($fileType -like "TrueType*") {
        $regKeyName = $fontName,$trueType -join " "
    } Else {
        Write-Host $("File type >>" + $fileType + "<< is not supported!")
        Continue
    }

    $fontDestinationPath    = $($destinationPathOfTheFonts + "\" + $file.Name)

    if (!(Test-Path $fontDestinationPath)) {
        Write-Host $("   Installing font >>" + $fontName + "<< from file >>" + $file.Name + "<<.")
        Copy-Item $file.Path $destinationPathOfTheFonts

        Write-Host $("   Creating registry entry >>" + $regKeyName + "<< with value >>" + $file.Name + "<<.")
        New-ItemProperty -Path $regPath -Name $regKeyName -Value $file.Name -PropertyType String -Force | Out-Null:
    }
}
