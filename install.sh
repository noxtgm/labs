#!/bin/bash

# Install packages
install_packages() {
    install_core_packages
    install_yay
    install_aur_packages
}

# Install configs
install_configs() {
    install_all_configs
}

main() {
    install_packages
    install_configs
}

main
