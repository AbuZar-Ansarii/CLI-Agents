#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# ANSI escape codes for coloring output
BLUE='\e[1;34m'
GREEN='\e[1;32m'
NC='\e[0m' # No Color

echo -e "${BLUE}==> Starting OpenClaude installation in Termux...${NC}"

# Download and run the official OpenClaude Termux installer
curl -sL "https://raw.githubusercontent.com/AbuZar-Ansarii/free-openclaude/master/vanila_install.sh" | bash

echo -e "${GREEN}==> OpenClaude installation finished!${NC}"
echo -e "To start OpenClaude, simply run:"
echo -e "    openclaude"
