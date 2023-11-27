#!/usr/bin/env pwsh
####
# Some stuff for working with date
####
# @see
#   https://matthewjdegarmo.com/powershell/2021/12/01/playing-with-dates-in-powershell.html
#   https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-date?view=powershell-7.2#notes
# @since 2021-04-14
# @author stev leibelt <artodeto@bazzline.net>
####

Write-Host ":: Current date time"
$CurrentDateTime = Get-Date
Write-Host $CurrentDateTime.DateTime

Write-Host ""
Write-Host ":: Runtime"
$RunTime = (Get-Date).Subtract($CurrentDateTime)
Write-Host $RunTime

Write-Host ""
Write-Host ":: Calculating the date today at 04:05:06, seven months in the past."
$ThePast = (Get-Date -Hour 4 -Minute 5 -Second 6).AddMonths(-7)
Write-Host $ThePast

Write-Host ""
Write-Host ":: Formating the current datetime output to my favorit way >>yyyyddmm_hhmmss<<."
Get-Date -Format "yyyyddMM_HHmmss"
