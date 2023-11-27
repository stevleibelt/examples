#!/usr/bin/env pwsh
####
# @see
#   https://arcanecode.com/2021/09/20/fun-with-the-powershell-switch-parameter/
# @since 2021-09-22
# @author stev leibelt <artodeto@bazzline.net>
####

Function Print-Menu ()
{
    Do {
        Clear-Host
        Write-Host "================ Main Menu ================"

        Write-Host "1: Press '1' for this option."
        Write-Host "2: Press '2' for this option."
        Write-Host "3: Press '3' for this option."
        Write-Host ""
        Write-Host "Q: Press 'Q' to quit."

        $UserSelection = Read-Host ":: Please make a selection."

        Switch ($UserSelection)
        {
            '1' {
                Write-Host "   You chose option >>1<<."
            } '2' {
                Write-Host "   You chose option >>2<<."
            } '3' {
                Write-Host "   You chose option >>3<<."
            } 'q' {
                Return
            }
        }

        Pause
    }
    While ($true)
}

Print-Menu
