#!/bin/bash

# Fuzzy find with neovim integration
alias fzf="ff"
ff() {
    local file
    file=$(command fzf --preview="cat {}")
    [[ -n "$file" ]] && nvim "$file"
}
