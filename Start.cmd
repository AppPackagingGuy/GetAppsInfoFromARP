@echo off
:loop
CLS
powershell.exe -noprofile -executionpolicy bypass -file "%~dp0GetAppsInfoFromARP.ps1"
ECHO.
PAUSE
GOTO :loop