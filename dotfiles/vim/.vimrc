set nocompatible
set number
set relativenumber
set smartcase 
set smartindent 
set splitbelow 
set confirm 
set ignorecase 
set hlsearch
set expandtab 
set nowrap
set wildmenu
set showmatch
set fillchars="eob: "
set path+=**
set path+=*.*
set noswapfile

set tabstop=2           "the amount of spaces that vim will equate to a tab character
set softtabstop=2       "like tabstop, but for editing operations (insert mode)
set shiftwidth=2        "used for autoindent and << and >> operators in normal mode
set autoindent          "copies indent from current line to the next line
set expandtab   

syntax enable                   "turn syntax highlighting on
filetype plugin indent on       "load plugin and indent files associated a detected filetype
runtime macros/matchit.vim      

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <S-h> :bprev<CR>
nnoremap <silent> <S-l> :bnext<CR>
nnoremap - :E<CR>
inoremap <silent> <C-Space> <C-x><C-o>
