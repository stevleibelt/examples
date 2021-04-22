#!/usr/bin/env pwsh
####
# Creates temporary file and directory
####
# @see https://devblogs.microsoft.com/powershell-community/borrowing-a-built-in-powershell-command-to-create-a-temporary-folder/
# @since 2021-04-22
# @author stev leibelt <artodeto@bazzline.net>
####

#more illustrated but not that efficient
Function New-TemporaryFolderOne
{
    #create temporary file for the name
    $temporaryFile = New-TemporaryFile

    #remove file to not run into issues on the filesystem
    Remove-Item $temporaryFile -Force

    #create folder by using the environment temp path plus the file name
    $temporaryFolder = New-Item -ItemType Directory -Path "${$ENV:Temp}\$($temporaryFile.Name)"

    return $temporaryFolder;
}

#the efficient way to go
Function New-TemporaryFolderTwo
{
    $temporaryFolder = New-Item -ItemType Directory -Path([System.IO.Path]::GetTempFileName())
}

$temporaryFile = New-TemporaryFile
$temporaryFile
Remove-Item $temporaryFile -Force

$temporaryFolderOne = New-TemporaryFolderOne
$temporaryFolderOne
Remove-Item -Path $temporaryFolderOne -Recurse -Force

$temporaryFolderTwo = New-TemporaryFolderTwo
$temporaryFolderTwo
Remove-Item -Path $temporaryFolderTwo -Recurse -Force
