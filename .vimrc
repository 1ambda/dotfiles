call plug#begin()

"" Plugins
Plug 'nordtheme/vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'roy2220/easyjump.tmux'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Default
set encoding=UTF-8
set termguicolors
set mouse=a

set nonumber
set paste
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

set hlsearch
set incsearch
set smartcase

set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

set nowrap
set sidescroll=2
set sidescrolloff=10

set langmap=ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz

let g:airline#extensions#tabline#enabled = 1
let g:indent_guides_enable_on_vim_startup = 1

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

autocmd VimEnter * Limelight


" Key
let mapleader = "\<Space>"

let g:easyjump_smart_case = v:true
let g:easyjump_label_chars = 'fjdkslaghrueiwoqptyvncmxzb1234567890'
let g:easyjump_label_attrs = "\e[1m\e[38;5;172m"
let g:easyjump_text_attrs = "\e[0m"

nmap <C-J> <Plug>EasyJump
imap <C-J> <Plug>EasyJump
vmap <C-J> <Plug>EasyJump
omap <C-J> <Plug>EasyJump

" Theme
colorscheme nord


let &t_ti.="\<Esc>[1 q"
let &t_SI.="\<Esc>[5 q"
let &t_EI.="\<Esc>[1 q"
let &t_te.="\<Esc>[0 q"

highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow


" PLUGIN: Fzf
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>


" PLUGIN: Nerdtree
let NERDTreeWinPos = "left"
nmap  <C-e> :NERDTreeToggle<CR> " Ctrl + E

execute 'source /Users/kun/github/external/fzf-dotfiles/fzf.vim'
