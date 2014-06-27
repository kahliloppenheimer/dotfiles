""""""""""""""""" COMPATABILITY
" disable vi compatibility (emulation of old bugs)
" Notable this must be done first because other settings
" depend on this
set nocompatible
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

""""""""""""""" EXTENSIONS
filetype off " Needed to be off for vundle, but is enabled later on

" Vundle setup 
set rtp+=~/.vim/bundle/vundle

" All plugins must be added after this line
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'

" All plugins must be added before this line
filetype plugin indent on " reenabled after vundle setup complete


""""""""""""""""" COLORS

" enable syntax processing
syntax enable


""""""""""""""""" SPACES AND TABS

" number of visual spaces per tab
set tabstop=4

" number of spaces in tab when editing
set softtabstop=4

" (not exactly sure what this does, but it fixed an issue where vim was
"  indenting with an extra tab after a code block start)
set shiftwidth=4

" tabs are spaces
set expandtab

" use indentation of previous line
set autoindent

" Indentation optimized for C/C++
set cindent


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


"""""""""""""""" KEY REMAPPING
let mapleader=","

" Adds '_' to the list of word boundaries so that w will stop at underscores
set iskeyword-=_



