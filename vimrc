""""""""""""""""" COMPATABILITY
" disable vi compatibility (emulation of old bugs)
set nocompatible

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8


""""""""""""""""" COLORS

" enable syntax processing
syntax enable


""""""""""""""""" SPACES AND TABS

" number of visual spaces per tab
set tabstop=4

" number of spaces in tab when editing
set softtabstop=4

" tabs are spaces
set expandtab

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent


"""""""""""""""" UI CONFIG

" show line numbers
set number

" show last command entered in bottom right
set showcmd

" highlight current line
set cursorline

" show column line at 81 character mark
set colorcolumn=81

" load filetype-specific indent files
filetype indent on

" visual autocomplete for command menu
set wildmenu

" redraw screen only when necessary (boosting macro speed)
set lazyredraw

" highlight matching [{()}]
set showmatch


"""""""""""""""" SEARCHING

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" search words are case insensitive ...                         
set ignorecase 

" ... Unless they contain at least 1 capital letter
set smartcase  

