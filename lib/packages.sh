#!/bin/bash

# Parse package list, filtering comments and empty lines
parse_packages() {
    local file="$1"
    
    [[ -f "$file" ]] || return 1
    grep -vE '^(#|[[:space:]]*$)' "$file" | tr '\n' ' ' | sed 's/ $//'
}

# Install packages using specified package manager
_install_packages() {
    local name="$1"
    local package_file="$2"
    shift 2
    local install_cmd=("$@")
    
    local packages
    packages=$(parse_packages "$package_file") || {
        log_warning "Package file not found: $package_file"
        return 0
    }
    
    if [[ -z "$packages" ]]; then
        log_info "No $name packages to install."
        return 0
    fi
    
    log_info "Installing $name packages..."
    
    # shellcheck disable=SC2086
    if ! "${install_cmd[@]}" $packages; then
        log_error "Failed to install $name packages."
        return 1
    fi
    
    log_success "$name packages installed."
}

# Install yay AUR helper
install_yay() {
    if command -v yay &>/dev/null; then
        log_info "yay already installed, skipping."
        return 0
    fi
    
    log_info "Installing yay..."
    
    local yay_dir="${REPO_INSTALL}/yay"
    
    if ! git clone https://aur.archlinux.org/yay.git "$yay_dir"; then
        log_error "Failed to clone yay repository."
        return 1
    fi
    
    if ! (cd "$yay_dir" && makepkg -si --noconfirm); then
        log_error "Failed to build yay."
        rm -rf "$yay_dir"
        return 1
    fi
    
    rm -rf "$yay_dir"
    log_success "yay installed."
}

# Install official packages from core.packages
install_core_packages() {
    _install_packages "core" "${REPO_INSTALL}/core.packages" \
        sudo pacman -S --noconfirm --needed
}

# Install AUR packages from aur.packages
install_aur_packages() {
    _install_packages "AUR" "${REPO_INSTALL}/aur.packages" \
        yay -S --noconfirm --needed --answerdiff None --answerclean None
}
