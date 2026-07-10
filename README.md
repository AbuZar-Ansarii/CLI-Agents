# Termux AI CLI Agent Installers

This repository provides scripts to install and run popular AI developer CLI agents on Android devices via **Termux**.

Currently supported CLI agents:
1. **Google Antigravity CLI (`agy`)** - Runs in a `proot-distro` Ubuntu container.
2. **OpenClaude CLI (`openclaude`)** - Runs directly inside Termux.

---

## ⚡ One-Line Installers & Runners

### 🤖 1. Google Antigravity CLI (`agy`)

#### Install:
Run the following command in Termux to update your packages, install `proot-distro Ubuntu`, and set up the Antigravity CLI:
```bash
curl -fsSL https://raw.githubusercontent.com/AbuZar-Ansarii/CLI-Agents/main/agy_install.sh | bash
```

#### Run:
To run `agy` against the files in your current working directory, run:
```bash
curl -fsSL https://raw.githubusercontent.com/AbuZar-Ansarii/CLI-Agents/main/run.sh | bash -s --
```
*(Tip: Pass any `agy` arguments after `--`, for example: `curl -fsSL https://raw.githubusercontent.com/AbuZar-Ansarii/CLI-Agents/main/run.sh | bash -s -- --help`)*

---

### 🧠 2. OpenClaude CLI (`openclaude`)

#### Install:
Run the following command in Termux to update packages, install Node.js, and globally install `openclaude`:
```bash
curl -fsSL https://raw.githubusercontent.com/AbuZar-Ansarii/CLI-Agents/main/openclaude_install.sh | bash
```
*(Alternatively, you can run the upstream script directly: `curl -sL "https://raw.githubusercontent.com/AbuZar-Ansarii/free-openclaude/master/vanila_install.sh" | bash`)*

#### Run:
OpenClaude runs natively inside Termux. Once installed, simply type:
```bash
openclaude
```

---

## 🛠️ Offline / Local Usage

If you prefer to clone this repository and run the scripts locally:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/AbuZar-Ansarii/CLI-Agents.git
   cd CLI-Agents
   ```

2. **Make scripts executable:**
   ```bash
   chmod +x *.sh
   ```

3. **Install Agents:**
   * For Antigravity CLI: `./agy_install.sh`
   * For OpenClaude: `./openclaude_install.sh`

4. **Run Agents:**
   * For Antigravity CLI: `./run.sh [arguments]` (runs bind-mounted to your current folder)
   * For OpenClaude: `openclaude`

---

## ⚙️ How It Works

* **`agy_install.sh`**: Sets up a `proot-distro` Ubuntu environment, ensures `curl` and `ca-certificates` are configured, and triggers the official Google Antigravity installation pipeline inside the container.
* **`run.sh`**: Bind-mounts your current Termux directory to `/workspace` inside the Ubuntu container, allowing `agy` to read/modify your local files.
* **`openclaude_install.sh`**: Installs `nodejs`, `git`, and other core dependencies natively in Termux, applies a Termux network optimization fix, and installs `@gitlawb/openclaude` globally via npm.
