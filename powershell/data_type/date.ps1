#!/usr/bin/env pwsh
####
# Some stuff for working with date
####
# @since 2021-04-14
# @author stev leibelt <artodeto@bazzline.net>
####

$currentDateTime = Get-Date

Write-Host ":: Current date time"
Write-Host $currentDateTime.DateTime

Write-Host ""
$runTime = (Get-Date).Subtract($currentDateTime)

Write-Host ":: Runtime"
Write-Host $runTime
