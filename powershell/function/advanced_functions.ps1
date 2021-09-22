#!/usr/bin/env pwsh
####
# @see
#   https://arcanecode.com/2021/09/06/fun-with-powershell-advanced-functions/
# @since 2021-09-22
# @author stev leibelt <artodeto@bazzline.net>
####

Function Multiply-TwoValues()
{
    [CmdletBinding()]
    param(
        [Parameter(
            Mandatory = $true
            , HelpMessage = "Enter first number"
            )
        ] [int] $firstValue
        , [Parameter(
            Mandatory = $true
            , HelpMessage = "Enter second number"
            )
        ] [int] $secondValue
    )

    return $firstValue * $secondValue
}

Multiply-TwoValues 3 7
Multiply-TwoValues -secondValue 7 -firstValue 3
Multiply-TwoValues
