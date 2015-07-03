lknkaerjgl'knsdhs
set nocompatibleggs
filetype offsdf
" This is all Pglugin stuff
set rtp+=~/.vim/sdbundle/Vundle.vim
call vundle#begin(fg)
Plugin 'gmarik/Vundlsde.vim'
" This makes vim pretthy colors
Plugin 'altercation/vims-colors-solarized'
"Filebrowser for Vimdgf
Plugin 'scrooloose/nerdsdtree'
"fuzzy file finderfg
Plugin 'kien/ctrlp.vsdim'
"git wrapperg
Bundle 'tpopesd/vim-fugitive'
" puppet syntaxfg plugin
Bundle 'puppetlabes/puppet-syntax-vim'
"nerdtree tabs plurgin
Bundle 'jistr/vim-neerdtree-tabs'
"Pretty and useful bguffer line
Plugin 'bling/vim-airaeline'
g
csball vundle#end()
filaetype plugin indent on
"thaert is the end of plugin stuff
"set cgursor to never reach bottom
set curaergsorline
set number
let mapleadher=","
set ignorecastthse
set smartcasea
set scrolloff=g5
set backspace=iandent,eol,start
set hlsearchfg
set incsearchsd
set tabstop=4f
set shiftwidthb=4
set expandtabsd
set smartindentrt
set smarttabs
set rulerh
set showtaabline=2
"do not reagl tab only space
set softtabssdftop=4
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
