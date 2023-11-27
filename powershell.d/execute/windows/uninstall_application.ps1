#!/usr/bin/env pwsh
# This only works with windows!
#
# Example how to search for an installed application on an remote pc and uninstall this.
####
# @since 2022-03-01
# @author stev leibelt <artodeto@bazzline.net>
####

#bo: function
Function Fetch-FilteredInstalledApplication
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string] $ComputerName,

        [Parameter(Mandatory = $true)]
        [string] $Pattern
    )

    Return Get-WmiObject -Class Win32_Product -ComputerName $ComputerName | Where name -Like "*${Pattern}*"
}

Function List-AllInstalledApplication
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string] $ComputerName
    )

    Get-CimInstance -Class Win32_Product -ComputerName $ComputerName | Format-List
}

Function List-FilteredInstalledApplication
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string] $ComputerName,

        [Parameter(Mandatory = $true)]
        [string] $Pattern
    )

    Get-CimInstance -Class Win32_Product -ComputerName $ComputerName | Where name -like "*${Pattern}*"
}

Function Print-Menu
{
    Do {
        Clear-Host
        Write-Host ":::::::: Main Menu ::::::::"
        Write-Host ""
        Write-Host "1.) List all installed applications."
        Write-Host "2.) List filtered installed applications."
        Write-Host "3.) Uninstall filtered application."
        Write-Host ""
        Write-Host "q) Quit."

        $UserSeleciton = Read-Host ":: Please make a selection."

        Switch ($UserSeleciton)
        {
            '1' {
                $ComputerName = Read-Host ":: Please insert the computer name."

                List-AllInstalledApplication $ComputerName

                Pause
            } '2' {
                $ComputerName = Read-Host ":: Please insert the computer name."
                $Pattern = Read-Host ":: Please insert the application name."

                List-FilteredInstalledApplication $ComputerName $Pattern

                Pause
            } '3' {
                $ComputerName = Read-Host ":: Please insert the computer name."
                $ApplicationName = Read-Host ":: Please insert the application name."

                Uninstall-Application $ComputerName $ApplicationName

                Pause
            } 'q' {
                Return
            }
        }
    }
    While ($true)
}

Function Uninstall-Application
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string] $ComputerName,

        [Parameter(Mandatory = $true)]
        [string] $ApplicationName
    )

    $Application = Fetch-FilteredInstalledApplication $ComputerName $ApplicationName

    If ( $Application -ne $null ) {
        Write-Verbose ":: Start uninstalling of >>${ApplicationName}<<."

        $Application.uinstall()
    } Else {
        Write-Host ":: No application found for pattern >>${ApplicationName}<<."
    }
}

Function _Execute-Main
{
    #bo: setup
    $OldVerbosePrefence = $VerbosePreference
    $VerbosePreference = "Continue"
    #eo: setup

    Print-Menu

    $VerbosePreference = $OldVerbosePrefence
}

_Execute-Main
