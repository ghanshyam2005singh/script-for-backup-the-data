# 🧰 Dev Environment Backup & Restore

This project contains **batch scripts** to help Windows users **backup and restore their complete development environment** — including all system-installed tools, package managers, programming tools, and IDE configurations.

---

## 📦 What’s Included?
This backup system captures everything you need to set up your dev environment again on a new or formatted system.

### ✅ Backs up:
- **System-installed programs** (Node.js, Python, VS Code, Git, Docker, etc.)
- **NPM global packages** (`npm list -g`)
- **Python pip packages** (`pip freeze`)
- **Rust cargo tools** (`cargo install --list`)
- **VS Code extensions** (`code --list-extensions`)
- **VS Code user settings** (JSON config)
- **Global Git config** (`.gitconfig`)
- **Shell config files** (e.g., `.bashrc`, `.zshrc` if present)
- **Current PATH environment variable**

---

## 📁 Project Structure
```
dev-env-backup/
├── backup-dev-env.bat          # Backup script
├── restore-dev-env.bat         # Restore script
├── README.md                   # This file
├── dev-environment-backup.txt # Human-readable summary (auto-generated)
├── npm-global-packages.txt     # npm tools list (auto-generated)
├── python-packages.txt         # pip tools list (auto-generated)
├── rust-packages.txt           # cargo tools list (auto-generated)
├── vscode-extensions.txt       # VS Code extensions list (auto-generated)
└── dev-config-backup/          # Config folder
    ├── vscode-settings.json
    ├── .gitconfig
    ├── .bashrc (if exists)
    └── .zshrc (if exists)
```

---

## 🚀 How to Use

### 🔧 1. Backup Your System
Run this when your dev setup is ready:
```bat
backup-dev-env.bat
```
This will:
- Create tool lists (`npm`, `pip`, `cargo`, `code`)
- Copy config files (VS Code settings, `.gitconfig`, etc.)
- Create a text report: `dev-environment-backup.txt`
- Store all config files in: `dev-config-backup/`

### ♻️ 2. Restore on New System
Once you're on a new laptop or clean install:
```bat
restore-dev-env.bat
```
This will:
- Reinstall all tools listed in backup
- Restore VS Code settings and extensions
- Restore `.gitconfig`, `.bashrc`, `.zshrc` (if available)

---

## 🛠 Requirements
Ensure the following are installed before using the scripts:

| Tool     | Required For         |
|----------|----------------------|
| Node.js  | Global NPM packages  |
| Python   | pip packages         |
| Rust     | Cargo tools          |
| Git      | Git config restore   |
| VS Code  | Extensions/settings  |

> Also make sure `code` command is available in PATH: 
> `Ctrl+Shift+P → Shell Command: Install 'code' command in PATH`

---

## 🛡 Tips for Long-Term Backup

- ✅ **Push to GitHub (Private Repo)**
```bash
git init
git remote add origin https://github.com/yourname/dev-env-backup.git
git add .
git commit -m "Initial backup"
git push -u origin main
```

- ☁️ **Cloud Upload**
  - Google Drive
  - Dropbox
  - OneDrive

- 🔁 **Repeat backup regularly** after major changes

---

## 📌 Optional Improvements
- Date-stamped versions for regular snapshots
- Auto-upload to cloud via script
- Integration with GitHub Actions

---

Made with ❤️ to keep your dev environment safe, portable, and recoverable.
