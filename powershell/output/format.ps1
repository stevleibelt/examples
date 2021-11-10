#!/usr/bin/env pwsh
################
# @see
#   https://arcanecode.com/2021/07/19/fun-with-powershell-string-formatting/
# @since 2021-09-22
# @author stev leibelt <artodeto@bazzline.net>
################

Write-Host ":: String formatting aka printf for PowerShell."

$ItemNames = @(
    'One'
    'Two'
    'Seven',
    'Nine'
)

[string]::Format("Listing first item: >>{0}<<.", $ItemNames)

"Listing first item: >>{0}<<." -f $ItemNames

"{1} of {0}." -f $ItemNames[3], $ItemNames[2]

#Output hash table sorted and rename headline

$HashTable = @{
    "Name Zzz" = "Value One"
    "Name Aaa" = "Value Two"
}

$HashTable.GetEnumerator() | Sort Name | Format-Table @{Label='My alternative for name';Expression={$_.Name}},@{Label='My alternative for value';Expression={$_.Value}} -AutoSize

####
#@see https://devblogs.microsoft.com/powershell-community/how-to-use-formatenumerationlimit/
####
function Test-GlobalFormatEnumerationLimit
{
    Write-Host ":: Outputting more than four columns."

    Write-Host "   Outputting the first four processes before adapting \$FormatEnumerationLimit."
    Get-Process | Select-Object -Property Name, Threads -First 4
    #$FormatEnumerationLimit is behaving differently
    #   Local scoping is not working
    $OldFormatEnumerationLimit = $Global:FormatEnumerationLimit

    $Global:FormatEnumerationLimit = 1
    Write-Host "   Outputting the first four processes after adapting \$FormatEnumerationLimit."
    Get-Process | Select-Object -Property Name, Threads -First 4

    #You have to change it back
    $Global:FormatEnumerationLimit = $OldFormatEnumerationLimit
}

Test-GlobalFormatEnumerationLimit
