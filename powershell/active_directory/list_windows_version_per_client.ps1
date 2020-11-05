#!/usr/bin/env pwsh
####
# List windows version per client
####
# @since 2020-11-08
# @author stev leibelt <artodeto@bazzline.net>
####

#bo: variable
#@see: https://en.wikipedia.org/wiki/Windows_10_version_history
#[
#  <string: build version> => <string: winver>
#]
$Windows10BuildToVersionToWinVersion = @{
    '10.0 (10240)' = '1507'
    '10.0 (10586)' = '1511'
    '10.0 (14393)' = '1607'
    '10.0 (15063)' = '1703'
    '10.0 (16299)' = '1709'
    '10.0 (17134)' = '1803'
    '10.0 (17763)' = '1809'
    '10.0 (18362)' = '1903'
    '10.0 (18363)' = '1909'
    '10.0 (19041)' = '2004'
    '10.0 (19042)' = '20H2'
}

#[
#    <string: operating system> => [
#        <string: build> => [
#            <string: hostname> => <string: sid>
#        ]
#    ]
#]
$OperatingSystemToBuildHashTable = @{
    "Windows 7 Professional" = @{}
    "Windows 10 Pro" = @{}
}
#eo: variable

#bo: fetching all client pc information from the ad
#Returns something like
#Name,OperatingSystem,OperatingSystemVersion
#My-HostName,Windows 10 Pro,10.0 (18363)
Get-ADComputer -Filter { (Enabled -eq $true) -and (OperatingSystem -notlike "*server*") } -Properties Name,OperatingSystem,OperatingSystemVersion,SID | 
ForEach {

    $BuildVersion = $_.OperatingSystemVersion
    $HostName = $_.Name
    $OperatingSystem = $_.OperatingSystem
    $Sid = $_.SID #actually we don't need the sid but this way we are using hash tables for the whole collection

    If ($OperatingSystemToBuildHashTable.ContainsKey($OperatingSystem)) {
        If ($OperatingSystemToBuildHashTable[$OperatingSystem].ContainsKey($BuildVersion)) {
            $OperatingSystemToBuildHashTable[$OperatingSystem][$BuildVersion].Add($HostName, $Sid)
        } Else {
            $HostNameToSid = @{
                $HostName = $Sid
            }

            $OperatingSystemToBuildHashTable[$OperatingSystem].Add(
                 $BuildVersion, $HostNameToSid
            )
        }
    } Else {
        Write-Host ("Unsupported Windows Version >>" + $OperatingSystem + "<< detected. Hostname: >>" + $HostName + "<<, Buildversion: >>" + $BuildVersion + "<<.")
    }
}
#eo: fetching all client pc information from the ad

#bo: general output
#| windows version | build | amount of detected devices |
ForEach ($OperatingSystem in $OperatingSystemToBuildHashTable.keys) {
    Write-Host (":: " + $OperatingSystem)
    ForEach ($BuildVersion in $OperatingSystemToBuildHashTable[$OperatingSystem].keys) {
        Write-Host ("   " + $BuildVersion + " has " + $OperatingSystemToBuildHashTable[$OperatingSystem][$BuildVersion].Count + " Hosts")
    }
}
#eo: general output

#bo: filtered and detailed output
################
#  ask if you want to display more
#  ask if you want to filter for os (0 no filter, 1 windows 10, 2 windows 7)
#  ask if you want to filter per build (0 no filter, 1 windows 10, 2 windows 7)
#  ask if you want to dump it on the screen or in a csv file
################
$YouWantToKnowMore = Read-Host "Do you want to know more? (y/N)"
$DisplayMore = $false

