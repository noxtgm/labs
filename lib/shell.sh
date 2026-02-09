#!/bin/bash

# Backup a file before modification
_backup_file() {
    local file="$1"
    if [[ -f "$file" && ! -L "$file" ]]; then
        cp "$file" "${file}.bak" && log_info "Backed up $file."
    fi
}

# Add a line to file if not present (idempotent)
_add_line_if_missing() {
    local file="$1"
    local line="$2"
    
    [[ -f "$file" ]] || touch "$file"
    grep -qF "$line" "$file" 2>/dev/null || echo "$line" >> "$file"
}

# Configure shell to auto-start Hyprland on TTY1
autostart_hyprland() {
    local bash_profile="$HOME/.bash_profile"
    local line='[[ -z "$DISPLAY" && "$XDG_VTNR" == "1" ]] && exec Hyprland'
    
    _backup_file "$bash_profile"
    
    if _add_line_if_missing "$bash_profile" "$line"; then
        log_success "Configured Hyprland auto-start."
    else
        return 1
    fi
}

# Configure shell to source labs init file
configure_shell() {
    local bashrc="$HOME/.bashrc"
    local line="[[ -f \"${REPO_SHELL}/init.sh\" ]] && . \"${REPO_SHELL}/init.sh\""
    
    _backup_file "$bashrc"
    
    if _add_line_if_missing "$bashrc" "$line"; then
        log_success "Configured shell."
    else
        return 1
    fi
}
