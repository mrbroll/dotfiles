set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"swapfiles!? we don't need no stinking swapfiles!
set noswapfile
set nobackup

" plugins
Plugin 'gmarik/Vundle.vim' " let vundle manage itself
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'tfnico/vim-gradle'
Plugin 'johnsyweb/vim-makeshift'
Plugin 'embear/vim-localvimrc'
Plugin 'mxw/vim-jsx'
Plugin 'fatih/vim-go'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'derekwyatt/vim-scala'
Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'moll/vim-node'

call vundle#end()
filetype plugin indent on

" open NERDTree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" ignore these files
let NERDTreeIgnore = ['\.pyc$']

"emmet
let g:user_emmet_settings = { 'liquid': { 'extends': 'html', }, }

"keyboard shortcuts
map ,d :NERDTreeToggle<CR>
map ,t :NERDTree

"general startup commands
syntax on
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set smartindent
set autoindent
set cindent
set expandtab
set clipboard=unnamed

"get relative line numbers so I don't have to count that shit anymore
"also show absolute line number of the line the cursor is on
set relativenumber
set number

"fix problem with backspace and delete not working
set backspace=2

"recommended syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"use a .lvimrc without asking
let g:localvimrc_sandbox=0
let g:localvimrc_ask=0
let g:localvimrc_name=['.lvimrc']
