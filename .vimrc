set nocompatible
set shell=zsh

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
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'derekwyatt/vim-scala'
Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'moll/vim-node'
Plugin 'chrisbra/csv.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'mattn/webapi-vim'
Plugin 'tyru/open-browser.vim'
Plugin 'vim-scripts/DrawIt'
Plugin 'hashivim/vim-hashicorp-tools'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ensime/ensime-vim'
Plugin 'pantsbuild/vim-pants'
Plugin 'jparise/vim-graphql'
Plugin 'vim-ruby/vim-ruby'
Plugin 'google/vim-maktaba'
Plugin 'bazelbuild/vim-bazel'
Plugin 'bazelbuild/vim-ft-bzl'
Plugin 'google/vim-jsonnet'

call vundle#end()
filetype plugin indent on

" colors
colorscheme candy

" open NERDTree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" ignore these files
let NERDTreeIgnore = ['\.pyc$', 'bazel-.*']

"emmet
let g:user_emmet_settings = { 'liquid': { 'extends': 'html', }, }

"keyboard shortcuts
map ,d :NERDTreeToggle<CR>
map ,t :NERDTree

"general startup commands
set encoding=utf-8
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
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"use a .lvimrc without asking
let g:localvimrc_sandbox=0
let g:localvimrc_ask=0
let g:localvimrc_name=['.lvimrc']

"terraform
let g:terraform_fmt_on_save=1

"youcompleteme
let g:ycm_server_python_interpreter='/usr/local/bin/python'
let g:ycm_autoclose_preview_window_after_insertion=1

"ensime
autocmd BufWritePost *.scala silent :EnTypeCheck
nnoremap <localleader>t :EnType<CR>
let ensime_server_v2=1

"scala
let g:syntastic_mode_map = { "mode": "active", "active_filetypes": [], "passive_filetypes": ["scala"]}

"jsonnet
let g:jsonnet_fmt_on_save = 0
