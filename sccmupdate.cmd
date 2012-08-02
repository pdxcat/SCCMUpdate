@echo off
REM Refresh SCCM Machine Policy on a computer or set of computers.
REM If target computer is not specified, SCCM Machine Policy is refreshed
REM on the local machine.
REM
REM Usage: sccmupdate.cmd [computer1] [computer2] [...]

if "%1"=="" (
	powershell.exe -Command "\\cecs\resources\programs\programs\tools\SCCMupdate.ps1 %COMPUTERNAME%"
)
:loop
if "%1"=="" goto continue
ping /n 1 /w 300 %1 > nul
if errorlevel 1 (
	echo %1 is down.
) else (
	powershell.exe -Command "\\cecs\resources\programs\programs\tools\SCCMupdate.ps1 %1"
)
shift
goto loop
:continue
