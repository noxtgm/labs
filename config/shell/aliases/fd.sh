#!/bin/bash

if ! command -v fd &> /dev/null; then
    log_error "fd is not installed."
    exit 1
fi

# Find
alias find='fd'
