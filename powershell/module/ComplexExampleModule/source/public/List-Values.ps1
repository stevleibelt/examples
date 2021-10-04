Function List-Values
{
    Write-Host ":: Listing values."

    ForEach ($CurrentValue in Get-Values) {
        Write-Host "   ${CurrentValue}"
    }
}
