#!/bin/bash

if ! command -v fzf &> /dev/null; then
    log_error "fzf is not installed."
    exit 1
fi

# Fuzzy find
alias ff="fzf --preview 'bat --style=numbers --color=always {}'" # TODO: Check result
