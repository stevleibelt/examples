#!/usr/bin/env pwsh
####
# Example how powershell supports parameters
####
# @see https://stackoverflow.com/a/2157625
# @since 2020-03-23
# @author stev leibelt <artodeto@bazzline.net>
####

#define it at the top of your code

param (
    [Parameter(Mandatory=$true)] [string]$mandatorystring = $( Read-Host "Please input something, something please!" ),
    [Parameter(Mandatory=$false)] [string]$optionalstring = "there is no foo without a bar",
    [Parameter(Mandatory=$false)] [switch]$force = $false
)

Write-Host $("Parameter >>mandatorystring<< contains: " + $mandatorystring)
Write-Host $("Parameter >>optionalstring<< contains: " + $optionalstring)

If ($force) {
    Write-Host "Flag >>force<< was used."
} Else {
    Write-Host "Flag >>force<< was not used."
}
