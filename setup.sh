#!/bin/bash

ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.vim ~/.vim
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

git config --global core.excludesfile "$(pwd)/.gitignore.global"
