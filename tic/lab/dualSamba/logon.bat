REM 
REM Sync client time with server
REM net time \\CORE\ /set /yes
REM
REM Add [temp] CORE share as T:
net use t: /delete /yes
net use t: \\CORE\temp /yes
