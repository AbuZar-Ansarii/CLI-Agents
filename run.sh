#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# ANSI escape codes for coloring output
BLUE='\e[1;34m'
RED='\e[1;31m'
NC='\e[0m' # No Color

# Check if proot-distro is installed
if ! command -v proot-distro &> /dev/null; then
    echo -e "${RED}Error: proot-distro is not installed. Please run agy_install.sh first.${NC}"
    exit 1
fi

# Check if ubuntu is installed in proot-distro
if proot-distro list | grep -E "ubuntu.*Installed:.*no" > /dev/null || ! proot-distro list | grep -q "ubuntu"; then
    echo -e "${RED}Error: Ubuntu container is not installed. Please run agy_install.sh first.${NC}"
    exit 1
fi

# Bind the current working directory to /workspace inside the container.
# This allows the agy CLI inside the container to access and operate on files in your current Termux directory.
CWD=$(pwd)

# We use proot-distro login ubuntu with --bind to mount the current directory,
# and bash -c to change into that directory and run 'agy' passing all arguments.
# Note: the extra '_' is used because bash -c consumes the first argument after '--' as $0.
proot-distro login ubuntu --bind "$CWD:/workspace" -- bash -c "
    cd /workspace && agy \"\$@\"
" -- _ "$@"
