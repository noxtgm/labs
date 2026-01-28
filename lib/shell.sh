#!/bin/bash

# Configure shell to auto-start Hyprland on TTY1
configure_hyprland_autostart() {
    local bash_profile="$HOME/.bash_profile"
    
    # Auto-start command
    local autostart_line='[[ -z "$DISPLAY" && "$XDG_VTNR" == "1" ]] && exec Hyprland'
    
    if [[ -f "$bash_profile" ]]; then
        if ! grep -qF "exec Hyprland" "$bash_profile" 2>/dev/null; then
            echo "" >> "$bash_profile"
            echo "$autostart_line" >> "$bash_profile"
        fi
    else
        echo "$autostart_line" > "$bash_profile"
    fi
    
    log_success "Hyprland auto-start configured."
}

# Configure shell aliases
configure_shell_aliases() {
    local aliases_dir="${REPO_SHELL}/aliases"
    local bashrc="$HOME/.bashrc"
    
    # Source line to load all alias files
    local source_line="for f in \"$aliases_dir\"/*.sh; do [[ -f \"\$f\" ]] && . \"\$f\"; done"
    
    if [[ -f "$bashrc" ]]; then
        if ! grep -qF "$aliases_dir" "$bashrc" 2>/dev/null; then
            echo "" >> "$bashrc"
            echo "$source_line" >> "$bashrc"
        fi
    else
        echo "$source_line" > "$bashrc"
    fi
    
    log_success "Shell aliases configured."
}

# Configure shell functions
configure_shell_functions() {
    local functions_file="${REPO_SHELL}/functions.sh"
    local bashrc="$HOME/.bashrc"
    
    # Source line to load functions
    local source_line="[[ -f \"$functions_file\" ]] && . \"$functions_file\""
    
    if [[ -f "$bashrc" ]]; then
        if ! grep -qF "$functions_file" "$bashrc" 2>/dev/null; then
            echo "" >> "$bashrc"
            echo "$source_line" >> "$bashrc"
        fi
    else
        echo "$source_line" > "$bashrc"
    fi
    
    log_success "Shell functions configured."
}

# Configure shell settings
configure_shell_settings() {
    local settings_file="${REPO_SHELL}/settings.sh"
    local bashrc="$HOME/.bashrc"
    
    # Source line to load settings
    local source_line="[[ -f \"$settings_file\" ]] && . \"$settings_file\""
    
    if [[ -f "$bashrc" ]]; then
        if ! grep -qF "$settings_file" "$bashrc" 2>/dev/null; then
            echo "" >> "$bashrc"
            echo "$source_line" >> "$bashrc"
        fi
    else
        echo "$source_line" > "$bashrc"
    fi
    
    log_success "Shell settings configured."
}
