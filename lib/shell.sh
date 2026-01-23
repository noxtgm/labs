#!/bin/bash

# Configure shell to auto-start Hyprland on TTY1
configure_hyprland_autostart() {
    local profile_dir="$HOME/.config/shell"
    local profile_file="$profile_dir/profile"
    local bash_profile="$HOME/.bash_profile"
    local zprofile="$HOME/.zprofile"
    
    # Create profile directory
    mkdir -p "$profile_dir"
    
    # Write managed profile with auto-start logic
    cat > "$profile_file" << 'EOF'
# Auto-start Hyprland on TTY1
if [[ -z "$DISPLAY" && "$XDG_VTNR" == "1" ]]; then
    exec start-hyprland
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

# Configure shell aliases
configure_shell_aliases() {
    local aliases_dir="$HOME/.config/shell/aliases"
    local bashrc="$HOME/.bashrc"
    local zshrc="$HOME/.zshrc"
    
    # Source line to load all alias files (only if directory exists)
    local source_line="[[ -d \"$aliases_dir\" ]] && for f in \"$aliases_dir\"/*.sh; do [[ -f \"\$f\" ]] && . \"\$f\"; done"
    
    # Configure bash
    if [[ -f "$bashrc" ]]; then
        if ! grep -qF "$aliases_dir" "$bashrc" 2>/dev/null; then
            echo "" >> "$bashrc"
            echo "$source_line" >> "$bashrc"
        fi
    else
        echo "$source_line" > "$bashrc"
    fi
    
    # Configure zsh
    if [[ -f "$zshrc" ]]; then
        if ! grep -qF "$aliases_dir" "$zshrc" 2>/dev/null; then
            echo "" >> "$zshrc"
            echo "$source_line" >> "$zshrc"
        fi
    fi
    
    log_success "Shell aliases configured."
}

# Configure shell tool integrations (fzf, zoxide, etc.)
configure_shell_tools() {
    local tools_dir="$HOME/.config/shell/tools"
    local bashrc="$HOME/.bashrc"
    local zshrc="$HOME/.zshrc"
    
    # Source line to load all tool files (only if directory exists)
    local source_line="[[ -d \"$tools_dir\" ]] && for f in \"$tools_dir\"/*.sh; do [[ -f \"\$f\" ]] && . \"\$f\"; done"
    
    # Configure bash
    if [[ -f "$bashrc" ]]; then
        if ! grep -qF "$tools_dir" "$bashrc" 2>/dev/null; then
            echo "" >> "$bashrc"
            echo "$source_line" >> "$bashrc"
        fi
    else
        echo "$source_line" > "$bashrc"
    fi
    
    # Configure zsh
    if [[ -f "$zshrc" ]]; then
        if ! grep -qF "$tools_dir" "$zshrc" 2>/dev/null; then
            echo "" >> "$zshrc"
            echo "$source_line" >> "$zshrc"
        fi
    fi
    
    log_success "Shell tools configured."
}
