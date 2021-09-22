#!/usr/bin/env pwsh
################
# @see
#   https://arcanecode.com/2021/07/19/fun-with-powershell-string-formatting/
# @since 2021-09-22
# @author stev leibelt <artodeto@bazzline.net>
################

Write-Host ":: String formatting aka printf for PowerShell."

$ItemNames = @(
    'One'
    'Two'
    'Seven',
    'Nine'
)

[string]::Format("Listing first item: >>{0}<<.", $ItemNames)

"Listing first item: >>{0}<<." -f $ItemNames

"{1} of {0}." -f $ItemNames[3], $ItemNames[2]
