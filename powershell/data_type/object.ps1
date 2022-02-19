#!/usr/bin/env pwsh
####
# Example for some objects
####
# @since 2021-04-11
# @author stev leibelt <artodeto@bazzline.net>
####

#create object
$properties = @{
    name = @{
        first = "Arto"
        last = "Deto"
    }
}

$object = New-Object psobject -Propert $properties

#add property
Add-Member -InputObject $object -MemberType NoteProperty -Name "age" -Value 42

#output properties
$string = "First Name >>{0}<<, Last Name >>{1}<<, Age >>{2}<<." -f $object.name.first, $object.name.last, $object.age
Write-Host $string
