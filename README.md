# 🧰 Dev Environment Backup & Restore

This setup helps you **backup and restore your full development environment** on Windows with one-click batch files.

## ✅ Backup Includes
- Installed Programs
- NPM Global Packages
- Python pip Packages
- Rust Cargo Tools
- VS Code Extensions
- VS Code Settings
- Git Config
- Bash/Zsh configs (if any)
- System PATH

## 📦 Files
| File | Purpose |
|------|---------|
| `backup-dev-env.bat` | Create full backup (tools, config, list) |
| `restore-dev-env.bat` | Restore tools and config from backup |
| `dev-environment-backup.txt` | Human-readable report of tools/extensions |
| `dev-config-backup/` | Folder with configs like `.gitconfig`, VS Code settings |

## 📂 How to Use
### Backup:
1. Double-click `backup-dev-env.bat`
2. Wait for process to finish
3. Files will be saved in this folder

### Restore:
1. On a new machine, copy backup folder
2. Run `restore-dev-env.bat`
3. Sit back and relax 😎

## 🛠 Prerequisites
- Node.js / npm
- Python / pip
- Rust / cargo
- Git
- VS Code (`code` CLI must be added to PATH)

## 🔐 Tips
- Push this folder to a **private GitHub repo** to preserve it forever
- Schedule regular backups using Windows Task Scheduler (optional)

---
Made with ❤️ to never lose your dev setup again.
