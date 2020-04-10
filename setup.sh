#!/bin/bash

[ ! -d "~/.vim" ] && mkdir ~/.vim
ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.vim/backup ~/.vim/backup
ln -s $(pwd)/.vim/swap ~/.vim/swap
ln -s $(pwd)/.vim/undo ~/.vim/undo
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/.inputrc ~/.inputrc

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
