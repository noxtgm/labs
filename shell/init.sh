#!/bin/bash

# Load settings
[[ -f "${REPO_SHELL}/settings.sh" ]] && . "${REPO_SHELL}/settings.sh"

# Load aliases
for file in "${REPO_SHELL}/aliases"/*.sh; do
    [[ -f "$file" ]] && . "$file"
done
