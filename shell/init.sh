#!/bin/bash

# Define shell directory
SHELL_DIR="$(dirname "${BASH_SOURCE[0]}")"

# Load settings
[[ -f "$SHELL_DIR/settings.sh" ]] && . "$SHELL_DIR/settings.sh"

# Load aliases
for file in "$SHELL_DIR/aliases"/*.sh; do
    [[ -f "$file" ]] && . "$file"
done
