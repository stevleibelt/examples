#!/usr/bin/env pwsh
####
# Loops
####
# @see
#   https://arcanecode.com/2021/08/23/fun-with-powershell-loops/
# @since 2021-09-21
# @author stev leibelt <artodeto@bazzline.net>
####

$Maximum = 5

Write-Output ":: While."
$CurrentIterator = 0

While ($CurrentIterator -lt $Maximum) {
    Write-Output $("   " + $CurrentIterator)
    ++$CurrentIterator
}

Write-Output ":: Do While."
$CurrentIterator = 0

Do {
    Write-Output $("   " + $CurrentIterator)
    ++$CurrentIterator
} While ($CurrentIterator -lt $Maximum)

Write-Output ":: Do Until."
$CurrentIterator = 0

Do {
    Write-Output $("   " + $CurrentIterator)
    ++$CurrentIterator
} Until ($CurrentIterator -gt $Maximum)

Write-Output ":: For."
For ($CurrentIterator = 0; $CurrentIterator -lt $Maximum; ++$CurrentIterator) {
    Write-Output $("   " + $CurrentIterator)
}

Write-Output ":: ForEach."
$Array = @(1,2,3,4)

ForEach ($CurrentItem In $Array) {
    Write-Output $("   " + $CurrentItem)
}
