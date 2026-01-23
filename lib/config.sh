#!/bin/bash

# Link a single config file from source to destination
# Usage: link_config <source> <destination>
link_config() {
    local src="$1"
    local dest="$2"
    local dest_dir
    dest_dir=$(dirname "$dest")
    
    # Create destination directory if it doesn't exist
    mkdir -p "$dest_dir" || return 1
    
    # Remove existing file/link if it exists
    [[ -e "$dest" || -L "$dest" ]] && rm -f "$dest"
    
    # Create symlink
    ln -sf "$src" "$dest"
}

# Install a specific config by name
# Usage: install_config <name>
# Example: install_config hypr → installs config/hypr/* to ~/.config/hypr/*
install_config() {
    local name="$1"
    local config_path="$REPO_CONFIG/$name"
    
    if [[ ! -d "$config_path" ]]; then
        log_error "Config '$name' not found."
        return 1
    fi
    
    local link_count=0
    
    while IFS= read -r -d '' src_file; do
        local relative_path="${src_file#$REPO_CONFIG/}"
        local dest_file="${HOME}/.config/${relative_path}"
        if link_config "$src_file" "$dest_file"; then
            ((link_count++))
        fi
    done < <(find "$config_path" -type f -print0)
    
    if [[ $link_count -gt 0 ]]; then
        log_success "Config '$name' installed."
    else
        log_warning "No files linked for config '$name'."
    fi
}

# Install all configs
install_all_configs() {
    if [[ ! -d "$REPO_CONFIG" ]]; then
        log_warning "Config directory not found: $REPO_CONFIG."
        return 0
    fi
    
    local config_count=0
    
    while IFS= read -r -d '' src_file; do
        # Get relative path from config directory
        local relative_path="${src_file#$REPO_CONFIG/}"
        local dest_file="${HOME}/.config/${relative_path}"
        
        if link_config "$src_file" "$dest_file"; then
            ((config_count++))
        fi
    done < <(find "$REPO_CONFIG" -type f -print0)
    
    if [[ $config_count -gt 0 ]]; then
        log_success "Linked $config_count config file(s)."
    else
        log_warning "No config files found to link."
    fi
}
