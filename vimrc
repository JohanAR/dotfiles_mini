set nocompatible
filetype indent plugin on
syntax enable
set number
" set foldmethod=indent
set foldnestmax=3
set showmatch
set backspace=eol,start,indent
set expandtab
set shiftwidth=2
set tabstop=4
set softtabstop=2
set smarttab
set history=100
"set ignorecase
set incsearch
set magic
set hlsearch
set nobackup
set nowritebackup
set noswapfile
set completeopt=menu,longest
set wildmenu
set browsedir=buffer
set nowrap
set hidden
set mouse=a
let g:PHP_vintage_case_default_indent=1
set relativenumber
set cursorline
colorscheme peachpuff
let mapleader = "'"

" jamessan's
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

set laststatus=2

set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,conceal:C,nbsp:%

nnoremap <C-K> :bnext<CR>
nnoremap <C-J> :bprev<CR>
nnoremap <C-X> :bprev<CR>:bdelete#<CR>

:highlight SpecialKey ctermfg=DarkGray guifg=Cyan
:highlight NonText ctermfg=DarkGray guifg=Blue gui=bold
:highlight LineNr ctermfg=DarkGray guifg=Yellow
:highlight Visual cterm=reverse ctermbg=NONE
:highlight Search ctermbg=DarkYellow
:highlight StatusLineNC ctermfg=DarkGray ctermbg=LightGrey
:highlight VertSplit ctermfg=DarkGray ctermbg=Black
:highlight CursorLine cterm=bold

" Read output of shell command into scratch buffer
:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

" File type dependent indentation
autocmd FileType java setlocal shiftwidth=4 softtabstop=4
autocmd FileType xml setlocal shiftwidth=4 softtabstop=4
