#!/usr/bin/env bash

mkdir -p "$ZDOTDIR"

ln -sf "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/zsh/.zshrc" "$ZDOTDIR/.zshrc"

git clone "$GithubMirror"https://github.com/zdharma-continuum/fast-syntax-highlighting $DOTFILES/zsh/plugins/fsh
git clone "$GithubMirror"https://github.com/zsh-users/zsh-autosuggestions $DOTFILES/zsh/plugins/zsh-autosuggestions
git clone "$GithubMirror"https://github.com/romkatv/powerlevel10k.git $DOTFILES/zsh/.powerlevel10k

# Switch the default shell
chsh -s $(which zsh)