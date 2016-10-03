
set nocompatible
filetype off
" This is all Plugin stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" This makes vim pretty colors
Plugin 'altercation/vim-colors-solarized'
"Filebrowser for Vim
Plugin 'scrooloose/nerdtree'
"fuzzy file finder
Plugin 'kien/ctrlp.vim'
"git wrapper
Bundle 'tpope/vim-fugitive'
" puppet syntax plugin
Bundle 'puppetlabs/puppet-syntax-vim'
"nerdtree tabs plugin
Bundle 'jistr/vim-nerdtree-tabs'
"Pretty and useful buffer line
Plugin 'bling/vim-airline'
" Ansible development plugin
Plugin 'MicahElliott/Rocannon'
call vundle#end()
filetype plugin indent on
"that is the end of plugin stuff
"set cursor to never reach bottom
set cursorline
set number
let mapleader=","
set ignorecase
set smartcase
set scrolloff=5
set backspace=indent,eol,start
set hlsearch
set incsearch
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smarttab
set ruler
set showtabline=2
"do not real tab only space
set softtabstop=4
set autoindent
set laststatus=2
"sets tab character and trailing dot
set list listchars=tab:»·,trail:·,extends:$,nbsp:=
"puppet setttings
autocmd Filetype puppet setlocal shiftwidth=2 softtabstop=2 tabstop=2
map ` <Nop>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
"backup what you are working on here
set backupdir=~/.vim/backup
set directory=~/.vim/backup

set guioptions=
syntax enable

map <Leader>t :NERDTreeTabsToggle<CR>
map <Leader>b :CtrlPBuffer<CR>
