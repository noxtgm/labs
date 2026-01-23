# zoxide integration (replaces cd)
if [[ -n "$BASH_VERSION" ]]; then
    eval "$(zoxide init bash --cmd cd)"
elif [[ -n "$ZSH_VERSION" ]]; then
    eval "$(zoxide init zsh --cmd cd)"
fi
