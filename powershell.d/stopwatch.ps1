#!/usr/bin/env pwsh
####
# Stopwatch example
####
# @see https://www.windowspro.de/script/stoppuhr-powershell-einrichten
# @since 2021-xx-xx04-22
# @author stev leibelt <artodeto@bazzline.net>
####

#available methods
#$stopWatch | Get-Member
#   Equals(obj): bool
#   GetHashCode: int
#   GetType: type
#   Reset: void
#   Restart: void
#   Start: void
#   Stop: void
#   ToString: string
#   Elapsed: timespan
#   ElapsedMilliseconds: long
#   ElapsedTicks: long
#   IsRunning: bool

$stopWatch = [system.diagnostics.stopwatch]::StartNew()
$stopWatch.Elapsed

$stopWatch.stop()
$stopWatch.Elapsed
