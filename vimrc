" Vundle {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'

Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'bkad/CamelCaseMotion'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'kristijanhusak/vim-multiple-cursors'
Plugin 'joom/vim-commentary'
Plugin 'vim-scripts/Align'
Plugin 'valloric/MatchTagAlways'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'wesQ3/vim-windowswap'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'gcmt/wildfire.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'rking/ag.vim'

"Front End
Plugin 'pangloss/vim-javascript'
Plugin 'ap/vim-css-color'
Plugin 'miripiruni/CSScomb-for-Vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'
Plugin 'groenewege/vim-less'
Plugin 'digitaltoad/vim-pug'
Plugin 'othree/yajs.vim'
"Color Schemes
Plugin 'vim-scripts/wombat256.vim'

call vundle#end()            " required
" }}}

" Plugin Settings {{{
let g:windowswap_map_keys = 0 "prevent default bindings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" }}}

" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 "change 0 to 1 if you have a powerline font
set laststatus=2
set t_Co=256
" }}}

" NERDTree {{{
let g:NERDTreeMapChangeRoot =  "`"

nmap <Leader>] :NERDTreeTabsToggle<CR>
nnoremap <Space>c :NERDTreeCWD<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeShowLineNumbers = 1
let NERDTreeWinSize = 25

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()
" }}}

" General {{{

set nocompatible
filetype off
set foldmethod=marker
set linebreak

set number

syntax on
set mouse=a

filetype plugin indent on

set encoding=utf-8
set fileencodings=utf-8

set autoindent
set smartindent
set cindent
set background=dark
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set wildignore=*.pyc
set ignorecase
set smartcase
set hlsearch
set incsearch
set shiftround
set history=1000
set undolevels=1000
set noswapfile
set nobackup
set number
set linespace=3
set nowrap

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
" }}}

" Some Useful Key Mappings {{{

"Split swap
nmap <Tab> :CtrlPBuffer<CR>
nmap <Leader>f :CtrlPLine<CR>
nnoremap <silent> <Leader>sw :call WindowSwap#EasyWindowSwap()<CR>
nmap <Leader>` :call WindowSwap#EasyWindowSwap()<CR><Leader>[:call WindowSwap#EasyWindowSwap()<CR>

"Window splits
nmap <leader>swh :topleft vnew<CR>
nmap <leader>swl :botright vnew<CR>
nmap <leader>swk :topleft new<CR>
nmap <leader>swj :botright new<CR>

"Buffer splits
nmap <leader>sh :leftabove vnew<cr>
nmap <leader>sl :rightbelow vnew<cr>
nmap <leader>sk :leftabove new<cr>
nmap <leader>sj :rightbelow new<cr>

"for unhighlighing the selections
nmap <Space>x :let @/=''<CR>

"split switch
nnoremap <Leader>[ <C-W>w

"Split movement bindings
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"System clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"Keep the cursor in the same place after yank
vmap y ygv<Esc>

"Reload vimrc
nmap <F5> :source ~/.vimrc<CR>

"New Tab
nmap <Leader>n :tabnew<CR>

"Paste mode toggle
set pastetoggle=<F5><F5>

"Keep selection after indent
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" "Camel case motion (with shift)
map <Space>w <Plug>CamelCaseMotion_w
map <Space>b <Plug>CamelCaseMotion_b
map <Space>e <Plug>CamelCaseMotion_e

" Less to Css
nnoremap <Leader>m :w <BAR> !lessc % > @:t:r.css<CR><space>
" }}}

let g:ag_working_path_mode="r"

set clipboard=unnamedplus
colorscheme wombat256mod
