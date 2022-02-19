#!/usr/bin/env pwsh
####
# @see
#   https://arcanecode.com/2021/10/04/fun-with-powershell-write-debug/
# @since 2021-10-05
# @author stev leibelt <artodeto@bazzline.net>
####

Function My-FunctionName()
{
    [CmdletBinding()]
    param(
    )

    Write-Host "This is a normal message."
    Write-Debug "This is a verbose message to all the developers out there."
}

#preserve current set settings
$OldDebugPreference = $DebugPreference
#there are a lot of DebugPrefence values
#   "Continue" - Continue code execution and display debug messages
#   "Inquire" - Pause code execution and display debug messages
#   "SilentlyContinue" - Continue code execution and do not display debug messages
#   "Stop" - Stops code execution and display debug messages
#
#you can play around with them or use it to write a debug message and stop
#   code execution if something unexpected happens

$DebugPreference = "SilentlyContinue"
Write-Host $(":: Changed DebugPreference to >>" + $DebugPreference + "<<.")

Write-Host "   Calling function without anything."
My-FunctionName

Write-Host "   Calling function without -Debug."
My-FunctionName -Debug

$DebugPreference = "Continue"
Write-Host $(":: Changed DebugPreference to >>" + $DebugPreference + "<<.")

Write-Host "   Calling function without anything."
My-FunctionName

$DebugPreference = $OldDebugPreference
Write-Host $(":: Changed DebugPreference to >>" + $DebugPreference + "<<.")