If ($YouWantToKnowMore -like "y") {
    $FilterAgainstBuildVersion = $false
    $FilterAgainstOperatingSystem = $false
    $DisplayMore = $true

    #bo: filter against operating system
    Write-Host ("Do you want to filter against operation system?")

    $InputToOperationSystem = @{}
    $Iterator = 1;
    Write-Host "  0) No filter"

    ForEach ($OperatingSystem in $OperatingSystemToBuildHashTable.Keys) {
        Write-Host ("  " + $Iterator + ") " + $OperatingSystem)
        $InputToOperationSystem.Add($Iterator, $OperatingSystem)
        ++$Iterator
    }

    $InputOfSelectedOperationSystem = Read-Host "Please input a number."
    $InputOfSelectedOperationSystem = [int]$InputOfSelectedOperationSystem

    #If ([int]::TryParse($InputOfSelectedOperationSystem)) {
    #    $InputOfSelectedOperationSystem = [int]::Parse($InputOfSelectedOperationSystem)
    #} Else {
    #    $InputOfSelectedOperationSystem = 0
    #}

    If ($InputToOperationSystem.ContainsKey($InputOfSelectedOperationSystem))
    {
        #bo: filter against build version
        $FilterAgainstOperatingSystem = $true
        $InputToBuildVersion = @{}
        $SelectedOperatingSystem = $InputToOperationSystem[$InputOfSelectedOperationSystem]

        If ($OperatingSystemToBuildHashTable[$SelectedOperatingSystem].Count -gt 1) {
            Write-Host "Wollen Sie nach einer Build Version Filtern?"

            $Iterator = 1;
            Write-Host "  0) No filter"

            ForEach ($BuildVersion in $OperatingSystemToBuildHashTable[$SelectedOperatingSystem].Keys) {
                Write-Host ("  " + $Iterator + ") " + $BuildVersion)
                $InputToBuildVersion.add($Iterator, $BuildVersion)
                ++$Iterator
            }

            $InputOfSelectedBuildSystem = Read-Host "Please input a number."

            $InputOfSelectedBuildSystem = [int]$InputOfSelectedBuildSystem
            #If ([int]::TryParse($InputOfSelectedBuildSystem)) {
            #    $InputOfSelectedBuildSystem = [int]::Parse($InputOfSelectedBuildSystem)
            #} Else {
            #    $InputOfSelectedBuildSystem = 0
            #}

            If ($InputToBuildVersion.ContainsKey($InputOfSelectedBuildSystem)) {
                $SelectedBuildVersion = $InputToBuildVersion[$InputOfSelectedBuildSystem]
                $FilterAgainstBuildVersion = $true
            } Else {
                Write-Host "  We won't filter against build version."
            }
            #eo: filter against build version
        }
    } Else {
        Write-Host "  We won't filter against operation systems."
    }
}
#eo: filtering output

#bo: output
If ($DisplayMore -eq $true) {
    #bo: ask dump to csv
    $DumpToCsvInsteadOfDumpToScreen = Read-Host "Do you want to save the output in a csv file? (y/N)"
    $DumpToCsv = $false

    If ($DumpToCsvInsteadOfDumpToScreen -eq "y") {
        $CurrentDate = Get-Date -Format "yyyyMMdd_HHmmss"
        $DesktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
        $DumpToCsv = $true

        $filePath = ($DesktopPath + "\windows_clients_list_" + $CurrentDate + ".csv")
    }
    #eo: ask dump to csv

    #bo: prepare output
    $PreparedOutput = New-Object System.Collections.ArrayList

    ForEach ($OperatingSystem in $OperatingSystemToBuildHashTable.keys) {
        Write-Host (":: " + $OperatingSystem)
        ForEach ($BuildVersion in $OperatingSystemToBuildHashTable[$OperatingSystem].keys) {
            ForEach ($HostName in $OperatingSystemToBuildHashTable[$OperatingSystem][$BuildVersion].keys) {
                $AddItemToPreparedOutput = $true

                If ($FilterAgainstOperatingSystem -eq $true) {
                    $AddItemToPreparedOutput = $false
                    If ($OperatingSystem -eq $SelectedOperatingSystem) {
                        If ($FilterAgainstBuildVersion -eq $true) {
                            If ($BuildVersion -eq $SelectedBuildVersion) {
                                $AddItemToPreparedOutput = $true
                            }
                        } Else {
                            $AddItemToPreparedOutput = $true
                        }
                    }
                }

                If ($AddItemToPreparedOutput -eq $true) {
                    $Item = New-Object –TypeName PSObject –Prop @{
                        OperatingSystem = $OperatingSystem
                        WinVer = If ($Windows10BuildToVersionToWinVersion.ContainsKey($BuildVersion)) { $Windows10BuildToVersionToWinVersion[$BuildVersion] } Else { "" }
                        BuildVersion = $BuildVersion
                        HostName = $HostName
                    }
                    $PreparedOutput.Add($Item) | Out-Null
                }
            }
        }
    }
    #eo: prepare output

    #bo: output
    If ($DumpToCsv -eq $true) {
        $PreparedOutput | Export-Csv -Path $filePath -NoTypeInformation
        Write-Host ":: CSV file created."
        Write-Host ("   Path: >>" + $filePath + "<<")
    } Else {
        $PreparedOutput | Format-Table
    }
}
#eo: output
