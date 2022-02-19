#!/usr/bin/env pwsh
####
# Arrays
####
# @see
#   https://powershellexplained.com/2016-11-06-powershell-hashtable-everything-you-wanted-to-know-about/
#   https://arcanecode.com/2021/07/26/fun-with-powershell-arrays/
# @since 2020-04-03
# @author stev leibelt <artodeto@bazzline.net>
####

#define an array
$array = @(7,2,1,9,5)

#count size
Write-Output $(":: Array has a size of >>" + $array.Count + "<<.")
Write-Output $("   Last item of this array is >>" + $array[$array.Count - 1] + "<<.")
Write-Output $("   Second and third element of this array are >>" + $array[2, 3] + "<<.")

#only read access
$array[1] = "bar-foo"
$array[3] = "1337 mate"

#add an item to an array
$array += "foobar"

#iterate over an array
ForEach ($item in $array) {
    Write-Output "   ${item}"
}
#another way
#$array | ForEach-Object { $PSItem }
# or
#$array.ForEach({ $_ })

$arrayAsString = $array -join '-'
Write-Output $(":: Array as string >>" + $arrayAsString + "<<.")

$replacedArray = $array -replace "foo", "baz"
Write-Output ":: Replaced strings."
$replacedArray.ForEach({ Write-Output "   ${_}" })

#remove an item from an array
$filteredArray = $array | Where-Object { $PSItem -ne "foobar" }

Write-Output ":: Filtered array."
$filteredArray.ForEach({ Write-Output "   ${_}" })

$matchedArray = $array -match 'foo'

Write-Output ":: Matched array."
$matchedArray.ForEach({ Write-Output "   ${_}" })

#empty an array
$array = @()
#or
$array.Clear()
