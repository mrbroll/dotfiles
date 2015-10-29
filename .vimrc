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
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'derekwyatt/vim-scala'

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
"colorscheme monokai "just use the terminal's colorscheme instead
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
set colorcolumn=99

"get relative line numbers so I don't have to count that shit anymore
"also show absolute line number of the line the cursor is on
set relativenumber
set number

"fix python indentation
let g:pyindent_open_paren = '&sw * 1'
let g:pyindent_nested_paren = '&sw * 1'
let g:pyindent_continue = '&sw * 1'

"fix problem with backspace and delete not working
set backspace=2

"recommended syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"custom syntastic settings
let g:syntastic_java_javac_classpath = "/users/mrbroll/.gradle/caches/modules-*/files-*/**/*.jar"
let g:syntastic_scss_checkers=['']
let g:syntastic_html_checkers=['']
let g:syntastic_python_checkers=['flake8']

"local vimrc
let g:localvimrc_ask=0

"ctags config
"set tags=gcwd()/tags

