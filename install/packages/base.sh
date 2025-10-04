# Install core packages
mapfile -t packages < <(grep -v '^#' "$REPO_INSTALL/core.packages" | grep -v '^$')
if [ ${#packages[@]} -gt 0 ]; then
    echo "Installing core packages: ${packages[*]}"
    sudo pacman -S --noconfirm --needed "${packages[@]}"
else
    echo "No core packages to install"
fi

# Install AUR packages
mapfile -t packages < <(grep -v '^#' "$REPO_INSTALL/aur.packages" | grep -v '^$')
if [ ${#packages[@]} -gt 0 ]; then
    echo "Installing AUR packages: ${packages[*]}"
    yay -S --noconfirm --needed "${packages[@]}"
else
    echo "No AUR packages to install"
fi
