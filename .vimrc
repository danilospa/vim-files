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

" Mapping for tab manipulation
map <leader>tt :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tm :tabmove
