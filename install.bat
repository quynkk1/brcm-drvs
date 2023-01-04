echo off
title Broadcom Wireless Installer

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
pnputil /add-driver ./dependencies/W1820A1830/bcmwdidhdpcie.inf
echo.
::DEBUG
::msg * /v Install Wireless Driver Successfully.
echo Then install Bluetooth Module...
pnputil /add-driver ./bluetooth/bcbtums.inf
echo.
echo Install completed. Please restart your computer.
::msg * /v Install Broadcom Drivers Successfully. Restart your computer in 3 seconds.
::shutdown /r /t 3
pause

:no
echo Exiting ...

::echo Install completed. Please restart your system.