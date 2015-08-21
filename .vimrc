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

call vundle#end()
filetype plugin indent on

" open NERDTree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"emmet
let g:user_emmet_settings = { 'liquid': { 'extends': 'html', }, }

"keyboard shortcuts
map ,d :NERDTreeToggle<CR>

"general startup commands
syntax on
colorscheme candy
filetype plugin indent on
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set number
set expandtab

let g:syntastic_java_javac_classpath = "/users/mrbroll/.gradle/caches/modules-*/files-*/**/*.jar"
let g:syntastic_scss_checkers=['']
let g:syntastic_html_checkers=['']
