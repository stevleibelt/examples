#!/usr/bin/env pwsh
####
# @see
#   https://arcanecode.com/2021/09/20/fun-with-the-powershell-switch-parameter/
# @since 2021-09-22
# @author stev leibelt <artodeto@bazzline.net>
####

Function Get-AName ()
{
    [CmdletBinding()]
    param(
        [switch] $LowerCase,
        [switch] $UpperCase
    )

    $ArrayOfName = @(
        'Bernd',
        'Olga',
        'Herrmann',
        'Tillmann',
        'Marko',
        'Ramsauer'
    )

    $name = $($ArrayOfName |Get-Random).ToString()

    If ($LowerCase.IsPresent) {
        $name = $name.ToLower()
    } ElseIf ($UpperCase.IsPresent) {
        $name = $name.ToUpper()
    }

    return $name
}

Get-AName
