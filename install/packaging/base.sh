# Install core packages
mapfile -t packages < <(grep -v '^#' "$REPO_INSTALL/core.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"

# Install AUR packages
mapfile -t packages < <(grep -v '^#' "$REPO_INSTALL/aur.packages" | grep -v '^$')
yay -S --noconfirm --needed "${packages[@]}"
