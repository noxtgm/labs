# Install core packages
info "Reading core packages..."
mapfile -t packages < <(grep -v '^#' "$REPO_INSTALL/core.packages" | grep -v '^$')

if [ ${#packages[@]} -gt 0 ]; then
    info "Installing core packages: ${packages[*]}"
    sudo pacman -S --noconfirm --needed "${packages[@]}"
    success "Core packages installed successfully"
else
    warning "No core packages to install"
fi

# Install yay first
info "Installing yay..."
if ! command -v yay &> /dev/null; then
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd -
    success "yay installed successfully"
else
    info "yay already installed"
fi

# Install AUR packages
info "Reading AUR packages..."
mapfile -t aur_packages < <(grep -v '^#' "$REPO_INSTALL/aur.packages" | grep -v '^$')

if [ ${#aur_packages[@]} -gt 0 ]; then
    info "Installing AUR packages: ${aur_packages[*]}"
    yay -S --noconfirm --needed "${aur_packages[@]}"
    success "AUR packages installed successfully"
else
    warning "No AUR packages to install"
fi
