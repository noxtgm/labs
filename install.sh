#!/bin/bash

set -eo pipefail

main() {
    if ! install_core_packages; then
        log_error "Failed to install core packages. Aborting."
        exit 1
    fi
    
    if ! install_yay; then
        log_error "Failed to install yay. Aborting."
        exit 1
    fi
    
    if ! install_aur_packages; then
        log_error "Failed to install AUR packages."
    fi
    
    if ! install_all_configs; then
        log_error "Failed to install configurations."
    fi
    
    if ! autostart_hyprland; then
        log_error "Failed to configure Hyprland auto-start. You may need to configure manually."
    fi
    
    if ! configure_shell; then
        log_error "Failed to configure shell. You may need to configure manually."
    fi
    
    log_success "Installation complete."
    
    # Prompt for reboot if reinstalling
    if [[ "$IS_REINSTALL" == "true" ]]; then
        read -rp "Reboot now? [y/N] " response
        if [[ ! "$response" =~ ^[Yy]$ ]]; then
            exit 0
        fi
    fi
    
    log_info "Rebooting in 3 seconds..."
    log_info "Press Ctrl+C to cancel reboot."
    sleep 3
    sudo reboot
}

main
