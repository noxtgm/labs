info "Enabling system services..."

# Enable SDDM
sudo systemctl enable sddm.service
success "SDDM service enabled"

# Enable NetworkManager if installed
if command -v NetworkManager &> /dev/null; then
    sudo systemctl enable NetworkManager.service
    success "NetworkManager service enabled"
else
    warning "NetworkManager not found, skipping"
fi
