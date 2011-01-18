set nocompatible
call pathogen#runtime_append_all_bundles()

let mapleader=","

syntax on

set history=1000 " longer history of searches and commands

" remember undo and stuff when I close buffers
" set hidden

" default indent is tab equal to 4 spaces
set shiftwidth=4
set tabstop=4
set noexpandtab

set showmatch " show pair braces when typing

set tenc=utf-8 " terminal encoding
set fenc=utf-8 " file encoding
set enc=utf-8  " vim encoding

" status line
set ruler
set laststatus=2
set statusline=%(%m\ %)%f%(\ %y%)%(\ [%{&fileencoding}]%)%=[%3b,%4(0x%B%)]\ %3c\ %4l\ /%5L\ %4P
set showcmd
set mouse=c

set list lcs=tab\:\'\ ,trail:~
set t_Co=256 " number of colors
colorscheme ir_black

set cul " current row highlight
set nu  " line numbering

" load my ftplugins etc. - commented out, breaks my indentation
" filetype plugin indent on

" autoindentation for all filetypes
set autoindent

" filetype specific configuration
autocmd BufRead,BufNewFile *.py set filetype=python
autocmd BufRead,BufNewFile *.html set filetype=htmldjango

" python specific indentation settings
autocmd FileType python set expandtab tabstop=4 smarttab smartindent
autocmd FileType python set autoindent softtabstop=4 shiftwidth=4
autocmd FileType python set cinwords=if,elif,else,for,while,try,except,finally,def,class

" no wrapping long lines in html
autocmd FileType html,htmldjango set nowrap noexpandtab

" wrap text at nearest space and show + at the beginning of the next line
set showbreak=+
set linebreak

" make search behave in a sane way
set incsearch
set ignorecase
set smartcase

set backup
set backupdir=~/tmp
set directory=~/tmp,/tmp,. " directories for swap files
set confirm " confirm :q! etc.

highlight User1 guibg=white guifg=blue
highlight User2 guibg=white guifg=red
" allow backspaces to eat indents, end-of-line/beginning-of-line characters
set backspace=indent,eol,start

set foldmethod=indent
set nofoldenable

" remove trailing whitespace from code files on save
function! StripTrailingWhitespace()

  " store current cursor location
  silent exe "normal mq<CR>"
  " store the current search value
  let saved_search = @/

  " delete the whitespace (e means don't warn if pattern not found)
  %s/\s\+$//e

  " restore old cursor location
  silent exe "normal `q<CR>"
  " restore the search value
  let @/ = saved_search

endfunction

autocmd BufWritePre *.py,*.html,*.js,*.css,*.json call StripTrailingWhitespace()

" saner autocompletion (behave more like shell)
set wildmenu
set wildmode=list:longest
set wildignore=*.pyc,*.jpg,*.gif,*.pdf,*.o,*.so

" keep more context when scrolling (3 lines behind cursor)
set scrolloff=5

" hide pyc files from NERDTree dialogs and autocompletion
let NERDTreeIgnore=['.*\.pyc$']

set hlsearch
nnoremap <CR> :noh<CR><CR> " clear search highlight on enter

" w!! asks for root password and saves as root
cmap w!! %!sudo tee > /dev/null %

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

set pastetoggle=<F10>
noremap <silent> <F11> :set nohlsearch<CR>
noremap <silent> <F12> :set nu!<CR>

imap <F10> <ESC>:set paste!<CR>a
imap <F12> <ESC>:set nu!<CR>a

" quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>wv :so $MYVIMRC<CR>

" some leader shortcuts for common commands
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

nmap <leader>nt :NERDTree<CR>

" using jj is easier to type than ESC or C-[ for leaving insert mode
inoremap jj <ESC>

" make zencoding work for filetypes other than html
let g:user_zen_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'htmldjango' : {
  \    'extends' : 'html',
  \  },
  \}

let g:CommandTMaxFiles=20000
