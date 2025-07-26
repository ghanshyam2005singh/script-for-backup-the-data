@echo off
setlocal ENABLEDELAYEDEXPANSION

set OUTPUT=dev-environment-backup.txt
set BACKUP_DIR=dev-config-backup

:: Create/clear output
if exist %OUTPUT% del %OUTPUT%
if not exist %BACKUP_DIR% mkdir %BACKUP_DIR%

:: === HEADLINE ===
echo =============================== >> %OUTPUT%
echo  DEV ENVIRONMENT BACKUP REPORT  >> %OUTPUT%
echo =============================== >> %OUTPUT%
echo. >> %OUTPUT%

:: === Installed Programs ===
echo [1] Installed Programs (Windows) >> %OUTPUT%
powershell -Command "Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Sort-Object DisplayName | Format-Table -AutoSize | Out-String" >> %OUTPUT%
echo. >> %OUTPUT%

:: === Global NPM Packages ===
echo [2] Global NPM Packages >> %OUTPUT%
call npm list -g --depth=0 > npm-global-packages.txt 2>&1
call type npm-global-packages.txt >> %OUTPUT%
echo. >> %OUTPUT%

:: === Python Packages ===
echo [3] Python pip Packages >> %OUTPUT%
call pip freeze > python-packages.txt 2>&1
call type python-packages.txt >> %OUTPUT%
echo. >> %OUTPUT%

:: === Rust Packages ===
echo [4] Rust Cargo Packages >> %OUTPUT%
call cargo install --list > rust-packages.txt 2>&1
call type rust-packages.txt >> %OUTPUT%
echo. >> %OUTPUT%

:: === VS Code Extensions ===
echo [5] VS Code Extensions >> %OUTPUT%
call code --list-extensions > vscode-extensions.txt 2>&1
call type vscode-extensions.txt >> %OUTPUT%
copy "%APPDATA%\Code\User\settings.json" "%BACKUP_DIR%\vscode-settings.json" >nul
echo VS Code settings backed up to %BACKUP_DIR%\vscode-settings.json >> %OUTPUT%
echo. >> %OUTPUT%

:: === PATH Variable ===
echo [6] System PATH Variable >> %OUTPUT%
echo %PATH% >> %OUTPUT%
echo. >> %OUTPUT%

:: === Git Config ===
echo [7] Git Global Config >> %OUTPUT%
git config --global --list >> %OUTPUT% 2>&1
copy "%USERPROFILE%\.gitconfig" "%BACKUP_DIR%\.gitconfig" >nul
echo Git config saved to %BACKUP_DIR%\.gitconfig >> %OUTPUT%
echo. >> %OUTPUT%

:: === Bash/Zsh Config ===
if exist "%USERPROFILE%\.bashrc" copy "%USERPROFILE%\.bashrc" "%BACKUP_DIR%\.bashrc" >nul
if exist "%USERPROFILE%\.zshrc" copy "%USERPROFILE%\.zshrc" "%BACKUP_DIR%\.zshrc" >nul

echo 🔁 Backup complete!
echo 📄 Output: %OUTPUT%
echo 📁 Configs in folder: %BACKUP_DIR%
pause
