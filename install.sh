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
}

main
