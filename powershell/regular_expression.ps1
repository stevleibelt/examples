#!/usr/bin/env pwsh
####
# RegEx | RegExp | Regular Expression
####
# @see
#   https://sid-500.com/2021/11/09/powershell-and-regex-find-replace-occurrences/
# @since 2021-11-10
# @author stev leibelt <artodeto@bazzline.net>
####

$ListOfNames = 'Max Mustermann', 'Ürät Rögler'
$TestString = "artodeto@bazzline.net"

Write-Host ":: We are using the following test string >>${TestString}<<."
Write-Host "   Case sensitive is used in -match."
Write-Host "   Case insensitive is used in -cmatch."

Write-Host "   Does it contain letters?"
$TestString -match '\w'

Write-Host "   Does it contain digits?"
$TestString -match '\d'

Write-Host "   Does it contain dots?"
$TestString -match '\.'

Write-Host "   Does it contain minus?"
$TestString -match '-'

Write-Host "   Does it start with an a?"
$TestString -match '^a'

Write-Host "   Does it start with an b?"
$TestString -match '^b'

Write-Host "   Does ist start with a lowercase letter?"
$TestString -match '^[a-z]'

Write-Host "   Does ist start with a number?"
$TestString -match '^[0-9]'

Write-Host "   Does ist end with a lowercase letter?"
$TestString -match '[a-z]$'

Write-Host "   Does ist end with a number?"
$TestString -match '[0-9]$'

Write-Host "   Is the E-Mail-Adress valid plus does the TLD has a length of two between four letters?"
$TestString -match '^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]{2,4}$'

Write-Host ""
Write-Host ":: Now to a bit of search and replace."

Write-Host "   Search and replace german umlauts, but only if the variable contains letters."
$ListOfNames -match '[^a-zA-Z ]' -replace 'ü','ue' -replace 'ä','ae' -replace 'ö','oe'
