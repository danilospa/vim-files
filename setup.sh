#!/bin/bash

ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.vim ~/.vim
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/.inputrc ~/.inputrc

pushd .vim/bundle/vimproc.vim
make
popd
