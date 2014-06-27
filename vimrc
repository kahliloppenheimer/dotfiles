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

Bundle 'gmarik/vundle'

Bundle 'scrooloose/syntastic'
Bundle 'Valloric/ListToggle'
Bundle 'Valloric/YouCompleteMe'

" All plugins must be added before this line
filetype plugin indent on " reenabled after vundle setup complete


" YouCompleteMe setup

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" Global config file for ycm to use as default
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
" Plugin for syntastic to populate list with errors
let g:syntastic_always_populate_loc_list = 1
" Allow reading of cags
let g:ycm_collect_identifiers_from_tags_files = 1
set tags+=./tags;~



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

" ListToggle remappings
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'



