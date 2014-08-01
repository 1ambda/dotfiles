set nocompatible              " be iMproved, required
filetype off                  " required

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
Plugin 'jade.vim'
Plugin 'groenewege/vim-less'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
imap <C-c> <RETURN><ESC>k$a<RETURN>
Plugin 'scrooloose/syntastic'
let g:syntatic_check_on_open=1

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

"Plugin 'Valloric/YouCompleteMe'
"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_confirm_extra_conf=0
"set completeopt-=preview


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
"

" Settings
" theme
colorscheme desert
syntax on

set ruler
set number

"" no backup, autoread
set noswapfile
set nobackup
set nowb
set autoread

"" ignore files
set wildignore=*.o,*.pyc

"" history
set history=700

"" search, case
set hlsearch
set incsearch
set smartcase
set ignorecase

"" no bell
set noerrorbells
set novisualbell

"" encoding
set fileencoding=utf-8
set tenc=utf-8

"" indent, tab
set autoindent
set smartindent 
set expandtab
set tabstop=2
set shiftwidth=2
set lbr
set wrap

"" backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Custom Keys

"" visual mode related
vnoremap <slient> * :call VisualSelection('f')<CR>
vnoremap <slient> # :call VisualSelection('b')<CR>

"" leader
let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

"" emacs style
imap <C-A> <C-o>0
imap <C-E> <C-o>$
imap <C-F> <C-o>l
imap <C-B> <C-o>h
imap <C-N> <C-o>j
imap <C-P> <C-o>k
