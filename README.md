# Termux Antigravity CLI Installer & Runner

This repository provides scripts to install and run the **Google Antigravity CLI (`agy`)** on Android devices via **Termux** using a `proot-distro` Ubuntu environment. This setup allows you to run the fully featured CLI directly on your phone.

---

## ⚡ Quick Start (One-Line Commands)

### 1. Install Antigravity CLI
Run the following command in Termux to update your packages, install `proot-distro Ubuntu`, and set up the Antigravity CLI:
```bash
curl -fsSL https://raw.githubusercontent.com/AbuZar-Ansarii/CLI-Agents/main/agy_install.sh | bash
```

### 2. Run Antigravity CLI
To run `agy` against the files in your current working directory, run:
```bash
curl -fsSL https://raw.githubusercontent.com/AbuZar-Ansarii/CLI-Agents/main/run.sh | bash -s --
```
*(Tip: Pass any `agy` arguments after `--`, for example: `curl -fsSL https://raw.githubusercontent.com/AbuZar-Ansarii/CLI-Agents/main/run.sh | bash -s -- --help`)*

---

## 🛠️ Offline / Local Usage

If you prefer to clone this repository and run the scripts locally:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/AbuZar-Ansarii/CLI-Agents.git
   cd CLI-Agents
   ```

2. **Run the Installer:**
   ```bash
   chmod +x agy_install.sh
   ./agy_install.sh
   ```

3. **Run the CLI:**
   You can run `run.sh` from any project directory on your phone to run the CLI in that directory:
   ```bash
   path/to/CLI-Agents/run.sh [arguments]
   ```

---

## ⚙️ How It Works

* **`agy_install.sh`**: Installs `proot-distro`, sets up a minimal `ubuntu` environment, ensures required utilities like `curl` and `ca-certificates` are configured, and triggers the official Google Antigravity installation pipeline inside the container.
* **`run.sh`**: Automatically bind-mounts your current Termux directory to `/workspace` inside the Ubuntu container, allowing `agy` to seamlessly read and modify your local files.
