#!/usr/bin/env pwsh
################
# @see: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-progress?view=powershell-7.1
# @since: 2021-08-23
# @author: artodeto@bazzline.net
################

#bo: setup
#eo: setup

#bo: function
Function Display-NestedLoopProgress {

    Clear-Host

    Write-Host "::Begin of Display-NestedLoopProgress"

    $TotalAmount = 100;

    For ($I = 1; $I -le $TotalAmount; ++$I) {
        #We are taking care of the id to be able to reference to it
        Write-Progress -Activity "Display-NestedLoopProgress" -Status "$I / $TotalAmount complete:" -PercentComplete $I -CurrentOperation "Outer Loop" -Id 0

        For ($J = 1; $J -le $TotalAmount; ++$J) {
            #Importent here is that you provide explicit an id plus using the previously
            #   create id as reference/parent id
            Write-Progress -Activity "Display-NestedLoopProgress" -Status "$J / $TotalAmount complete:" -PercentComplete $J -CurrentOperation "Inner Loop" -Id 1 -ParentId 0
            #Not needed for real world example.
            Start-Sleep -Milliseconds 2
        }
    }

    Write-Host "::End of Display-NestedLoopProgress"
}

Function Display-SimpleLoopProgress {

    Clear-Host

    Write-Host "::Begin of Display-SimpleLoopProgress"

    $TotalAmount = 42;

    For ($CurrentStep = 1; $CurrentStep -le $TotalAmount; ++$CurrentStep) {
        Write-Progress -Activity "[Optional]: First line above the progress bar" -Status "Second line above the progress bar [ $CurrentStep / $TotalAmount ]" -PercentComplete (($CurrentStep / $TotalAmount) * 100) -CurrentOperation "[Optional]: Text below the progress bar."
        #Not needed for real world example.
        Start-Sleep -Milliseconds 100
    }

    Write-Host "::End of Display-SimpleLoopProgress"
}
#eo: function

#bo: main
Display-SimpleLoopProgress

Display-NestedLoopProgress
#eo: main
