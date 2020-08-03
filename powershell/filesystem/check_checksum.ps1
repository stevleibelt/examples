#!/usr/bin/env pwsh
####
# Calculate checksum/hash and compare it with an expected value
####
# @since 2020-08-03
# @author stev leibelt <artodeto@bazzline.net>
####

$pathToBinaryFile = $($PSScriptRoot + [IO.Path]::DirectorySeparatorChar + "data" + [IO.Path]::DirectorySeparatorChar + "foo")
$pathToSha1File = $($pathToBinaryFile + ".sha1")

If (test-path $pathToSha1File) {
    $calculatedFileHash = Get-FileHash -LiteralPath $pathToBinaryFile -Algorithm SHA1
    $sha1FileContent = Get-Content $pathToSha1File

    Write-Host ":: Checking file integrity."
    #we are expecting a sha1 file with one line of content.
    #   this one line should look like:<file name>\t<sha1 sum>
    #we are exploding the expected content by " "
    #   first array entry is <file name>
    #   second array entry is \t
    #   third array entry is <sha1 sum>
    $arrayOfSha1FileContent = $sha1FileContent.Split(" ")
    #we also support the linux/unix way of sha1sum file content where the line of content is: <sha1sum>\t<file name>
    If ($arrayOfSha1FileContent[0].Length -eq 40) {
        $expectedFileHash = $arrayOfSha1FileContent[0]
    } ElseIf ($arrayOfSha1FileContent[2].Length -eq 40) {
        $expectedFileHash = $arrayOfSha1FileContent[2]
    } Else {
        Write-Host ":: Unexpected file content, neither first or third part of the sha1 file contains a sha1 checksum string."
        Exit(1)
    }

    If ($expectedFileHash -ne $calculatedFileHash.HASH) {
        Write-Host $("   Binary file integrity check failed. Expected checksum >>" + $expectedFileHash + "<<, current checksum >>" + $calculatedFileHash.HASH + "<<.")
    } else {
        Write-Host "   All is fine. Checksums are equal."
    }
} Else {
    Write-Host $(":: File path invalid >>" + $pathToSha1File + "<<.")
}
