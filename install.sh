#!/bin/bash

# Install packages
install_packages() {
    install_core_packages
    install_yay
    install_aur_packages
}

# Install configs
install_configs() {
    install_all_configs
}

# Configure shell to auto-start Hyprland
configure_shell() {
    local profile="$HOME/.bash_profile"
    local marker="# Auto-start Hyprland"
    
    # Skip if already configured
    if grep -q "$marker" "$profile" 2>/dev/null; then
        log_info "Hyprland auto-start already configured, skipping."
        return 0
    fi
    
    cat >> "$profile" << 'EOF'

# Auto-start Hyprland on TTY1
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec Hyprland
fi
EOF
    
    log_success "Hyprland auto-start configured."
}

main() {
    install_packages
    install_configs
    configure_shell
}

main
