#!/bin/bash

# Fuzzy find and open in neovim
alias fzf="ff"
ff() {
    local file
    file=$(command fzf --preview="cat {}")
    [[ -n "$file" ]] && nvim "$file"
}
