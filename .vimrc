runtime bundle/vim-pathogen/autoload/pathogen.vim
runtime bundle/vim-plug/plug.vim

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

execute pathogen#infect()
syntax on
filetype plugin indent on

" ########## MAPPINGS ##########

let mapleader = ' '

" Mapping for tab manipulation
map <leader>tt :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tm :tabmove

" ########## NORMAL MODE MAPPING ##########

nnoremap <C-n> :NERDTree <cr>
nnoremap <C-p> :FZF <cr>

" Alternate between last opened buffer
nnoremap <leader><leader> <c-^>

" ########## GENERAL CONFIGURATIONS ##########

" Show line numbers
set number

" Highlight match as you type
set incsearch
set hlsearch

" Turn on line wrapping.
set wrap

" Show 3 lines of context around the cursor.
set scrolloff=3

" Don't make a backup before overwriting a file.
set nobackup
set nowritebackup

" Keep swap files in one location
set directory=$HOME/.vim/tmp//,.

" Default tab width
set tabstop=2
set shiftwidth=2

" Use spaces instead of tabs
set expandtab
