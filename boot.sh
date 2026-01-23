#!/bin/bash

# Define environment variables
export REPO_REF="${REPO_REF:-main}"
export REPO_NAME="${REPO_NAME:-labs}"
export REPO_AUTHOR="${REPO_AUTHOR:-noxtgm}"
export REPO_PATH="${HOME}/.local/share/${REPO_NAME}"

# Remove previous installation if it exists
sudo pacman -Syu --noconfirm --needed git >/dev/null
rm -rf "${REPO_PATH}"

# Clone the repository
git clone "https://github.com/${REPO_AUTHOR}/${REPO_NAME}.git" "${REPO_PATH}" >/dev/null

# Switch to the specified branch if different from current
cd "${REPO_PATH}" || exit
current_branch=$(git rev-parse --abbrev-ref HEAD)
if [[ "${current_branch}" != "${REPO_REF}" ]]; then
    git fetch origin "${REPO_REF}" && git checkout "${REPO_REF}"
fi
cd - >/dev/null || exit

# Source shared helpers
source "${REPO_PATH}/lib/helpers.sh"

# Run installation process
source "${REPO_PATH}/install.sh"
