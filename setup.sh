#!/bin/bash

[ ! -d "~/.vim" ] && mkdir ~/.vim
ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.vim/backup ~/.vim/backup
ln -s $(pwd)/.vim/swap ~/.vim/swap
ln -s $(pwd)/.vim/undo ~/.vim/undo
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/.inputrc ~/.inputrc
ln -s $(pwd)/.config/nvim/init.vim ~/.config/nvim/init.vim

git config --global core.excludesfile $(pwd)/.gitignore.global

[ ! -d "~/.tmux/plugins/tpm" ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

EXTENSION_INCLUDED=$(cat ~/.bash_profile | grep $(pwd)/.bash_profile_extension)
if [ -z "$EXTENSION_INCLUDED" ]; then
  echo source $(pwd)/.bash_profile_extension >> ~/.bash_profile
fi

ZSH_INCLUDED=$(cat ~/.zshrc | grep $(pwd)/.zshrc_extension)
if [ -z "$ZSH_INCLUDED" ]; then
  echo source $(pwd)/.zshrc_extension >> ~/.zshrc
fi

read -p "Setup for neovim?: (y/n) " neovim_setup
if [ "$neovim_setup" == "y" ]; then
  mkdir -p ~/.config/nvim
  NVIM_FILE=~/.config/nvim/init.vim
  echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" >> $NVIM_FILE
  echo "let &packpath = &runtimepath" >> $NVIM_FILE
  echo "source ~/.vimrc" >> ~/.config/nvim/init.vim
fi
