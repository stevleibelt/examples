#!/usr/bin/env pwsh
####
# Run a script as administrator
####
# @since 2022-01-20
# @author stev leibelt <artodeto@bazzline.net>
####

Function Execute-Main
{
    $PathToTheScript = "..\..\input\parameter.ps1"

    If ((Test-Path -Path $PathToTheScript) -ne $true) {
        Write-Error ":: File not found."
        Write-Error "   Expected path to the script we want to execute does not exist."
        Write-Error "   Path is >>${PathToTheScript}<<."

        return 1
    }

    $ArgumentList = @(
        "-NoProfile"
        "-ExecutionPolicy Bypass"
        "-File `"$PathToTheScript`""
        "-mandatorystring `"This is a value of a mandatory parameter`""
    )

    Start-Process PowerShell -ArgumentList $ArgumentList -Verb RunAs -Wait -Verbose
}

Execute-Main
