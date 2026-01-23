#!/bin/bash

# Configure shell to auto-start Hyprland on TTY1
# Creates a managed profile that can be updated with future installs
configure_hyprland_autostart() {
    local profile_dir="$HOME/.config/shell"
    local profile_file="$profile_dir/profile"
    local bash_profile="$HOME/.bash_profile"
    local zprofile="$HOME/.zprofile"
    
    # Create profile directory
    mkdir -p "$profile_dir"
    
    # Write managed profile with auto-start logic
    cat > "$profile_file" << 'EOF'
# Managed by labs installer - do not edit manually

# Auto-start Hyprland on TTY1
if [[ -z "$DISPLAY" && "$XDG_VTNR" == "1" ]]; then
    exec Hyprland
fi
EOF
    
    # Source line to add to shell profiles
    local source_line="[[ -f \"$profile_file\" ]] && . \"$profile_file\""
    
    # Configure bash
    if [[ -f "$bash_profile" ]]; then
        if ! grep -qF "$profile_file" "$bash_profile" 2>/dev/null; then
            echo "" >> "$bash_profile"
            echo "$source_line" >> "$bash_profile"
        fi
    else
        echo "$source_line" > "$bash_profile"
    fi
    
    # Configure zsh if .zshrc exists (user likely uses zsh)
    if [[ -f "$HOME/.zshrc" ]]; then
        if ! grep -qF "$profile_file" "$zprofile" 2>/dev/null; then
            echo "" >> "$zprofile"
            echo "$source_line" >> "$zprofile"
        fi
    fi
    
    log_success "Hyprland auto-start configured."
}
