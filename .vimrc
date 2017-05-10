set shell=/bin/sh

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tomasr/molokai'
Plugin 'leafgarland/typescript-vim'

" for Chaplin development, otherwise not needed
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'

call vundle#end()
filetype plugin indent on

set nocompatible

let mapleader=","

syntax on

set directory=~/.vimtmp

set tabpagemax=20

set history=1000 " longer history of searches and commands

" default indent is tab equal to 4 spaces
set shiftwidth=4
set tabstop=4
set expandtab

set showmatch " show pair braces when typing

set fileencodings=ucs-bom,utf8,prc
set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8

" status line
set ruler
set laststatus=2

set statusline=%(%m\ %)%f%(\ %y%)%(\ [%{&fileencoding}]%)\ %{fugitive#statusline()}%=[%3b,%4(0x%B%)]\ %3c\ %4l\ /%5L\ %4P
set statusline+=%#warningmsg#
set statusline+=%*

set showcmd
set mouse=a

" display leading tabs and trailing whitespace
set list lcs=tab\:\'\ ,trail:~
" FIXME: temporarily disabled
set nolist
noremap <silent> <F19> :set list!<CR>

set t_Co=256 " number of colors
colorscheme molokai

" line numbering
set number

" load my ftplugins etc. - commented out, breaks my indentation
" filetype plugin indent on
filetype plugin on

" autoindentation for all filetypes
set autoindent

" filetype specific configuration
autocmd BufRead,BufNewFile *.es6 set filetype=javascript
autocmd BufRead,BufNewFile *.ts set filetype=javascript
autocmd BufRead,BufNewFile *.tsx set filetype=javascript
autocmd BufRead,BufNewFile *.py set filetype=python
autocmd BufRead,BufNewFile *.html set filetype=htmldjango

" python specific indentation settings
autocmd FileType python set cinwords=if,elif,else,for,while,try,except,finally,def,class

autocmd FileType css,scss set smarttab smartindent expandtab

" no wrapping long lines in html
autocmd FileType html,htmldjango set nowrap expandtab
autocmd FileType javascript set nowrap expandtab
autocmd FileType javascript,typescript set nowrap expandtab

" wrap text at nearest space and show + at the beginning of the next line
set showbreak=+
set linebreak

" make search behave in a sane way
set incsearch
set ignorecase
set smartcase

set confirm " confirm :q! etc.

" allow backspaces to eat indents, end-of-line/beginning-of-line characters
set backspace=indent,eol,start

set foldmethod=indent
set nofoldenable

" saner autocompletion (behave more like shell)
set wildmenu
set wildmode=longest,list,full
set wildignore=*.pyc,*.jpg,*.gif,*.png,*.pdf,*.o,*.,*.hbs.js,*.js.map,*.es6.js

" keep more context when scrolling (5 lines behind cursor)
set scrolloff=5

" experimenting with hlsearch turned off
" set hlsearch
nnoremap <CR> :noh<CR><CR> " clear search highlight on enter

" keyboard mappings

" learning mode - don't touch those pesky arrow keys :-)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" movement by screen line as opposed to file line
nnoremap j gj
nnoremap k gk

" alternative tab switching
noremap <C-J> :tabprevious<CR>
noremap <C-K> :tabnext<CR>

" gp select previously pasted or edited text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

set pastetoggle=<F10>

imap <F10> <ESC>:set paste!<CR>a

" some leader shortcuts for common commands
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

nmap <leader>nw :set nowrap!<CR>

noremap <leader>t :CtrlP<CR>

noremap <leader>r :CommandTFlush<CR>

" dot returns cursor back after command is repeated
nmap . .`[

" using jj is easier to type than ESC or C-[ for leaving insert mode
inoremap jj <ESC>

" no cursor line underline
hi clear CursorLine

" gui font
set gfn=Monaco:h13

let g:ctrlp_match_window = 'bottom,order:ttb,max:20'
" don't load the whole git repo
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|DS_Store\|git'
