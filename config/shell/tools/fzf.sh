# fzf integration (keybindings: Ctrl+t, Ctrl+r, Alt+c)
if [[ -n "$BASH_VERSION" ]]; then
    eval "$(fzf --bash)"
elif [[ -n "$ZSH_VERSION" ]]; then
    eval "$(fzf --zsh)"
fi
