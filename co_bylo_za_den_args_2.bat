@echo off

echo "zadej den ?"
set /p den=""

echo "zadej mesic ?"
set /p mesic=""

echo "zadej rok ?"
set /p rok=""

REM echo "%den% %mesic% %rok%"
REM pause

REM powershell -file co_bylo_za_den_args_2.ps1 %den% %mesic% %rok%
co_bylo_za_den_args_2.exe %den% %mesic% %rok%

pause
@echo on



