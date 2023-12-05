" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Setup
let mapleader = "\<Space>"
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set number
set mouse=a
set clipboard=unnamed
syntax on
set cursorline
set showmatch
set relativenumber
set splitright
set splitbelow
set autochdir
set wildmenu
set hidden
filetype plugin indent on
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround
set wrap
set laststatus=2
set showcmd
set showmode
set modeline
set ruler
set title
set list
set number
set textwidth=80
set colorcolumn=+1
set nohlsearch
set incsearch
set ignorecase
set smartcase
set termguicolors

" Plugins
call plug#begin('~/.vim/plugged')
  " syntax
  Plug 'sheerun/vim-polyglot'

  " status bar
  Plug 'maximbaz/lightline-ale'
  Plug 'itchyny/lightline.vim'

  " themes
  Plug 'chriskempson/base16-vim'
  Plug 'morhetz/gruvbox'

  " tree
  Plug 'scrooloose/nerdtree'

  " ide
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-surround'
  Plug 'yggdroot/indentline'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-repeat'

call plug#end()

colorscheme base16-ocean 
