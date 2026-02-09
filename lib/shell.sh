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

# Inline labs settings and aliases into .bashrc so new terminals work with a normal, self-contained .bashrc
configure_shell() {
    local bashrc="$HOME/.bashrc"
    local start_marker='# --- labs shell ---'
    local end_marker='# --- end labs shell ---'

    _backup_file "$bashrc"
    [[ -f "$bashrc" ]] || touch "$bashrc"

    # Remove existing labs block so reinstall replaces with current repo content
    if grep -qF "$start_marker" "$bashrc" 2>/dev/null; then
        sed -i "/$start_marker/,/$end_marker/d" "$bashrc"
    fi

    # Append current settings + aliases (same order as init.sh)
    {
        echo ""
        echo "$start_marker"
        [[ -f "${REPO_SHELL}/settings.sh" ]] && cat "${REPO_SHELL}/settings.sh"
        local f
        for f in "${REPO_SHELL}/aliases"/*.sh; do
            [[ -f "$f" ]] && cat "$f"
        done
        echo "$end_marker"
    } >> "$bashrc"

    log_success "Configured shell."
}
