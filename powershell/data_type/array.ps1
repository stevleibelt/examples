#!/usr/bin/env pwsh
####
# Arrays and hashtables
####
# @see https://powershellexplained.com/2016-11-06-powershell-hashtable-everything-you-wanted-to-know-about/
# @since 2020-04-03
# @author stev leibelt <artodeto@bazzline.net>
####

####
#array
####

#define an array
$array = @(1,2,3,4,5)

#iterate over an array
ForEach ($item in $array) {
    Write-Output $item
}

#read and write access based on the index
#this will overwrite an existing or create a new one of nothing exists
$array[1337] = "mate"

####
#hash table
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
Write-Output $person.location.city
Write-Output $(person | ConvertTo-JSON)

#add values
$hashTable.add('barfoo', 'baz')
#or combine hash tables
#   works only if both hash tables don't have the same key
$hashTable += @{14 = 'tralalal'}

#read single value
Write-Output $hashTable['foo']
#read multiple values, all three options are valid
Write-Output $hashTable[@('foo', 'bar')]
Write-Output $hashTable[('foo', 'bar')]
Write-Output $hashTable['foo', 'bar']

#iterating over a hash table
ForEach ($key in $hashTable.keys) {
    Write-Output $("key: " + $key + ", value: " + $hashTable[$key])
}

$hashTable.GetEnumerator() | ForEach-Object {
    Write-Output $("key: " + $_.key + ", value: " + $_.value)
}

#sort output
$hashTable | Sort-Object -Property @{e={$_.key}}

#available public properties
Write-Host $hashTable.count    #gets the size of the hash table
Write-Host $hashTable.values    #gets all values
Write-Host $hashTable.keys    #gets all keys
$copy = $hashTable.clone()  #create a copy but not a deep copy

#hints
#   export hash table to csv by casting it into a pseudo object
$hashTable | ForEach-Object{ [pscustomobject]$_  } | Export-CSV -Path $path
#   nested / multi dimensional hash tables are more difficult and can only be stored as json
$hashTable | ConvertTo-JSON | Set-Content -Path $path

#check if current variable is a hash table
If ($hashTable -is [hashtable]) {
    Write-Host "Is a hash table"
}
