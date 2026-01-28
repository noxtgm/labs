#!/bin/bash

# Fuzzy find and open in neovim
alias fzf='local file && file=$(fzf --preview="cat {}") && [[ -n "$file" ]] && nvim "$file"'
alias ff='fzf'
