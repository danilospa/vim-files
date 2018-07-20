#!/bin/bash

ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.vim ~/.vim
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/.inputrc ~/.inputrc

git config --global core.excludesfile $(pwd)/.gitignore.global

pushd .vim/plugged/vimproc.vim
make
popd

EXTENSION_INCLUDED=$(cat ~/.bash_profile | grep $(pwd)/.bash_profile_extension)
if [ -z "$EXTENSION_INCLUDED" ]; then
  echo source $(pwd)/.bash_profile_extension >> ~/.bash_profile
fi
