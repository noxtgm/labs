#!/bin/bash

# Parse package list, filtering comments and empty lines
parse_packages() {
    local file="$1"
    local -n result_array=$2
    
    [[ -f "$file" ]] || return 1
    
    local line
    while IFS= read -r line; do
        # Skip comments and empty lines
        [[ "$line" =~ ^[[:space:]]*$ ]] && continue
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        result_array+=("$line")
    done < "$file"
    
    [[ ${#result_array[@]} -eq 0 ]] && return 1
    return 0
}

# Install packages using specified package manager
_install_packages() {
    local name="$1"
    local package_file="$2"
    shift 2
    local install_cmd=("$@")
    
    local packages=()
    if ! parse_packages "$package_file" packages; then
        log_warning "Package file not found or empty: $package_file"
        return 0
    fi
    
    log_info "Installing $name packages..."
    
    if ! "${install_cmd[@]}" "${packages[@]}"; then
        log_error "Failed to install $name packages."
        return 1
    fi
    
    log_success "Successfully installed $name packages."
}

# Install yay AUR helper
install_yay() {
    if command -v yay &>/dev/null; then
        log_info "yay already installed. Skipping."
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
    log_success "Successfully installed yay."
}

# Install official packages using pacman
install_core_packages() {
    _install_packages "core" "${REPO_PATH}/packages.core" \
        sudo pacman -S --noconfirm --needed
}

# Install AUR packages using yay
install_aur_packages() {
    _install_packages "AUR" "${REPO_PATH}/packages.aur" \
        yay -S --noconfirm --needed --answerdiff None --answerclean None
}
