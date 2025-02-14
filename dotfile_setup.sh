#!/bin/sh

ln -s ~/dotfile/.bashrc ~/.bashrc


## vim setup
ln -s ~/dotfile/.vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## nvim setup
mkdir ~/.config/nvim
ln -s ~/dotfile/.vimrc ~/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
