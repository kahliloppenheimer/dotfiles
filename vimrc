""""""""""""""""" COMPATABILITY
" disable vi compatibility (emulation of old bugs)
" Notable this must be done first because other settings
" depend on this
set nocompatible
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

""""""""""""""""" COLORS

" enable syntax processing
syntax enable


""""""""""""""""" SPACES AND TABS

" Fix vim backspace
set backspace=indent,eol,start
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

" Wrap words visually on line breaks
set wrap
" Only wrap around specific characters (i.e. not letters)
set linebreak
" List disables linebreak
set nolist 

" Prevent vim from automatically inserting line breaks in newly entered text
set textwidth=0
set wrapmargin=0
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

" Show as much as possible of a wrapped last line, not just "@".
set display=lastline    


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
" Ensures that navigation is by visual line rather than by physical line
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j


"""""""""""""""" MISC

" Autosaves when window loses focus
autocmd BufLeave,FocusLost * silent! wall

" Autocompile latex on save
command PdfLatex execute "!pdflatex -interaction=nonstopmode % > /dev/null && rm -f *.{log,aux,out}"
autocmd BufWritePost *.tex :PdfLatex
