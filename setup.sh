#!/bin/bash

ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.vim ~/.vim
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/.inputrc ~/.inputrc

pushd .vim/bundle/vimproc.vim
make
popd

EXTENSION_INCLUDED=$(cat ~/.bash_profile | grep $(pwd)/.bash_profile_extension)
if [ -z "$EXTENSION_INCLUDED" ]; then
  echo source $(pwd)/.bash_profile_extension >> ~/.bash_profile
fi
