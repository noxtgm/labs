#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# =============================================================================
# Helper Functions
# =============================================================================

log_info() {
    echo -e "${BLUE}[INFO] $1${NC}"
}

log_success() {
    echo -e "${GREEN}[SUCCESS] $1${NC}"
}

log_error() {
    echo -e "${RED}[ERROR] $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}[WARNING] $1${NC}"
}

# Parse package file: skip empty lines and comments (lines starting with #)
parse_packages() {
    local file="$1"
    grep -v '^#' "$file" | grep -v '^[[:space:]]*$' | tr '\n' ' '
}

# =============================================================================
# Package Installation
# =============================================================================

install_core_packages() {
    log_info "Reading core packages from: ${REPO_INSTALL}/core.packages"
    
    local packages
    packages=$(parse_packages "${REPO_INSTALL}/core.packages")
    
    if [[ -z "$packages" ]]; then
        log_warning "No core packages found to install."
        return 0
    fi
    
    log_info "Installing core packages: $packages"
    echo ""
    
    # Install packages and log output
    if sudo pacman -S --noconfirm --needed $packages 2>&1 | tee -a "${REPO_INSTALL_LOG}"; then
        log_success "Core packages installed successfully."
    else
        log_error "Failed to install some core packages. Check ${REPO_INSTALL_LOG} for details."
        return 1
    fi
}

install_yay() {
    # Check if yay is already installed
    if command -v yay &>/dev/null; then
        log_info "yay is already installed, skipping."
        return 0
    fi
    
    log_info "Installing yay AUR helper..."
    
    local yay_dir="${REPO_PATH}/yay"
    
    # Clone yay repository
    git clone https://aur.archlinux.org/yay.git "$yay_dir" 2>&1 | tee -a "${REPO_INSTALL_LOG}"
    
    # Build and install yay
    cd "$yay_dir"
    if makepkg -si --noconfirm 2>&1 | tee -a "${REPO_INSTALL_LOG}"; then
        log_success "yay installed successfully."
    else
        log_error "Failed to install yay. Check ${REPO_INSTALL_LOG} for details."
        cd "${REPO_PATH}"
        return 1
    fi
    
    cd "${REPO_PATH}"
    
    # Cleanup
    rm -rf "$yay_dir"
}

install_aur_packages() {
    log_info "Reading AUR packages from: ${REPO_INSTALL}/aur.packages"
    
    local packages
    packages=$(parse_packages "${REPO_INSTALL}/aur.packages")
    
    if [[ -z "$packages" ]]; then
        log_warning "No AUR packages found to install."
        return 0
    fi
    
    log_info "Installing AUR packages: $packages"
    echo ""
    
    # Install packages and log output
    if yay -S --noconfirm --needed $packages 2>&1 | tee -a "${REPO_INSTALL_LOG}"; then
        log_success "AUR packages installed successfully."
    else
        log_error "Failed to install some AUR packages. Check ${REPO_INSTALL_LOG} for details."
        return 1
    fi
}

# =============================================================================
# Main Installation
# =============================================================================

main() {
    echo -e "\n${BOLD_WHITE}=== Starting System Installation ===${NC}\n"
    
    # Create log file
    touch "${REPO_INSTALL_LOG}"
    log_info "Installation log: ${REPO_INSTALL_LOG}"
    echo ""
    
    # Step 1: Install core packages via pacman
    install_core_packages
    echo ""
    
    # Step 2: Install yay AUR helper
    install_yay
    echo ""
    
    # Step 3: Install AUR packages via yay
    install_aur_packages
    echo ""
    
    echo -e "${BOLD_WHITE}=== Installation Complete ===${NC}\n"
    log_success "System deployment finished. Check ${REPO_INSTALL_LOG} for full details."
}

# Run main installation
main
