"    __  ___         _    ________  _______  ______
"   /  |/  /_  __   | |  / /  _/  |/  / __ \/ ____/
"  / /|_/ / / / /   | | / // // /|_/ / /_/ / /     
" / /  / / /_/ /    | |/ // // /  / / _, _/ /___   
"/_/  /_/\__, /     |___/___/_/  /_/_/ |_|\____/   
"       /____/                                     
"

syntax on
set encoding=utf-8

"line numbers
set number
set relativenumber
set numberwidth=3
"wild menu
set wildmenu
set wildmode=longest:full,full
"tabs to spaces
set shiftwidth=4
set tabstop=4
set expandtab
"highlight matches
set hlsearch
set incsearch
"style settings
set background=dark
set t_Co=256
"optional settings
set cursorline
set showcmd
set ruler
set foldmethod=marker

"-----------------------------------
"            Plugins
"-----------------------------------
call plug#begin("~/.vim/plugged")

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

call plug#end()
"-----------------------------------
