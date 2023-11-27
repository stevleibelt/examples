#!/usr/bin/env pwsh
####
# Example for the usage of Split-Path
####
# @see https://sid-500.com/2022/07/20/powershell-split-path-examples/
# @since 2022-07-20
# @author stev leibelt <artodeto@bazzline.net>
####

Function _example {
    $CurrentScriptPath = Split-Path $script:MyInvocation.MyCommand.Path

    Write-Host ":: File path by using >>-Parent<<"
    Split-Path $CurrentScriptPath -Parent
    Write-Host ""

    Write-Host ":: Last element by using >>-Leaf<<"
    Split-Path $CurrentScriptPath -Leaf
    Split-Path $PSScriptRoot -Leaf
    Write-Host ""

    Write-Host ":: Drive letter by using >>-Qualifier<<"
    Split-Path $CurrentScriptPath -Qualifier
    Write-Host ""

    Write-Host ":: No drive letter by using >>-NoQualifier<<"
    Split-Path $CurrentScriptPath -NoQualifier
    Write-Host ""

    Write-Host ":: Sub folder by using >>(-Parent) -Leaf<<"
    Split-Path (Split-Path $CurrentScriptPath -Parent) -Leaf
    Write-Host ""

    Write-Host ":: Sub folder using >>-Parent |<<"
    Split-Path $CurrentScriptPath -Parent |
    Write-Host ""

    Write-Host ":: Sub folder by using >>-Parent | Split-Path -Leaf<<"
    Split-Path $CurrentScriptPath -Parent | Split-Path -Leaf
    Write-Host ""

    Write-Host ":: Is this absolut by using >>-IsAbsolute<<"
    Split-Path $CurrentScriptPath -IsAbsolute
    Write-Host ""
}

_example
