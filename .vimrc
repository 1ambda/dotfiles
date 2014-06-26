set nocompatible              " be iMproved, required
filetype off                  " required
set autoindent
set cindent
set smartindent
set nosi
set noai
set wrap
set nobackup
set ruler
set shiftwidth=2
set number
syntax on
set fileencoding=utf-8
set tenc=utf-8
set expandtab
set hlsearch
set ignorecase
set tabstop=2
set lbr
set incsearch
filetype indent on
colorscheme desert

" use Powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set t_Co=256
set laststatus=2

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'surround.vim'
Plugin 'matchit.zip'
Plugin 'Powerline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
