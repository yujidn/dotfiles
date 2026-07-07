#!/usr/bin/env bash
set -euo pipefail

DOTFILES="${HOME}/dotfiles"

ln -sfn "${DOTFILES}/.bashrc" "${HOME}/.bashrc"

## vim setup
ln -sfn "${DOTFILES}/.vimrc" "${HOME}/.vimrc"
curl -fLo "${HOME}/.vim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## nvim setup
mkdir -p "${HOME}/.config/nvim"
ln -sfn "${DOTFILES}/.vimrc" "${HOME}/.config/nvim/init.vim"
curl -fLo "${HOME}/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
