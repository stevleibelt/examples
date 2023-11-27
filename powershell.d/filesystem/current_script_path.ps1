#!/usr/bin/env pwsh
####
# Determines current script path
####
# @see https://www.autoitconsulting.com/site/scripting/get-current-script-directory-powershell-vbscript-batch/
# @since 2021-12-16
# @author stev leibelt <artodeto@bazzline.net>
####

Function _example {
    $CurrentScriptPath = Split-Path $script:MyInvocation.MyCommand.Path

    Write-Host $CurrentScriptPath
}

_example
