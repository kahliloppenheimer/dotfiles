""""""""""""""""" COMPATABILITY
" disable vi compatibility (emulation of old bugs)
set nocompatible
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

""""""""""""""""" PLUGINS
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'w0ng/vim-hybrid'

call vundle#end()
" load filetype-specific indent files
filetype plugin indent on


""""""""""""""""" COLORS

" Add support for 256-colors for iTerm2
set t_Co=256

"Use https://github.com/w0ng/vim-hybrid colorscheme
:colorscheme hybrid

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
" set cindent

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
" Set insert mode cursors to be straight line
let &t_SI = "\<Esc>]50;CursorShape=1\x7" 
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Hack to get rid of delay when cursor is switching into escape mode
inoremap <special> <Esc> <Esc>hl

" show line numbers
set number

" show last command entered in bottom right
set showcmd

" highlight current line
set cursorline

" show column line at 81 character mark
set colorcolumn=81


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

" Set spellcheck
set spell

" Autosaves when window loses focus
autocmd BufLeave,FocusLost * silent! wall

" Autocompile latex on save
"command PdfLatex execute ":!pdflatex -interaction=nonstopmode % ; pdflatex -interaction=nonstopmode %; rm -f *.{log,aux,out}"

"Command taken from .vim/ftplugin
autocmd BufWritePost *.tex :BuildAndViewTexPdf

"Autocompile graphviz with dot
command PdfDot execute ":silent !dot -Tpdf % -o $(basename % .gv).pdf"
autocmd BufWritePost *.gv :PdfDot
