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

" Mapping to show or hide invisibles
map <leader>l :set list!<cr>

" ########## VISUAL MODE MAPPING ##########

" Copy/Cut to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d

" Paste from system clipboard
vmap <Leader>p "+p

" End of line and First non-blank chracter of the line
vnoremap H ^
vnoremap L $

" ########## NORMAL MODE MAPPING ##########

nnoremap <C-n> :NERDTree <cr>
nnoremap <C-p> :FZF <cr>

" Paste from system clipboard
nmap <Leader>p "+p

" Mapping for quick js/less/scss folding
nmap <leader>f vi{zf

" Alternate between last opened buffer
nnoremap <leader><leader> <c-^>

" End of line and First non-blank chracter of the line
nnoremap H ^
nnoremap L $

" ########## COMMAND-LINE MODE MAPPING ##########

" Map %% to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

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
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Default tab width
set tabstop=2
set shiftwidth=2

" Use spaces instead of tabs
set expandtab

" Allow clipboard access when using tmux
set clipboard=unnamed

" Set line break
set linebreak

" Don't show invisibles
set nolist

" Invisibles for tab and end of line
set listchars=tab:▸\ ,eol:¬,trail:·

" Handle multiple buffer better
set hidden
