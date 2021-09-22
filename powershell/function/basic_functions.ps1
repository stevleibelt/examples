#!/usr/bin/env pwsh
####
# @see
#   https://arcanecode.com/2021/08/30/fun-with-powershell-basic-functions/
# @since 2021-09-22
# @author stev leibelt <artodeto@bazzline.net>
####

Function Multiply-TwoValues($firstValue, $secondValue)
{
    return $firstValue * $secondValue
}

Multiply-TwoValues 3 7
Multiply-TwoValues -secondValue 7 -firstValue 3
