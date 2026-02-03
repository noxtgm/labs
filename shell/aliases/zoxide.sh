#!/bin/bash

# cd with zoxide smart matching
alias cd="zd"
zd() {
  if [[ $# -eq 0 ]]; then
    builtin cd ~
  elif [[ -d "$1" ]]; then
    builtin cd "$1" && zoxide add "$PWD"
  else
    local result
    result=$(zoxide query "$@" 2>/dev/null)
    if [[ -n "$result" ]]; then
      builtin cd "$result"
    else
      echo "Directory not found: $*"
      return 1
    fi
  fi
}
