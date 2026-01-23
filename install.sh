#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Install core packages from the core package list
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

# Manually install yay for AUR package installation
install_yay() {
    if command -v yay &>/dev/null; then
        log_info "yay already installed, skipping."
        return 0
    fi
    
    log_info "Installing yay..."
    
    local yay_dir="${REPO_PATH}/yay"
    git clone https://aur.archlinux.org/yay.git "$yay_dir"
    
    cd "$yay_dir"
    makepkg -si --noconfirm
    cd "${REPO_PATH}"
    
    rm -rf "$yay_dir"
    log_success "yay installed."
}

# Main package installation function
install_packages() {
    install_core_packages
    install_yay
    install_aur_packages
}

install_packages
