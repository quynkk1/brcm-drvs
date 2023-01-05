echo off
title [v.1 Beta : quynkk] - Broadcom Wireless Device Installer

:checkadmin
cls
IF EXIST %SYSTEMROOT%\SYSTEM32\WDI\LOGFILES GOTO :RUN
ECHO This program required administrator privileged to run. Please re-run this program with administrator privileged. & Echo: & Echo Exiting ...
@TIMEOUT /T 10
goto :QUIT
:RUN
goto menu
:QUIT
exit

:menu
cls
echo --------------------------------------------------------------
echo               Broadcom Wireless Device Installer
echo --------------------------------------------------------------
echo.
echo Welcome to Broadcom Wireless Device Installer.
echo This tool will help you install your broadcom wireless device that you used for Hackintosh.
echo.
echo Do you want to continue? (Y/N)
set /p op=Your option:
if "%op%"=="y" goto yes
if "%op%"=="n" goto no
goto menu

:yes
echo.
echo Install Wireless Module first ...
::echo DEBUG: Install Driver
pnputil /add-driver ./dependencies/18x0/bcmwdidhdpcie.inf
pnputil /add-driver ./dependencies/15x017x0/bcmwdidhdpcie.inf
echo.
::DEBUG
::msg * /v Install Wireless Driver Successfully.
echo Then install Bluetooth Module...
pnputil /add-driver ./dependencies/bluetooth/bcbtums.inf
echo.
goto success

:success
cls
echo --------------------------------------------------------------
echo               Broadcom Wireless Device Installer
echo --------------------------------------------------------------
color 27
echo Install completed. Please restart your computer.
::msg * /v Install Broadcom Drivers Successfully. Restart your computer in 3 seconds.
::shutdown /r /t 3
pause

:no
echo Exiting ...
exit /b 1

::echo Install completed. Please restart your system.