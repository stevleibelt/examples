#!/usr/bin/env pwsh
####
# Enum example
####
# @see
#   https://arcanecode.com/2022/01/10/fun-with-powershell-objects-pscustomobject/
# @since 2022-01-18
# @author stev leibelt <artodeto@bazzline.net>
####

####
# Helper function to create custom objects with well known properties.
#
# @return: <PSCustomObject> {
#   Schema: <string>
#   Table: <string>
#   Comment: <string>
# }
####
Function Create-MyObject
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string] $Schema,

        [Parameter(Mandatory = $true)]
        [string] $Table,

        [Parameter(Mandatory = $true)]
        [string] $Comment
    )
    
    #creating properties - yes it is a hash table
    $Properties = [ordered]@{
        Schema = $Schema
        Table = $Table
        Comment = $Comment
    }

    #creating new object
    $Object = New-Object -Type PSObject -Property $Properties

    #adding properties after creating the object
    ##way one
    Add-Member -InputObject $Object -MemberType NoteProperty -Name MyFirstProperty -Value 'MyFirstProperty'
    ##way two
    $Object | Add-Member -MemberType NoteProperty -Name MySecondProperty -Value 'MySecondProperty'

    #creating a method
    ##first, create a variable containing the script block for the methods
    $MyToStringMethodBlock = {
        param (
            [Parameter(Mandatory = $false)]
            [string] $ValueStartString = '>>',

            [Parameter(Mandatory = $false)]
            [string] $ValueEndString = '<<'
        )

        $ObjectPropertiesAsString = "Schema: ${ValueStartString}$($this.Schema)<<, Table: ${ValueStartString}($this.Table)${ValueEndString}, Comment: ${ValueStartString}$($this.Comment)${ValueEndString}, MyFirstPropertiy: ${ValueStartString}$($this.MyFirstProperty)${ValueEndString}, MySecondProperty: ${ValueStartString}$($this.MySecondProperty)${ValueEndString}"


        return $ObjectPropertiesAsString
    }
    ##second, add this block as property
    Add-Member -InputObject $Object -MemberType ScriptMethod -Name 'MyToString' -Value $MyToStringMethodBlock

    #return
    return $Object
}

$MyFirstObject = Create-MyObject 'My Schema' 'My Table' 'My Comment'

Write-Host ":: Outputting content of MyFirstObject."
Write-Host $MyFirstObject
Write-Host ""

Write-Host ":: Outputting MyFirstObject.GetType()."
$MyFirstObject.GetType()
Write-Host ""

Write-Host ":: Calling MyFirstObject.MyToString()."
Write-Host $MyFirstObject.MyToString()
Write-Host ""

Write-Host ":: Calling MyFirstObject.MyToString('=>', '<=')."
Write-Host $MyFirstObject.MyToString('=>', '<=')
Write-Host ""
