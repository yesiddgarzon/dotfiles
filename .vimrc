".vimrc Setup

"" -- Lets Use Vim-Plug
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"" -- GENERAL CONFIGURATION --
let mapleader=" "
set nocompatible
set encoding=utf-8
set clipboard=unnamed

" Syntax highlighting
filetype plugin on
syntax enable
set showmatch

" Buffer
set splitright
set splitbelow
set autochdir

" Text management
filetype plugin indent on
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround
"set nowrap
set spell

" Visual
set laststatus=2
set showmode
set showcmd
set modeline
set ruler
set title
set relativenumber
set number
set textwidth=80
set colorcolumn=+1
set cursorline
set termguicolors

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" -- PLUGINS LOADER --
call plug#begin('~/.vim/plugged')

" syntax
Plug 'sheerun/vim-polyglot'

" theme
Plug 'itchyny/lightline.vim'
Plug 'nordtheme/vim'
Plug 'morhetz/gruvbox'

" Tree
Plug 'scrooloose/nerdtree'

" typing
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

call plug#end()

"" -- PLUGINS CONFIGURATIONS --

" colorscheme
colorscheme gruvbox

set background=dark


let g:nord_italic = 1
let g:nord_italic_comments = 1

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"" -- Keymaps

" scrolling
nnoremap <C-j> 5j
nnoremap <C-k> 5k

" moving lines
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
nnoremap K :m .+1<CR>==
nnoremap J :m .-2<CR>==

" fast quit and save
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <C-s> :wq!<CR>
