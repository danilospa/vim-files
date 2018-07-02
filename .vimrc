runtime bundle/vim-pathogen/autoload/pathogen.vim
runtime bundle/vim-plug/plug.vim

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

execute pathogen#infect()
syntax on
filetype plugin indent on

nnoremap <C-n> :NERDTree <cr>
nnoremap <C-p> :FZF <cr>

let mapleader = ' '

" Alternate between last opened buffer
nnoremap <leader><leader> <c-^>
