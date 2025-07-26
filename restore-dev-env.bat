@echo off
set BACKUP_DIR=dev-config-backup

:: === Reinstall NPM ===
if exist npm-global-packages.txt (
  echo 📦 Reinstalling Global NPM Packages...
  for /f "tokens=*" %%i in ('type npm-global-packages.txt ^| findstr /v "──" ^| findstr /v "npm@"') do (
    for /f "tokens=1 delims=@" %%a in ("%%i") do (
      echo Installing %%a...
      npm install -g %%a
    )
  )
)

:: === Python ===
if exist python-packages.txt (
  echo 🐍 Reinstalling Python Packages...
  pip install -r python-packages.txt
)

:: === Rust ===
if exist rust-packages.txt (
  echo 🦀 Reinstalling Rust Tools...
  for /f "tokens=1" %%a in ('type rust-packages.txt ^| findstr "Installed"') do cargo install %%a
)

:: === VS Code Extensions ===
if exist vscode-extensions.txt (
  echo 🧩 Reinstalling VS Code Extensions...
  for /f "tokens=*" %%i in (vscode-extensions.txt) do (
    code --install-extension %%i
  )
)

:: === VS Code Settings ===
if exist "%BACKUP_DIR%\vscode-settings.json" copy /Y "%BACKUP_DIR%\vscode-settings.json" "%APPDATA%\Code\User\settings.json" >nul

:: === Git Config ===
if exist "%BACKUP_DIR%\.gitconfig" copy /Y "%BACKUP_DIR%\.gitconfig" "%USERPROFILE%\.gitconfig" >nul

:: === Bash/Zsh ===
if exist "%BACKUP_DIR%\.bashrc" copy /Y "%BACKUP_DIR%\.bashrc" "%USERPROFILE%\.bashrc"
if exist "%BACKUP_DIR%\.zshrc" copy /Y "%BACKUP_DIR%\.zshrc" "%USERPROFILE%\.zshrc"

echo ✅ Restore Complete!
pause
