#!/bin/bash

# Log information messages in the terminal
log_info() {
    echo -e "${BLUE}[INFO] $1${NC}"
}

# Log success messages in the terminal
log_success() {
    echo -e "${GREEN}[SUCCESS] $1${NC}"
}

# Log error messages in the terminal
log_error() {
    echo -e "${RED}[ERROR] $1${NC}"
}

# Log warning messages in the terminal
log_warning() {
    echo -e "${YELLOW}[WARNING] $1${NC}"
}
