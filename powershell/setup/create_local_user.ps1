#!/usr/bin/env pwsh
####
# Automatically creates a local user if it does not exist.
#
# Usage:
#   create_user.ps1 <string: name> [-IsAdmin]
####
# @todo
####
# @see  https://4sysops.com/archives/install-fonts-with-a-powershell-script/
# @since 2020-03-30
# @author stev leibelt <artodeto@bazzline.net>
####

#define mandatory parameters
param(
    [Parameter(Mandatory=$true, Position=0)]
    [ValidateNotNull()]
    [string]$userName
    [switch]$isAdmin=$false
)

$userOrNull = Get-LocalUser | Where-Object {$_.Name -eq $userName}

If ($userOrNull -eq $null) {
    Write-Host $(":: Creating User >>" + $userName + "<<.")
    #@see: https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Security/Get-Credential?view=powershell-5.1
    $credential = Get-Credential -Message "Please input new user password." -UserName $userName
    #@see: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.localaccounts/new-localuser?view=powershell-5.1
    $user = New-LocalUser -Name $userName -PasswordNeverExpires -Password $credential.Password -Confirm
} Else {
    Write-Host $(":: User >>" + $userName + "<< exists.")
    $user = $userOrNull
    Write-Host "   Dumping properties:"
    $userOrNull | Get-Member
}

If ($isAdmin -eq $true) {
    $fullQualifiedUserName  = $($env:COMPUTERNAME + "\" + $userName)
    $groupName              = "Administrators"

    #this line only works on english windows systems
    $localGroupMemberOrNull = Get-LocalGroupMember -Name $groupName | Where-Object {$_.Name -eq $fullQualifiedUserName}

    If ($localGroupMemberOrNull -eq $null) {
        #@see: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.localaccounts/add-localgroupmember?view=powershell-5.1
        Add-LocalGroupMember -Group $groupName -Member $userName -Confirm
    } Else {
        Write-Host "   User is already a member of the local administrator group."
    }
}
