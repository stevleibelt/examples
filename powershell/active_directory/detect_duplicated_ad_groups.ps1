#!/usr/bin/env pwsh
####
# Detect duplicated ad groups
####
# @see https://www.powershellbros.com/powershell-tip-of-the-week-get-duplicated-ad-groups/
# @since 2020-03-18
# @author stev leibelt <artodeto@bazzline.net>
####

Try {
    $adQueryParameters = @{
        Filter      = "*"                                   #filter all
        Server      = ($env:LOGONSERVER -replace "\\", '')  #dynamically build current server by parsing environment variable and remove the "\\"
        Properties  = 'Mail'                                #select this property only
    }

    #fetch all ad groups based on the parameters
    $listOfAdGroup = Get-ADGroup @adQueryParameters | Select-Object $adQueryParameters.Properties

    #sanitize empty groups
    $listOfValidAdGroup = $listOfAdGroup | Where-Object {$_.mail.Length -gt 1}

    #free memory by removing possible big list
    Remove-Variable listOfAdGroup
    [System.GC]::Collect()
} Catch {
    Write-Host ":: And exception has happened."
    Write-Host $("   " + $_.Exception.Message)

    Read-Host "Press Enter to close the windows."
    Exit
}

#determine duplicates

$hashTable          = [ordered]@{  }
$listOfDuplicate    = @()

ForEach ($adGroup In $listOfValidAdGroup.mail) {
    Try {
        #we try to add this item to a hash table
        #if this is failing, the adGroup exists already
        $hashTable.add($adGroup, 0)
    } Catch [System.Management.Automation.MethodInvocationException] {
        $listOfDuplicate += $adGroup
    }
}

#output result

If ($listOfDuplicate) {
    Write-Host ":: Outputting detected duplicates."
    $listOfDuplicate
} Else {
    Write-Host ":: No duplicates detected."
}
