#!/bin/bash

# Color definitions for text colorization

# Reset color
export NC='\033[0m'

# Basic colors
export BLACK='\033[0;30m'
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export WHITE='\033[0;37m'

# Bold colors
export BOLD_BLACK='\033[1;30m'
export BOLD_RED='\033[1;31m'
export BOLD_GREEN='\033[1;32m'
export BOLD_YELLOW='\033[1;33m'
export BOLD_BLUE='\033[1;34m'
export BOLD_PURPLE='\033[1;35m'
export BOLD_CYAN='\033[1;36m'
export BOLD_WHITE='\033[1;37m'

# Function to colorize text
colorize() {
    local color="$1"
    local text="$2"
    echo -e "${color}${text}${NC}"
}

# Basic colors
red() {
    colorize "$RED" "$1"
}

green() {
    colorize "$GREEN" "$1"
}

yellow() {
    colorize "$YELLOW" "$1"
}

blue() {
    colorize "$BLUE" "$1"
}

purple() {
    colorize "$PURPLE" "$1"
}

cyan() {
    colorize "$CYAN" "$1"
}

# Bold common colors
bold_red() {
    colorize "$BOLD_RED" "$1"
}

bold_green() {
    colorize "$BOLD_GREEN" "$1"
}

bold_yellow() {
    colorize "$BOLD_YELLOW" "$1"
}

bold_blue() {
    colorize "$BOLD_BLUE" "$1"
}
