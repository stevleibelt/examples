#!/usr/bin/env pwsh
####
# Shows IPAddress, ScopeId, ClientId (Mac Address!), Hostname, AddressState, LeaseExpireTime in your network
####
# @see https://thewayeye.net/posts/find-a-mac-microsoft-dhcp-forest/
# @since 2022-01-27
# @author stev leibelt <artodeto@bazzline.net>
####

$AllDhcpServers = Get-DhcpServerInDC

$ResultList = @(
    @($AllDhcpServers).foreach(
        {
            @(Get-DhcpServerv4Scope -ComputerName $_.DnsName | Get-DhcpServerv4Lease -ComputerName $_.DnsName -AllLeases -Verbose)
        }
    )
)

$ResultList
