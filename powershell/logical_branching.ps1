#!/usr/bin/env pwsh
####
# Logical branching
####
# @see
#   https://arcanecode.com/2021/08/09/fun-with-powershell-logic-branching/
# @since 2021-09-21
# @author stev leibelt <artodeto@bazzline.net>
####

$Value = 1

Write-Output ":: If Else"

If ($Value -eq 1) {
    Write-Output "   If branch"
} ElseIf ($Value -lt 3) {
    Write-Output "   ElseIf branch"
} Else {
    Write-Output "   Else branch"
}

Write-Output ":: Switch"

Switch ($Value) {
    1 {
        Write-Output "   Value is >>1<<."
    }
    '1' {
        Write-Output "   Value is >>'1'<<."
        Break
    }
    3 {
        Write-Output "   Value is >>3<<."
    }
    default {
        Write-Output "   Unexpected value."
        Break
    }
}
