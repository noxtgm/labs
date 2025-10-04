#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Repository variables
export REPO_NAME="labs"

# Define locations
export REPO_PATH="$HOME/.local/share/$REPO_NAME"
export REPO_INSTALL="$REPO_PATH/install"

# Install
source "$REPO_INSTALL/helpers/all.sh"
source "$REPO_INSTALL/packages/all.sh"
