#!/usr/bin/env bash

mkdir -p "$ZDOTDIR"

ln -sf "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/zsh/.zshrc" "$ZDOTDIR/.zshrc"

git clone "$GithubMirror"https://github.com/zdharma-continuum/fast-syntax-highlighting $DOTFILES/zsh/plugins/fsh
git clone "$GithubMirror"https://github.com/zsh-users/zsh-autosuggestions $DOTFILES/zsh/plugins/zsh-autosuggestions

# Lightweight configuration without the POWER10K theme
if [[ ${isTINY_ZSH} != "1" ]]; then
    git clone "$GithubMirror"https://github.com/romkatv/powerlevel10k.git $DOTFILES/zsh/.powerlevel10k
else
    export isTINY_ZSH='1'
fi

# Switch the default shell
chsh -s $(which zsh)
zsh