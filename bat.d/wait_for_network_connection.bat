:: @see: https://www.shellhacks.com/batch-file-bat-wait-for-network-connection/
@ECHO OFF

set "IPADDRESS=8.8.8.8"

:TestNetworkConnection
ping -n 1 %IPADDRESS% |find "TTL=" >nul

if errorlevel 1 (
    goto Retry
) else (
    goto OutputOKAndPause
)

:Retry
ping 127.0.0.1 -n 6 >null REM wait for 5 seconds (-n %SECONDS%+1)
goto :TestNetworkConnection

:OutputOKAndPause
echo "Connection to %IPADDRESS% is OK."
pause
