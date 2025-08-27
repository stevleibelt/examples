#!/usr/bin/env pwsh
####
# @see
#   https://arcanecode.com/2021/09/06/fun-with-powershell-advanced-functions/
# @since 2021-09-28
# @author stev leibelt <artodeto@bazzline.net>
####

Function My-FunctionName()
{
    [CmdletBinding()]
    param(
    )

    Write-Host "Executed >>$($PSCmdlet.MyInvocation.MyCommand.Name)<<."
}

My-FunctionName
