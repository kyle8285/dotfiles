set nocompatible		" be iMproved, required
filetype off			" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim,/usr/local/opt/fzf
call vundle#begin()

Plugin 'Vundle/Vundle.vim'

Plugin 'flazz/vim-colorschemes'

Plugin 'junegunn/fzf.vim'	" fuzzy file search
Plugin 'mileszs/ack.vim'	" text search tool (grep/ag)
Plugin 'scrooloose/nerdtree'      " tree explorer

Plugin 'airblade/vim-gitgutter'   " show git diffs in gutter
Plugin 'pangloss/vim-javascript'  " syntax highlighting, etc
Plugin 'tpope/vim-surround'       " mappings for surroundings
Plugin 'tpope/vim-repeat'         " repeat mapped commands from plugins
Plugin 'tpope/vim-commentary'     " comment stuff out
Plugin 'mattn/emmet-vim'          " expanding abbreviations
Plugin 'w0rp/ale'                 " asynchronous linting
Plugin 'Yggdroot/indentLine'      " display lines for indentation
Plugin 'othree/javascript-libraries-syntax.vim' " syntax for javascript libraries

call vundle#end()		" required

" General

filetype plugin indent on 	" required
syntax on
colorscheme monokai

set background=dark
set foldmethod=marker
set mouse=a
set encoding=utf-8
set fileencodings=utf-8

set autoindent
set smartindent
set cindent
set shiftround
set nowrap

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

set ignorecase
set smartcase
set hlsearch
set incsearch

set history=1000
set undolevels=1000

set noswapfile
set nobackup

set backspace=indent,eol,start

" Remove highlighting search terms
nmap <Space>x :let @/=''<CR>

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Splits

" Window splits
nmap <Leader>swh :topleft vnew<CR>
nmap <Leader>swl :botright vnew<CR>
nmap <Leader>swk :topleft new<CR>
nmap <Leader>swj :botright new<CR>

" Buffer splits
nmap <Leader>sh :leftabove vnew<CR>
nmap <Leader>sl :rightbelow<CR>
nmap <Leader>sk :leftabove new<CR>
nmap <Leader>sj :rightbelow new<CR>

" Move between splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Reload vimrc
nmap <F5> :source ~/.vimrc<CR>

" Copy/Paste with clipboard
vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>

" fzf file search
nmap <Tab> :Buffer<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>r :Tags<CR>

" Ag Silver Searcher

" configure ack.vim to use ag (silver searcher) if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" don't jump to first result automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<space>

" git-gutter settings
set updatetime=100
let g:gitgutter_max_signs = 500   " default value
let g:gitgutter_map_keys = 0      " disable key mappings

" emmet settings
let g:user_emmet_install_global = 0
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
autocmd FileType html EmmetInstall

" ALE settings
let g:ale_linters = {
\ 'javascript': ['eslint']
\}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" NERDTree settings
nmap <Leader>t :NERDTreeToggle<CR>
nmap <Leader>F :NERDTreeFind<CR>    " go to file in tree
let NERDTreeAutoDeleteBuffer = 1    " delete buffers automatically

" indentLine settings
autocmd Filetype json let g:indentLine_enabled = 0  " prevents hiding quotes

let g:used_javascript_libs = 'underscore,angularjs,jasmine,jquery'
