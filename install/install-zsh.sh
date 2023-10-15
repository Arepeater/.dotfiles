#!/usr/bin/env bash

mkdir -p "$ZDOTDIR"

ln -sf "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/zsh/.zshrc" "$ZDOTDIR/.zshrc"

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting $DOTFILES/zsh/plugins/fsh
git clone https://github.com/zsh-users/zsh-autosuggestions $DOTFILES/zsh/plugins/zsh-autosuggestions
git clone https://github.com/romkatv/powerlevel10k.git $DOTFILES/zsh/.powerlevel10k