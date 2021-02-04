#!/usr/bin/env pwsh
####
# Arrays and hashtables
####
# @since 2021-02-04
# @author stev leibelt <artodeto@bazzline.net>
####

$string = "This is my Example String."

Write-Host $("Example string: >>" + $string + "<<.")

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
