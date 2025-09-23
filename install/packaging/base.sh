# Install yay AUR helper
if ! command -v yay &> /dev/null; then
  echo "Installing yay AUR helper..."
  sudo pacman -S --noconfirm --needed yay
fi

# Install all base packages
mapfile -t all_packages < <(grep -v '^#' "$OMARCHY_INSTALL/omarchy-base.packages" | grep -v '^$')

# Separate AUR packages that aren't available in the Omarchy repository
aur_packages=()
official_packages=()

for package in "${all_packages[@]}"; do
  # Check if package exists in official repositories (including Omarchy repo)
  if pacman -Si "$package" &>/dev/null; then
    official_packages+=("$package")
  else
    # Package not found in official repos, assume it's from AUR
    aur_packages+=("$package")
  fi
done

# Install official packages
if [[ ${#official_packages[@]} -gt 0 ]]; then
  echo "Installing official packages..."
  sudo pacman -S --noconfirm --needed "${official_packages[@]}"
fi

# Install AUR packages
if [[ ${#aur_packages[@]} -gt 0 ]]; then
  echo "Installing AUR packages..."
  yay -S --noconfirm --needed "${aur_packages[@]}"
fi
