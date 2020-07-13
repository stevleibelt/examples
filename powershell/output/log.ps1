#!/usr/bin/env pwsh
################
# @since 2020-07-13
# @author artodeto@bazzline.net
################

#bo: setup
$logFilePath    = ($PSScriptRoot + "\log")
$logFileName    = '{0}_{1}_{2}.log' -f $env:computername,$currentDate,$currentTime

If (!(Test-Path $logFilePath)) {
    New-Item -Path $logFilePath -ItemType "directory"
}

$logFile = ($logFilePath + [IO.Path]::DirectorySeparatorChar + $logFileName)
#eo: setup

#bo: function
Function Log-Message {
    [cmdletbinding()]
    Param (
        [parameter(Mandatory=$true)] [string] $Message,
        [string] $LogLevel = "info"
    )

    $currentDate = Get-Date -Format "yyyyMMdd"
    $currentTime = Get-Date -Format "HHmmss"

    $logMessage = '{0} {1} [{2}]: {3}' -f $currentDate,$currentTime,$logLevel,$message

    $logMessage >> $logFile
}
#eo: function

#bo: main
Log-Message -Message "info log message"
Log-Message -Message "Debug log message" -LogLevel "debug"
#eo: main
