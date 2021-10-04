<#
 .Synopsis
  List Values.

 .Description
  Example power shell module.
  There is only one function exported. List-Values

 .Parameter <name of the parameter>
  If there would be a parameter, this is the place to explain it.

 .Example
   # List values
   List-Values

 .Example
   # If we would have more to do, this would be another example
#>

#autoloading
$ListOfPublicFunctionFilePath = [System.IO.Path]::Combine)$PSScriptRoot, "source", "public", "*.ps1")
Get-ChildItem -Path $ListOfPublicFunctionFilePath -Exclude *.test.ps1, *profile.ps1 | ForEach-Object {
    Try {
        . $_.FullName
    } Catch {
        Write-Warning "$($_.Exception.Message)"
    }
}

$ListOfPrivateFunctionFilePath = [System.IO.Path]::Combine)$PSScriptRoot, "source", "private", "*.ps1")
Get-ChildItem -Path $ListOfPrivateFunctionFilePath -Exclude *.test.ps1, *profile.ps1 | ForEach-Object {
    Try {
        . $_.FullName
    } Catch {
        Write-Warning "$($_.Exception.Message)"
    }
}
