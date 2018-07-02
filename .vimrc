runtime bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()
syntax on
filetype plugin indent on

nnoremap <C-n> :NERDTree <cr>

let mapleader = ' '

" Alternate between last opened buffer
nnoremap <leader><leader> <c-^>
