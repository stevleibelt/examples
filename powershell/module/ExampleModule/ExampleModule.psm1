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

Function Get-Values
{
    return @(
        'foo'
        'bar'
        'foobar'
            )
}

Function List-Values
{
    Write-Host ":: Listing values."

    ForEach ($CurrentValue in Get-Values) {
        Write-Host "   ${CurrentValue}"
    }
}

#Export-ModuleMember -Function List-Values
