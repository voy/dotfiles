syntax on

" default indent is tab equal to 4 spaces
set shiftwidth=4
set tabstop=4
set expandtab

set showmatch " show pair braces when typing

set tenc=utf-8 " terminal encoding
set fenc=utf-8 " file encoding
set enc=utf-8  " vim encoding

set showcmd
set mouse=c

set list lcs=tab\:\'\ ,trail:~
set t_Co=256 " number of colors
colorscheme ir_black

set cul " current row highlight
"set cuc " current column highlight
set nu " line numbering

" filetype specific configuration
autocmd BufRead,BufNewFile *.py set filetype=python
autocmd BufRead,BufNewFile *.html set filetype=htmldjango
autocmd FileType python source ~/.vimrc_python

" keyboard shortcuts
noremap <F10> :set paste!<CR>
noremap <silent> <F11> :set nohlsearch<CR>
noremap <silent> <F12> :set nu!<CR>
noremap <C-T> :tabnew<CR>
noremap <C-W> :q<CR>
noremap <C-O> :FufFile<CR>
"noremap <Tab> :tabnext<CR>
noremap <F1> :tabnext 1<CR>
noremap <F2> :tabnext 2<CR>
noremap <F3> :tabnext 3<CR>
noremap <F4> :tabnext 4<CR>
noremap <F5> :tabnext 5<CR>
noremap <F6> :tabnext 6<CR>
noremap <F7> :tabnext 7<CR>
noremap <F8> :tabnext 8<CR>
noremap <F9> :tabnext 9<CR>
noremap <C-J> :tabprevious<CR>
noremap <C-K> :tabnext<CR>

imap <F10> <ESC>:set paste!<CR>a
imap <F11> <ESC>:set nohlsearch<CR>a
imap <F11> <ESC>:cal VimCommanderToggle()<CR>a
imap <F12> <ESC>:set nu!<CR>a
imap <F1> <ESC>:tabnext 1<CR>a
imap <F2> <ESC>:tabnext 2<CR>a
imap <F3> <ESC>:tabnext 3<CR>a
imap <F4> <ESC>:tabnext 4<CR>a
imap <F5> <ESC>:tabnext 5<CR>a
imap <F6> <ESC>:tabnext 6<CR>a
imap <F7> <ESC>:tabnext 7<CR>a
imap <F8> <ESC>:tabnext 8<CR>a
imap <F9> <ESC>:tabnext 9<CR>a

" zalamuj text na nejblizsi mezere
" a na zacatku navazujiciho radku zobraz +
set showbreak=+
set linebreak

" umozni posouvani po zalomenych radcich v normal modu
"noremap <Up> gk
"noremap <Down> gj

" umozni posouvani po zalomenych radcich v insert modu
"imap <up> <c-o>gk
"imap <down> <c-o>gj

" scrollovani bufferu
" noremap <C-K> <C-Y>
" noremap <C-J> <C-E>

" find as you type
set incsearch
" confirm :q! etc.
set confirm
" set backup
" set backupdir=~/.backup
set directory=~/tmp,/tmp,. " directories for swap files

" status line
set laststatus=2
set statusline=%(%m\ %)%f%(\ %y%)%(\ [%{&fileencoding}]%)%=[%3b,%4(0x%B%)]\ %3c\ %4l\ /%5L\ %4P

highlight User1 guibg=white guifg=blue
highlight User2 guibg=white guifg=red
" maze pres konce radu
" set backspace=indent,eol,start
" set shiftround

" pouziva globalni schranku
set clipboard=unnamed

" Tab nabidke pro ex
set wildchar=<Tab>
set wildmenu
set wildmode=longest:full,full

set foldmethod=marker

" set wrapmargin=10

autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.css :%s/\s\+$//e
autocmd BufWritePre *.json :%s/\s\+$//e

" omnicomplete
autocmd FileType python set omnifunc=pythoncomplete
autocmd FileType javascript set omnifunc=javascriptcomplete
autocmd FileType html set omnifunc=htmlcomplete
autocmd FileType css set omnifunc=csscomplete

" hide pyc files from NERDTree dialogs and autocompletion
let NERDTreeIgnore=['.*\.pyc$']
set wildignore=*.pyc 

set hlsearch
nnoremap <CR> :noh<CR><CR>
