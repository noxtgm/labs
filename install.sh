#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Install all modules
source "$REPO_INSTALL/helpers/all.sh"
source "$REPO_INSTALL/packages/all.sh"
source "$REPO_INSTALL/system/all.sh"
source "$REPO_INSTALL/config/all.sh"
