:: ================
:: Starts procmon on a remote pc, waits until you are done and opens log with procmon.
::
:: Usage:
::  log_psexec_on_a_remote_pc_and_view_it_with_procman.bat <string: computer name>
:: ================
:: @see: https://4sysops.com/archives/using-process-monitor-procmon-remotely/
:: @since: 2020-03-13
:: @author: stev leibelt <artodeto@bazzline.net>
:: ================

@ECHO OFF
:: start logging on remote system
Psexec.exe -sd \\%1 procmon -accepteula -backinfile c:\temp\proc.pml
:: now wait until user hits enter
Pause

:: stop remote logging
Psexec.exe -sd \\%1 procmon -accepteula -terminate -quiet
:: copy remote log
Xcopy \\%1\c$\temp\proc.pml c:\temp\%1_proc.pml
:: remove remote log
Del \\%1\c$\temp\proc.pml

:: open log
Procmon.exe /openlog c:\temp\%1_proc.pml
