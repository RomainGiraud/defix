"" My vimrc!

" disable vi compatibility
set nocompatible
 
" disable blinks and beeps
set noerrorbells
 
" enable mouse
if has('mouse')
  set mouse=a
endif
 
" display line numbers
set nu
set relativenumber
 
" define keys <backspace> and <del>
" remove: indent, eol, start
"   - 0 => none
"   - 1 => indent,eol
"   - 2 => indent,eol,start
set bs=2
 
" smart indent
set smartindent
 
" load indent and plugins depending of filetype
filetype plugin indent on
 
" syntax highlighting
syntax on
 
" display status bar
" 'set rulerformat=[...]'
set laststatus=2
set ruler
 
" display incomplete commands in status bar
set showcmd
 
" replace tab by spaces
set expandtab
 
" auto-indent size (+ >> and <<)
set shiftwidth=4
 
" size indent <tab> and <backspace>
set softtabstop=4
 
" size indent for <tab> without 'expandtab'
set tabstop=4
 
" loop search
set wrapscan
 
" incremental search
set incsearch
 
" disable color highlighting of search
set nohlsearch

" ignore case search
set ignorecase
set smartcase

" jump to matching bracket
set showmatch
 
" disable backups (~file)
set nobackup

" underline current line
set cursorline

" scroll lines around
set scrolloff=10

" refresh file if updated
set autoread
 
" black background
set background=dark
 
 
" indent param for some filetypes
au FileType html set softtabstop=2
au FileType html set shiftwidth=2
au FileType html set tabstop=2
 
au FileType xml set softtabstop=2
au FileType xml set shiftwidth=2
au FileType xml set tabstop=2
 
au FileType ant set softtabstop=2
au FileType ant set shiftwidth=2
au FileType ant set tabstop=2
 
au FileType php set softtabstop=2
au FileType php set shiftwidth=2
au FileType php set tabstop=2
 
au FileType yaml set softtabstop=2
au FileType yaml set shiftwidth=2
au FileType yaml set tabstop=2
 
au FileType javascript set softtabstop=2
au FileType javascript set shiftwidth=2
au FileType javascript set tabstop=2
 
au FileType ruby set softtabstop=2
au FileType ruby set shiftwidth=2
au FileType ruby set tabstop=2
 
au FileType eruby set softtabstop=2
au FileType eruby set shiftwidth=2
au FileType eruby set tabstop=2
 

" file templates
"autocmd BufNewFile main.cpp 0r $HOME/.vim/templates/main.cpp.tpl
"autocmd BufNewFile Makefile 0r $HOME/.vim/templates/Makefile.tpl


" full color range
set t_Co=256
set term=xterm-256color
