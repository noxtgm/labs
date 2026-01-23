#!/bin/bash

if ! command -v zoxide &> /dev/null; then
    log_error "zoxide is not installed."
    exit 1
fi

# cd
alias cd="zd"
zd() {
  if [ $# -eq 0 ]; then
    builtin cd ~ && return
  elif [ -d "$1" ]; then
    builtin cd "$1"
  else
    z "$@" && printf "\U000F17A9 " && pwd || echo "Error: Directory not found"
  fi
}
