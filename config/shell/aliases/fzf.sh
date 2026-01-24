#!/bin/bash

# Fuzzy find
alias ff='fzf --preview="cat {}"'

# Open search behavior
nvim $(ff)
