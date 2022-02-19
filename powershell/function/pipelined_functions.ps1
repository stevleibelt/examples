#!/usr/bin/env pwsh
####
# @see
#   https://arcanecode.com/2021/09/13/fun-with-powershell-pipelined-functions/
# @since 2021-09-22
# @author stev leibelt <artodeto@bazzline.net>
####

####
# [CmdletBinding] - signals PowerShell that this is an advanced function
# (ValueFromPipeline) - With this attribute set, PowerShell will copy each incomming object into the variable named $File
# begin - if not used, you can omit it. kind of a "setUp" section
# process - is called to work with the current copied object
# end - if not used, you can omit it. kind of a "tearDown" section
####
Function Get-PSFiles ()
{
    [CmdletBinding()]
    param (
        [Parameter (ValueFromPipeline)] $File
    )

    begin {
        $ListOfPipedInFileNames = @()
    }
    process {
        $ListOfPipedInFileNames += $File.Name
        If ($File.Name -like "*.ps1") {
            return $("   >>$($File.Name)<< is a powershell file.")
        }
    }
    end {
        Write-Host ":: Dumping list of piped in/processed file names."
        $ListOfPipedInFileNames
    }
}

Get-ChildItem | Get-PSFiles | Sort-Object -Descending
