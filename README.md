# 📱 Termux AI CLI Agents

A curated collection of automated installer and wrapper scripts to run advanced AI developer CLI agents on Android devices via **Termux**.

---

## 📋 Table of Contents
- [Supported Agents](#-supported-agents)
- [⚡ Quick Start (One-Line Installers)](#-quick-start-one-line-installers)
  - [Google Antigravity CLI (`agy`)](#1-google-antigravity-cli-agy)
  - [OpenClaude CLI (`openclaude`)](#2-openclaude-cli-openclaude)
- [🛠️ Local Usage & Git Cloning](#️-local-usage--git-cloning)
- [⚙️ How It Works](#️-how-it-works)
- [📝 License](#-license)

---

## 🤖 Supported Agents

| Agent | Environment | Key Dependencies | Primary Use Case |
| :--- | :--- | :--- | :--- |
| **Google Antigravity CLI (`agy`)** | Ubuntu Container (`proot-distro`) | Python, Curl, Ca-certificates | AI-first workspace assistant |
| **OpenClaude CLI (`openclaude`)** | Native Termux Shell | Node.js (LTS), Git, npm | Fast terminal-based agent interactions |

---

## ⚡ Quick Start (One-Line Installers)

### 1. Google Antigravity CLI (`agy`)

To install packages, set up a `proot-distro Ubuntu` container, and install the Antigravity CLI, execute:

```bash
curl -fsSL https://raw.githubusercontent.com/AbuZar-Ansarii/CLI-Agents/main/agy_install.sh | bash
```

#### Run CLI (with Workspace Mount):
Run the command below in any Termux directory. It bind-mounts your current folder to `/workspace` in the container so `agy` can read and write files locally:

```bash
curl -fsSL https://raw.githubusercontent.com/AbuZar-Ansarii/CLI-Agents/main/run.sh | bash -s --
```
> [!TIP]
> You can pass arguments directly. For example:
> `curl -fsSL https://raw.githubusercontent.com/AbuZar-Ansarii/CLI-Agents/main/run.sh | bash -s -- --help`

---

### 2. OpenClaude CLI (`openclaude`)

To install Node.js, apply network optimizations for Termux, and install OpenClaude globally, execute:

```bash
curl -fsSL https://raw.githubusercontent.com/AbuZar-Ansarii/CLI-Agents/main/openclaude_install.sh | bash
```

#### Run CLI:
Since OpenClaude runs natively inside Termux, start it from any folder by typing:

```bash
openclaude
```

---

## 🛠️ Local Usage & Git Cloning

If you prefer to download the repository locally and run the scripts:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/AbuZar-Ansarii/CLI-Agents.git
   cd CLI-Agents
   ```

2. **Make all scripts executable:**
   ```bash
   chmod +x *.sh
   ```

3. **Install Agents Locally:**
   * **Antigravity CLI**: `./agy_install.sh`
   * **OpenClaude**: `./openclaude_install.sh`

4. **Run Agents Locally:**
   * **Antigravity CLI**: `./run.sh [arguments]`
   * **OpenClaude**: `openclaude`

---

## ⚙️ How It Works

* **`agy_install.sh`**: Installs `proot-distro`, builds a minimal `ubuntu` environment, installs certificates and `curl` inside the container, and downloads the official Antigravity CLI client.
* **`run.sh`**: Connects your host Termux path to `/workspace` inside the `ubuntu` container and runs the `agy` commands inside it securely.
* **`openclaude_install.sh`**: Upgrades Termux repository packages, installs native dependencies, overrides the Node.js DNS resolution order to prevent Termux network timeouts (`ipv4first`), and installs `@gitlawb/openclaude`.

---

## 📝 License

This project is open-source and available under the [MIT License](LICENSE).
