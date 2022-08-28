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
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
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
Plug 'airblade/vim-gitgutter'
"explorer
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'vim-python/python-syntax'
"intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"support for expanding abbreviations
Plug 'mattn/emmet-vim'
"man pages
Plug 'vim-utils/vim-man'

call plug#end()
"-----------------------------------

"-----------------------------------
"         Plugin settings
"-----------------------------------
"theme
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE
highlight CursorLine guibg=#1d2021
highlight CursorLineNR guibg=#1d2021
"statusline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline_theme='dark'
highlight! airline_tabfill guibg=black ctermbg=black
highlight! airline_tab guibg=#171742 guifg=white ctermbg=black
au VimEnter * highlight! airline_tabfill guibg=black ctermbg=black
au VimEnter * highlight! airline_tab guibg=#171742 guifg=white ctermbg=black
"vim-gitgutter
set signcolumn=yes
hi SignColumn guibg=Black
"explorer
let NERDTreeQuitOnOpen=1
"python
let g:python_highlight_all = 1
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
    execute "w"
    let command = ""

    if a:current_file == "c"      |let command = "gcc %:p -o %:p:r&&%:p:h/./%:t:r" |endif
    if a:current_file == "python" |let command = "python3 %:p"                     |endif
    if a:current_file == "tex"    |let command = "pdflatex %:p"                    |endif
    if a:current_file == "rust"   |let command = "cargo run"                       |endif
    if a:current_file == "java"   |let command = "javac %:p&&java -cp %:p:h %:t:r" |endif

    if command != "" | execute "!tput reset && clear && " . command | endif

endfunction

nnoremap <silent> <space>c :let current_file=&filetype<cr>:call Compile(current_file)<cr>

"explorer
nmap <space>nt :NERDTreeFind<cr>
"man pages
nmap <space>k <Plug>(Man)
nmap <space>v <Plug>(Vman)
