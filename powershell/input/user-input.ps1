#!/usr/bin/env pwsh
####
# Example how you can ask for user input
####
# @since 2021-09-15
# @author stev leibelt <artodeto@bazzline.net>
####

#uppercase N indicates that this is the default answer.
$YesOrNo = Read-Host -Prompt ':: Yes or no? (y|N) '
$UserName = Read-Host -Prompt ':: Input your user name.'

If ($UserName.Length -eq 0) {
    $UserName = 'Neo'
}

Write-Host $($UserName + " ...")

If ($YesOrNo.StartsWith('y')) {
    Write-Host "   Computer says yes."
} Else {
    Write-Host "   Computer says no."
}
