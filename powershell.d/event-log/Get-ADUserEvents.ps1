#!/usr/bin/env pwsh
####
# List all tried logons from network
####
# @see
#   https://theposhwolf.com/howtos/Get-ADUserBadPasswords/
#   https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-eventlog?view=powershell-5.1
# @since 2023-01-26
# @author stev leibelt <artodeto@bazzline.net>
####


Function Get-ADUserEvents {
    [CmdletBinding(
        DefaultParameterSetName = 'All'
    )]
    Param (
        [Parameter(
            ValueFromPipeline = $true
        )]
        [string]$ExpectedAccountName
        ,
        [string]$StartDateTime
        ,
        [string]$EndDateTime
    )
    Begin {
        $LogonType = @{
            '2' = 'Interactive'
            '3' = 'Network'
            '4' = 'Batch'
            '5' = 'Service'
            '7' = 'Unlock'
            '8' = 'Networkcleartext'
            '9' = 'NewCredentials'
            '10' = 'RemoteInteractive'
            '11' = 'CachedInteractive'
        }
        $filterHt = @{
            LogName = 'Security'
            ID = 4624,4625
        }
        if ($PSBoundParameters.ContainsKey('StartTime')){
            $filterHt['StartTime'] = $StartDateTime
        }
        if ($PSBoundParameters.ContainsKey('EndTime')){
            $filterHt['EndTime'] = $EndDateTime
        }
        # Query the event log just once instead of for each user if using the pipeline
        $events = Get-WinEvent -FilterHashtable $filterHt
    }
    Process {
        #if we don't want to filter against anything more
        #$output = $events
        $output = $events | Where-Object {(($_.Properties[10].Value -eq '3') -or $_.Properties[10].Value -eq '7') -and ($_.Properties[5].Value -ne $ExpectedAccountName)}
        
        foreach ($event in $output){
            #$event | Select-Object -Property *
            #to get a list of all available properties, use the following
            #$event.Properties | Format-Table
            
            [pscustomobject]@{
                TargetAccount = $event.properties.Value[5]
                LogonType = $LogonType["$($event.properties.Value[10])"]
                CallingComputer = $event.Properties.Value[13]
                IPAddress = $event.Properties.Value[19]
                TimeStamp = $event.TimeCreated
            }
        }
    }
    End{}
}

#Get-ADUserEvents "<string: ad-user-name>" "17.14.2016 00:00:00" "17.14:2016 23:59:50"
