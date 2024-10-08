if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'jremmen/vim-ripgrep'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tlib_vim'
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
Plug 'Shougo/denite.nvim'
Plug 'johmsalas/text-case.nvim'
Plug 'pmizio/typescript-tools.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
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

let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog  = '/usr/local/bin/python3'

colorscheme gruvbox
" colorscheme blackboard
" colorscheme base16-default-dark

" text-case bindings
let g:snipMate = { 'snippet_version' : 0 }

nnoremap gau :lua require('textcase').current_word('to_upper_case')<CR>
nnoremap gal :lua require('textcase').current_word('to_lower_case')<CR>
nnoremap gas :lua require('textcase').current_word('to_snake_case')<CR>
nnoremap gad :lua require('textcase').current_word('to_dash_case')<CR>
nnoremap gan :lua require('textcase').current_word('to_constant_case')<CR>
nnoremap gad :lua require('textcase').current_word('to_dot_case')<CR>
nnoremap gaa :lua require('textcase').current_word('to_phrase_case')<CR>
nnoremap gac :lua require('textcase').current_word('to_camel_case')<CR>
nnoremap gap :lua require('textcase').current_word('to_pascal_case')<CR>
nnoremap gat :lua require('textcase').current_word('to_title_case')<CR>
nnoremap gaf :lua require('textcase').current_word('to_path_case')<CR>

function! ExecuteInNewPaneFromLine()
    " Get the command on the current line
    let l:command = getline('.')

    " Open a new pane
    vnew

    " Run the command and insert the output in the new pane
    execute 'read !' . l:command
endfunction

function! ExecuteInNewPaneFromFullBuffer()
    " Get the entire content of the current buffer
    let l:content = join(getline(1, '$'), "\n")

    " Open a new pane
    vnew

    " Run the command using the entire buffer content as input
    execute 'read !echo "' . substitute(l:content, '"', '\\"', 'g') . '" | sh'
endfunction

" need to not handle as buffer
map <leader>e :call ExecuteInNewPaneFromLine()<cr>
" not working as expected
map <leader>fe :call ExecuteInNewPaneFromFullBuffer()<cr>
