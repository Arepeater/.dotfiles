#!/usr/bin/env zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

export TERM='rxvt-256color'
export DOTFILES="$HOME/.dotfiles"
export WORKSPACE="$HOME/workspace"

# Close the compinit for /etc/zsh/zshrc
skip_global_compinit=1

[ -f "$DOTFILES/install_config" ] && source "$DOTFILES/install_config"

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# git
export GIT_REVIEW_BASE=master # See gitconfig

# Set ssh-agent, use keychain escrow keys
eval `keychain --eval --agents ssh id_rsa id_rsa_github`

# PATH
export PATH="$HOME/.poetry/bin:$PATH"
export PATH=$PATH:/home/stone/microkernel/toolchain/gcc-arm-none-eabi/bin

# Configure the terminal proxy
alias setproxy="export ALL_PROXY=socks5://localhost:5003"
alias unsetproxy="unset ALL_PROXY"
