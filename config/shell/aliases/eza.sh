#!/bin/bash

if ! command -v eza &> /dev/null; then
    log_error "eza is not installed."
    exit 1
fi

# Files
alias lsx='eza -l --no-user --group-directories-first --icons=always --time-style=+"%Y-%m-%d %H:%M"'
alias lsxa='lsx -a'
alias ls='lsx --no-permissions --no-filesize'
alias lsa='ls -a'

# Tree
alias treex='lsx --tree --level=2'
alias treexa='treex -a'
alias tree='treex --no-permissions --no-filesize'
alias treea='tree -a'
