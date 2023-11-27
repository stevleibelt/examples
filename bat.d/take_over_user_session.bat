:: ================
:: Starts a taskmanager to connect to a running user session.
:: 
:: Usage:
::  take_over_user_session.bat <string: computer name>
:: ================
:: @see:
::  https://4sysops.com/archives/using-process-monitor-procmon-remotely/
::  https://docs.microsoft.com/de-de/windows-server/administration/windows-commands/taskkill
:: @since: 2020-03-19
:: @author: stev leibelt <artodeto@bazzline.net>
:: ================

@ECHO OFF
:: kill eventually running taskmanager
:: /IM <image name> - use program name instead of pid
:: /T - terminate tree (all child processes)
:: /F - force termination
taskkil /IM taskmgr.exe /T /F

:: open taskmanager by using PsExec
Psexec.exe -accepteula -SID taskmgr

exit
