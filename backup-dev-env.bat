@echo off
setlocal ENABLEDELAYEDEXPANSION

:: Output file path
set OUTPUT=dev-environment-backup.txt

:: Clear previous output
if exist %OUTPUT% del %OUTPUT%

:: Add Title
echo =============================== >> %OUTPUT%
echo  DEV ENVIRONMENT BACKUP REPORT  >> %OUTPUT%
echo =============================== >> %OUTPUT%
echo. >> %OUTPUT%

:: SECTION 1: Installed Programs
echo [1] Installed Programs (Windows) >> %OUTPUT%
powershell -Command "Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Sort-Object DisplayName | Format-Table -AutoSize | Out-String" >> %OUTPUT%
echo. >> %OUTPUT%

:: SECTION 2: NPM Global Packages
echo [2] Global NPM Packages >> %OUTPUT%
call npm list -g --depth=0 >> %OUTPUT% 2>&1
echo. >> %OUTPUT%

:: SECTION 3: Python Packages
echo [3] Python pip Packages >> %OUTPUT%
call pip freeze >> %OUTPUT% 2>&1
echo. >> %OUTPUT%

:: SECTION 4: Rust Cargo Packages
echo [4] Rust Cargo Packages >> %OUTPUT%
call cargo install --list >> %OUTPUT% 2>&1
echo. >> %OUTPUT%

:: SECTION 5: VS Code Extensions
echo [5] VS Code Extensions >> %OUTPUT%
call code --list-extensions >> %OUTPUT% 2>&1
echo. >> %OUTPUT%

:: SECTION 6: System PATH Variable
echo [6] System PATH Variable >> %OUTPUT%
echo %PATH% >> %OUTPUT%
echo. >> %OUTPUT%

:: Done
echo Backup complete. Output saved to %OUTPUT%
pause
