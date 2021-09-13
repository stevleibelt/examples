#!/usr/bin/env pwsh
####
# Calculate checksum/hash and compare it with an expected value
####
# @since 2020-08-03
# @author stev leibelt <artodeto@bazzline.net>
####

$pathToBinaryFile = $($PSScriptRoot + [IO.Path]::DirectorySeparatorChar + "data" + [IO.Path]::DirectorySeparatorChar + "foo")
$pathToSha1File = $($pathToBinaryFile + ".sha1")
$pathToOpenHashTabSha512File = $($pathToBinaryFile + ".sha512")

If (test-path $pathToSha1File) {
    $calculatedFileHash = Get-FileHash -LiteralPath $pathToBinaryFile -Algorithm SHA1
    $sha1FileContent = Get-Content $pathToSha1File

    Write-Host ":: Checking file integrity with sha1."
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

If (test-path $pathToOpenHashTabSha512File) {
    $calculatedFileHash = Get-FileHash -LiteralPath $pathToBinaryFile -Algorithm SHA512
    #remove each line starting with >>#<<
    $hashFileContent = Get-Content $pathToOpenHashTabSha512File | Select-String -pattern "^#" -NotMatch

    Write-Host ":: Checking file integrity with sha512."
    #we are expeting a sha512 file with multiple lines of comment.
    #   the first and only line with no comment is the line with the sha512sum and it looks like:<sha512 sum>\t*<file name>
    #we are exploding the expected content by " "
    #    first array entry is the <sha512sum>
    #    ...
    $arrayOfHashFileContent = $hashFileContent.ToString().Split(" ")
    $expectedFileHash = $arrayOfHashFileContent[0]

    If ($expectedFileHash.Length -eq 128) {
        If ($expectedFileHash -ne $calculatedFileHash.HASH) {
            Write-Host $("   Binary file integrity check failed. Expected checksum >>" + $expectedFileHash + "<<, current checksum >>" + $calculatedFileHash.HASH + "<<.")
        } else {
            Write-Host "   All is fine. Checksums are equal."
        }
    } Else {
        Write-Host ":: Unexpected file content, neither first or third part of the sha512 file contains a sha512 checksum string."
        Exit(1)
    }

} Else {
    Write-Host $(":: File path invalid >>" + $pathToOpenHashTabSha512File + "<<.")
}
