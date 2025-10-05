info "Installing Hyprland configuration..."

# Create Hyprland config directory
mkdir -p "$HOME/.config/hypr"

# Copy Hyprland config
if [[ -f "$REPO_INSTALL/config/hypr/hyprland.conf" ]]; then
    cp "$REPO_INSTALL/config/hypr/hyprland.conf" "$HOME/.config/hypr/"
    success "Hyprland configuration installed successfully"
else
    error "Hyprland configuration not found at $REPO_INSTALL/../config/hypr/hyprland.conf"
fi
