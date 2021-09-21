#!/usr/bin/env pwsh
####
# Hashtables
####
# @see
#   https://powershellexplained.com/2016-11-06-powershell-hashtable-everything-you-wanted-to-know-about/
#   https://arcanecode.com/2021/08/02/fun-with-powershell-hash-tables/
# @since 2020-04-03
# @author stev leibelt <artodeto@bazzline.net>
####

#define a hash table
#   empty one
$hashTable = @{}
#   inline defined hash table
$hashTable = @{'foo' = 'bar'; 'bar' = 'foo'}
#   ordered hash table
$hashTable = [ordered]@{}
#   pseudo object hash table
$hashTable = [pscustomobject]@{
    name = 'Max Power'
}
#   pre filled one
$hashTable = @{
    "foo" = "bar"
    "bar" = "foo"
    "foo bar" = "baz"
    "there is no foo" = "without a bar"
}
#   nested
$person = @{
    name = 'Judge Dredd'
    age = 1337
    location = @{
        city = 'Mega City One'
        state = 'Saxony'
    }
}

Write-Output ":: Outputting value of nested array."
Write-Output $("   As JSON >>" + $($person | ConvertTo-JSON) + "<<.")
Write-Output $("   Person.location.city >>" + $person.location.city + "<<.")

#add values
$hashTable.add('barfoo', 'baz')
#or combine hash tables
#   works only if both hash tables don't have the same key
$hashTable += @{14 = 'tralalal'}

#read single value
Write-Output ":: Outputting single key value."
Write-Output $("   foo >>" + $hashTable['foo'] + "<<.")
Write-Output $("   foo >>" + $hashTable.foo + "<<.")
Write-Output $("   foo bar >>" + $hashTable."foo bar" + "<<.")

Write-Output ":: Outputting size."
Write-Output $hashTable.Count

Write-Output ":: Checking if key exists."
If ($hashTable.ContainsKey('foo')) {
    Write-Output "   Key >>foo<< exists."
} Else {
    Write-Output "   Key does not >>foo<< exist."
}

Write-Output ":: Checking if value exists."
If ($hashTable.ContainsValue('baz')) {
    Write-Output "   Key >>baz<< exists."
} Else {
    Write-Output "   Key does not >>baz<< exist."
}

Write-Output ":: Outputting keys."
$hashTable.Keys

Write-Output ":: Outputting values."
$hashTable.Values

Write-Output ":: Outputting multiple key value."
#read multiple values, all three options are valid
Write-Output $hashTable[@('foo', 'bar')]
Write-Output $hashTable[('foo', 'bar')]
Write-Output $hashTable['foo', 'bar']

#iterating over a hash table
Write-Output ":: Outputting first level of key to value"
Write-Output "   Using ForEach"
ForEach ($key in $hashTable.Keys) {
    Write-Output $("  key >>" + $key + "<< value >>" + $hashTable.Item($key) + "<<.")
}

Write-Output "   Using GetEnumerator"
$hashTable.GetEnumerator() | ForEach-Object {
    Write-Output $("  key >>" + $_.Name + "<< value >>" + $_.Value + "<<.")
}

#sort output
Write-Output ":: Sort a hash table."
$hashTable | Sort-Object -Property @{e={$_.key}}

$copy = $hashTable.clone()  #create a copy but not a deep copy

#hints
#   export hash table to csv by casting it into a pseudo object
#$path = "hashTable.csv"
#Write-Debug $(":: Dumping hash table into file >>" + $path + "<<.")
#$hashTable | ForEach-Object{ [pscustomobject]$_ } | Export-CSV -Path $path
#   nested / multi dimensional hash tables are more difficult and can only be stored as json
#$path = "hashTable.json"
#Write-Debug $(":: Dumping hash table into file >>" + $path + "<<.")
#$hashTable | ConvertTo-JSON | Set-Content -Path $path

#check if current variable is a hash table
If ($hashTable -is [hashtable]) {
    Write-Output "Is a hash table"
}

#remove key
$hashTable.Remove("foo")
#or empty hash table
$hashTable.Clear()
