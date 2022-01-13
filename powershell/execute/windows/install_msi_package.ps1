#!/usr/bin/env pwsh
# This only works with windows!
#
# Example how to use msi installer from powershell
#   This is just an example, there is no existing msi file.
# It is assumed, that you have the following folder structure:
#   bin\my_example.msi
#   bin\my_example.msi.sha512
#   log\
#
# For each call, there will be a log file created in the path "log".
#   The file name of the `*.log` file will be <string: hostname>_<string: YYYYMMDD>.<string: HHIISS>.log
####
# @since 2022-01-11
# @author stev leibelt <artodeto@bazzline.net>
####

#bo: function
Function Check-FileIntegrity
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string] $PathToBinaryFile
    )

    $HasPassedIntegrityCheck = $false
    $PathToTheHashFile = $($PathToBinaryFile + ".sha512")

    If (Test-Path $pathToTheHashFile) {
        $CalculatedFileHash = Get-FileHash -LiteralPath $PathToBinaryFile -Algorithm SHA512
        #remove each line starting with >>#<<
        $HashFileContent = Get-Content $PathToTheHashFile | Select-String -pattern "^#" -NotMatch

        Write-Verbose ":: Checking file integrity with sha512."
        #we are expeting a sha512 file with multiple lines of comment.
        #   the first and only line with no comment is the line with the sha512sum and it looks like:<sha512 sum>\t*<file name>
        #we are exploding the expected content by " "
        #    first array entry is the <sha512sum>
        #    ...
        $ArrayOfHashFileContent = $HashFileContent.ToString().Split(" ")
        $ExpectedFileHash = $ArrayOfHashFileContent[0]

        If ($ExpectedFileHash.Length -eq 128) {
            If ($ExpectedFileHash -ne $CalculatedFileHash.HASH) {
                Write-Error $("   Integrity check was not successful. Expected file hash >>" + $ExpectedFileHash + "<<, calculated file hash >>" + $CalculatedFileHash.HASH + "<<.")
            } else {
                Write-Verbose "   Integrity check successful."
                $HasPassedIntegrityCheck = $true
            }
        } Else {
            Write-Error ":: Unexpected file hash content."
        }

    } Else {
        Write-Error $(":: File does not exists: >>" + $PathToTheHashFile + "<<.")
    }

    return $HasPassedIntegrityCheck
}

Function Install-Software
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string] $PathToBinaryFile,

        [Parameter(Mandatory = $true)]
        [string] $LocalInstallationPath,

        [Parameter(Mandatory = $true)]
        [string] $PathToTheLogFile,

        [Parameter(Mandatory = $true)]
        [bool] $UseLogging
    )

    Write-Verbose ":: Starting MSI installation."
    #@see: https://powershellexplained.com/2016-10-21-powershell-installing-msi-files/
    $MsiArguments = @(
        "/i"
        ('"{0}"' -f $PathToBinaryFile)
	    ('APPDIR="{0}"' -f $LocalInstallationPath)    #tried out TARGETDIR, INSTALLDIR, APPLICATIONFOLDER, APPDIR
        "/qn"
        "/norestart"
        "/quiet"
    )

    If ($UseLogging -eq $true) {
        $DateTimeStamp = Get-Date -Format "yyyyMMdd.HHmmss"

        $PathToTheLogFile = '{0}{1}_{2}.log' -f ($PSScriptRoot + "\log\"),$env:computername,$DateTimeStamp

        #@see: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/msiexec#logging-options
        $MsiArguments += "/L*v"
        $MsiArguments += $PathToTheLogFile
    }

    If ($IsDryRun -eq $true) {
        Write-Host $MsiArguments
        Write-Host 'Start-Process "msiexec.exe" -ArgumentList $MsiArguments -Wait -NoNewWindow'
    } Else {
        Start-Process "msiexec.exe" -ArgumentList $MsiArguments -Wait -NoNewWindow
    }

    If ($?) {
        Write-Verbose "   MSI installation successful."
    } Else {
        Write-Error ":: MSI installation was not successful."
        Write-Error ("   >>" + $PathToBinaryFile + "<<")
    }
}

Function _Execute-Main
{
    #bo: setup
    $IsDryRun = $false
    #-AdditionalChildPath is only working with PowerShell 7.2++
    $PathToBinaryFile = Join-Path -Path $PSScriptRoot -ChildPath "bin" -AdditionalChildPath "my_example.msi"
    $LocalInstallationPath = "C:\MyExample" #just use it if you really need it!
    $LogFilePath = Join-Path -Path $PSScriptRoot -ChildPath "log"
    $OldVerbosePrefence = $VerbosePreference
    $UseLogging = $true
    $VerbosePreference = "Continue"
    #eo: setup

    If (Check-FileIntegrity $PathToBinaryFile) {
        Install-Software $PathToBinaryFile $LocalInstallationPath $LogFilePath $UseLogging
    }

    $VerbosePreference = $OldVerbosePrefence
}

_Execute-Main
