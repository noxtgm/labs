#!/bin/bash

set -euo pipefail

# Define environment variables
export REPO_NAME="${REPO_NAME:-labs}"
export REPO_AUTHOR="${REPO_AUTHOR:-noxtgm}"
export REPO_PATH="${HOME}/.local/share/${REPO_NAME}"
export REPO_INSTALL="${REPO_PATH}/install"
export REPO_CONFIG="${REPO_PATH}/config"

# Remove previous installation if it exists
sudo pacman -Syu --noconfirm --needed git >/dev/null
rm -rf "${REPO_PATH}"

# Clone the repository
git clone "https://github.com/${REPO_AUTHOR}/${REPO_NAME}.git" "${REPO_PATH}" >/dev/null

# Source shared libraries
source "${REPO_PATH}/lib/init.sh"

# Run installation process
source "${REPO_PATH}/install.sh"
