#!/bin/bash

# Parse package list by skipping empty lines and comments
parse_packages() {
    local file="$1"
    log_info "Parsing packages from $file..."
    grep -v '^#' "$file" | grep -v '^[[:space:]]*$' | tr '\n' ' '
}

# Manually install and build yay for AUR package installation
install_yay() {
    if command -v yay &>/dev/null; then
        log_info "yay already installed, skipping."
        return 0
    fi
    
    log_info "Installing yay..."
    
    local yay_dir="${REPO_INSTALL}/yay"
    git clone https://aur.archlinux.org/yay.git "$yay_dir"
    
    (cd "$yay_dir" && makepkg -si --noconfirm)
    
    rm -rf "$yay_dir"
    log_success "yay installed."
}

# Install official packages from the core package list
install_core_packages() {
    local packages
    packages=$(parse_packages "${REPO_INSTALL}/core.packages")
    
    if [[ -z "$packages" ]]; then
        return 0
    fi
    
    log_info "Installing core packages..."
    sudo pacman -S --noconfirm --needed $packages
    log_success "Core packages installed."
}

# Install AUR packages from the aur package list
install_aur_packages() {
    local packages
    packages=$(parse_packages "${REPO_INSTALL}/aur.packages")
    
    if [[ -z "$packages" ]]; then
        return 0
    fi
    
    log_info "Installing AUR packages..."
    yay -S --noconfirm --needed --answerdiff None --answerclean None $packages
    log_success "AUR packages installed."
}
