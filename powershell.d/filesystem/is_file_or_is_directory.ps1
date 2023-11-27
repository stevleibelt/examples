#!/usr/bin/env pwsh
####
# Checks if the given path is a file or a directory
####
# @see https://stackoverflow.com/questions/39825440/check-if-a-path-is-a-folder-or-a-file-in-powershell
# @since 2021-12-16
# @author stev leibelt <artodeto@bazzline.net>
####

Function _example {
    $CurrentScriptPath = Split-Path $script:MyInvocation.MyCommand.Path

    $ListOfMatchingFileSystemItems = Get-ChildItem -Path $CurrentScriptPath

    ForEach ($MatchingFileSystemItem In $ListOfMatchingFileSystemItems) {
        $IsDirectory = Test-Path -Path $MatchingFileSystemItem -PathType Container
        $IsFile = Test-Path -Path $MatchingFileSystemItem -PathType Leaf

        $ItemName = Split-Path -Path $MatchingFileSystemItem -Leaf

        Write-Host ":: Checking filesystem item >>${ItemName}<<."

        If ($IsDirectory -eq $true) {
            Write-Host "   Is a directory."
        }

        If ($IsFile -eq $true) {
            Write-Host "   Is a file."
        }
    }
}

_example
