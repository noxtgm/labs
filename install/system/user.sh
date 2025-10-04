info "Setting up user environment..."

# Create user directories
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/share/applications"
success "User directories created"

# Set up environment variables
echo "export XDG_CURRENT_DESKTOP=Hyprland" >> "$HOME/.bashrc"
echo "export XDG_SESSION_DESKTOP=Hyprland" >> "$HOME/.bashrc"
echo "export XDG_SESSION_TYPE=wayland" >> "$HOME/.bashrc"
success "Environment variables configured"
