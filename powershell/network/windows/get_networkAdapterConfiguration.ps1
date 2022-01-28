#!/usr/bin/env pwsh
####
# Shows interface/network adapter configuration
####
# @see:
#   https://devblogs.microsoft.com/scripting/powertip-use-powershell-to-find-mac-address/
#   https://itproguru.com/expert/2012/01/using-powershell-to-get-or-set-networkadapterconfiguration-view-and-change-network-settings-including-dhcp-dns-ip-address-and-more-dynamic-and-static-step-by-step/
# @since 2022-01-27
# @author stev leibelt <artodeto@bazzline.net>
####

Write-Host ":: Outputing important information for enabled NIC's."
Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName . | Select Index, Description, IPAddress, MacAddress
