#!/usr/bin/env pwsh
####
# @see https://4sysops.com/archives/deactivate-web-search-in-windows-10-using-group-policies/
# @since 2020-10-20
# @author stev leibelt <artodeto@bazzline.net>
####

if( -not (Test-Path -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer) ){
  New-Item HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer
}

Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name "DisableSearchBoxSuggestions" -Value 1 -Type DWord
