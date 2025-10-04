#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Repository variables
REPOSITORY_NAME="labs"

# Define locations
export REPOSITORY_PATH="$HOME/.local/share/$REPOSITORY_NAME"
export REPOSITORY_INSTALL="$REPOSITORY_PATH/install"
