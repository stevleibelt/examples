#!/usr/bin/env pwsh
####
# Arrays and hashtables
####
# @see:
#   https://www.windowspro.de/script/strings-ersetzen-loeschen-powershell
# @since 2021-02-04
# @author stev leibelt <artodeto@bazzline.net>
####

$string = "This is my Example String."

Write-Host $("Example string: >>" + $string + "<<.")
Write-Host $("   In uppercase: >>" + $string.toUpper() + "<<.")
Write-Host $("   In lowercase: >>" + $string.toLower() + "<<.")

if ( $string.startsWith("Exa") )
{
    Write-Host "String starts with >>exa<<"
}

if ( $string.endsWith("ng.") )
{
    Write-Host "String ends with >>ng.<<"
}

if ( $string.contains("is") )
{
    Write-Host "String contains with >>is<<"
}

if ( -Not $string.contains("freedom") )
{
    Write-Host "String does not contain with >>freedom<<"
}

Write-Host ":: Replacing >>Example<< with >>Superduper<<."
Write-Host $string.Replace('Example', 'Superduper')
