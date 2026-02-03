#!/bin/bash

# Shell initialization - sources settings, aliases, and functions

SHELL_DIR="$(dirname "${BASH_SOURCE[0]}")"

# Load settings
[[ -f "$SHELL_DIR/settings.sh" ]] && . "$SHELL_DIR/settings.sh"

# Load all aliases
for f in "$SHELL_DIR/aliases"/*.sh; do
    [[ -f "$f" ]] && . "$f"
done

# Load functions
[[ -f "$SHELL_DIR/functions.sh" ]] && . "$SHELL_DIR/functions.sh"
