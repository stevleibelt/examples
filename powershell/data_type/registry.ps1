#!/usr/bin/env pwsh
####
# Registry
####
# @see
#   https://docs.microsoft.com/en-us/powershell/scripting/samples/working-with-registry-entries?view=powershell-7.2
#   https://devblogs.microsoft.com/scripting/use-powershell-to-easily-create-new-registry-keys/
# @since 2022-01-11
# @author stev leibelt <artodeto@bazzline.net>
####

Write-Host ":: Always check first, if the registry path exists."

$RegistryPath = "HKCU:Software\FooBar"

If (Test-Path $RegistryPath -eq $true) {
    Write-Host "   Path >>${RegistryPath}<< exists."
} Else {
    Write-Host "   Creating path >>${RegistryPath}<< exists."

    New-Item -Path $RegistryPath
}

If ((Get-Item -Path $RegistryPath ).GetValue('baz') -ne $null) {
    Write-Host "   Path >>${RegistryPath}<< has entry >>baz<<."
} Else {
    Write-Host "   Creating entry >>baz<< with value >>there is no foo without a bar<< in path >>${RegistryPath}<<."

    New-ItemProperty -Path $RegistryPath -Name "baz" -Value "there is no foo without a bar"

    Write-Host "   Outputting value."

    (Get-Item -Path $RegistryPath).GetValue('baz')
}

#cleanup
Write-Host ":: Cleaning my self made mess up."
Remove-Item -Path $RegistryPath
