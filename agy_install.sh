#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# ANSI escape codes for coloring output
BLUE='\e[1;34m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
RED='\e[1;31m'
NC='\e[0m' # No Color

echo -e "${BLUE}==> Updating packages in Termux...${NC}"
pkg update -y

echo -e "${BLUE}==> Installing proot-distro...${NC}"
pkg install proot-distro -y

# Check if ubuntu is already installed, if not, install it
echo -e "${BLUE}==> Checking Ubuntu installation status...${NC}"
if proot-distro list | grep -E "ubuntu.*Installed:.*no" > /dev/null || ! proot-distro list | grep -q "ubuntu"; then
    echo -e "${GREEN}Installing Ubuntu container...${NC}"
    proot-distro install ubuntu
else
    echo -e "${GREEN}Ubuntu is already installed in proot-distro.${NC}"
fi

# Run the installer inside the ubuntu environment.
# We first update apt and install curl and ca-certificates, which are required for downloading and validating the CLI installer.
echo -e "${BLUE}==> Logging into Ubuntu and installing Antigravity CLI...${NC}"
proot-distro login ubuntu -- bash -c "
    apt-get update && \
    apt-get install -y curl ca-certificates && \
    curl -fsSL https://antigravity.google/cli/install.sh | bash
"

echo -e "${GREEN}==> Antigravity CLI installation script finished!${NC}"
echo -e "To access the Ubuntu container and use the CLI, run:"
echo -e "${YELLOW}    proot-distro login ubuntu${NC}"
