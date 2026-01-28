#!/bin/bash

if ! command -v git &> /dev/null; then
    log_error "git is not installed."
    exit 1
fi

# Commit
alias gaa='git add -A'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gt='git tag'
alias gwip='git add -A && git commit -m "WIP"'

# Branch
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias grb='git rebase'
alias gf='git fetch'
alias gfa='git fetch --all'
