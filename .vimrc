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
set termguicolors
"optional settings
set cursorline
set showcmd
set ruler
set foldmethod=marker

"-----------------------------------
"             Plugins
"-----------------------------------
call plug#begin("~/.vim/plugged")

"theme
Plug 'morhetz/gruvbox'
"statusline
Plug 'vim-airline/vim-airline'
"git support
Plug 'tpope/vim-fugitive'
"explorer
Plug 'scrooloose/nerdtree'
"syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex'
"intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
"-----------------------------------

"-----------------------------------
"         Plugin settings
"-----------------------------------
"theme
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox
"statusline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled=1
"explorer
let NERDTreeQuitOnOpen=1
"intellisense engine
let g:coc_global_extensions=[ 'coc-tsserver', 'coc-rls', 'coc-clangd' ]
"                                 js/ts         rust          c
source ~/.vim/coc.vim

"-----------------------------------
"          Mapping keys
"-----------------------------------
"vanilla maps
noremap <silent> <space><space> /\s\+$<cr>
noremap <silent> <space>rm :%s/\s\+$//<cr>
noremap <silent> <space>hl :set hlsearch<cr>
noremap <silent> <space>nhl :nohlsearch<cr>
noremap <silent> <space>no :set number<cr>:set relativenumber<cr>
noremap <silent> <space>nno :set nonumber<cr>:set norelativenumber<cr>

function! Compile(current_file)
    if a:current_file=="c"
        execute "w"
        execute "!clear&&gcc %:p -o %:p:r&&%:p:h/./%:t:r"
    endif
    if a:current_file=="python"
        execute "w"
        execute "!clear&&python3 %:p"
    endif
    if a:current_file=="tex"
        execute "w"
        execute "!clear&&pdflatex %:p"
    endif
    if a:current_file=="rust"
        execute "w"
        execute "!clear&&cargo run"
    endif
endfunction

nnoremap <silent> <space>c :let current_file=&filetype<cr>:call Compile(current_file)<cr>

"explorer
nmap <space>nt :NERDTreeFind<cr>
