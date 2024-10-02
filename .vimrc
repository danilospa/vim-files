if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'jremmen/vim-ripgrep'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tlib_vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'grvcoelho/vim-javascript-snippets'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-surround'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'digitaltoad/vim-pug'
Plug 'morhetz/gruvbox'
Plug 'wmvanvliet/vim-blackboard'
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mhartington/nvim-typescript', {'do': ':!install.sh \| UpdateRemotePlugins'}
Plug 'Shougo/denite.nvim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

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

" Execute FZF ignoring gitignore folders
nnoremap <C-p> :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached' })) <cr>

" Paste from system clipboard
nmap <Leader>p "+p

" Mapping for quick js/less/scss folding
nmap <leader>f vi{zf

" Alternate between last opened buffer
nnoremap <leader><leader> <c-^>

" End of line and First non-blank chracter of the line
nnoremap H ^
nnoremap L $

" Copy relative file path
nnoremap cf :let @*=expand('%')<cr>

" ########## COMMAND-LINE MODE MAPPING ##########

" Map %% to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Map json to format json
cnoremap json %!python3 -m json.tool<cr>

" Navigate without arrows on command line
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

" ########## FILE SPECIFIC MAPPING ##########

" Find references for TS
autocmd FileType typescript nnoremap <leader>u :TSRefs<cr>
autocmd FileType typescript nnoremap <leader>d :TSDef<cr>

" Swap between code/spec
autocmd FileType typescript,javascript,ruby cmap A<cr> :call SwapBetweenSpecAndCodeFile()<cr>

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

" Set line break
set linebreak

" Don't show invisibles
set nolist

" Invisibles for tab and end of line
set listchars=tab:▸\ ,eol:¬,trail:·

" Handle multiple buffer better
set hidden

" Enable custom project configurations
set exrc

" Ignore case when search
set ignorecase

" If expression has capital letter the case is relevant
set smartcase

set relativenumber

" FUNCTIONS
function! SwapBetweenSpecAndCodeFile()
  let filename = expand('%:t')
  let extension = expand('%:e')

  if filename =~ '.spec.'
    let filenameWithoutWithoutExtension = substitute(expand('%:t:r'), '.spec', '', '')
    let file = system('find . -name "*' . filenameWithoutWithoutExtension . '*' . extension . '" -not -name "*spec*"')
  else
    let file = system('find . -name "*' . expand('%:t:r') . '*spec*' . extension . '"')
  endif

  exec ':e ' . file
endfunction

let g:deoplete#enable_at_startup = 1
set omnifunc=TSOmnicFunc

let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog  = '/usr/local/bin/python3'

colorscheme gruvbox
" colorscheme blackboard
" colorscheme base16-default-dark
