#!/bin/bash

main() {
    # Install packages
    install_core_packages
    install_yay
    install_aur_packages
    
    # Install configs
    install_all_configs
    
    # Configure shell
    configure_hyprland_autostart
    configure_shell_aliases
    configure_shell_tools
    
    log_success "Installation complete."
    
    if [[ "$IS_REINSTALL" == "true" ]]; then
        read -rp "Reboot now? [y/N] " response
        if [[ ! "$response" =~ ^[Yy]$ ]]; then
            exit 0
        fi
    fi
    
    log_info "Rebooting in 5 seconds..."
    sleep 5
    sudo reboot
}

main
