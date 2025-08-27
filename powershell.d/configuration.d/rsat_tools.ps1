#!/usr/bin/env pwsh
####
# @see http://woshub.com/install-rsat-feature-windows-10-powershell/
# @since 2021-09-14
# @author stev leibelt <artodeto@bazzline.net>
####

Write-Host ":: Listing available RSAT-Tools."
Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State

Write-Host ""
Write-Host ":: If you want to install all RSAT-Tools."
Write-Host "   Run >>Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability Online<<"

Write-Host ""
Write-Host ":: If you want to install all missing RSAT-Tools."
Write-Host "   Run >>Get-WindowsCapability -Name RSAT* -Online | where State -EQ NotPresent | Add-WindowsCapability Online<<."
