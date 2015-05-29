"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off 

call plug#begin('~/.vim/bundle')

Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'daylerees/colour-schemes', { 'rtp': 'vim'}
Plug 'godlygeek/tabular'
Plug 'jpalardy/vim-slime'
Plug 'kien/ctrlp.vim'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'othree/xml.vim'
Plug 'rizzatti/dash.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'szw/vim-ctrlspace'
Plug 'szw/vim-tags'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-surround'

Plug 'derekwyatt/vim-scala', { 'for': 'scala'}
Plug 'elzr/vim-json', { 'for': 'json'}
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'plasticboy/vim-markdown', {'for': 'mkd'}
Plug 'rhysd/vim-crystal', {'for': 'crystal'}
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'wting/rust.vim', { 'for': 'rust' }

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible 

" gui settings
if (&t_Co == 256 || has('gui_running'))
    if ($TERM_PROGRAM == 'iTerm.app')
        colorscheme gruvbox
        set background=dark
    else
        colorscheme heroku
    endif
endif

" FIX: PluginUpdate => git pull: git-sh-setup: No such file or directory in MacVim (OK in non-GUI version of Vim)
if has("gui_macvim")
    set shell=/bin/bash\ -l
endif

set guifont=Inconsolata:h16

set clipboard=unnamed  

set timeoutlen=300
set noerrorbells

syntax enable

let g:toggleTabs = 0

set nobackup
set nowb
set noswapfile

"set autochdir "自动设置目录为正在编辑的文件所在目录

set autoindent 
set smartindent  

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
" how the next match while entering a search
set incsearch

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set number
set numberwidth=4

set showtabline=0

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

inoremap jj <esc>
nnoremap <leader>8 :TagbarToggle<CR>
noremap <leader>3 <Esc>gg=G<CR>
inoremap <leader>3 <Esc>gg=G<CR>
noremap <F3> <Esc>gg=G<CR>
inoremap <F3> <Esc>gg=G<CR>

"屏蔽掉esc键和方向键!
inoremap <esc> <nop>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

vnoremap <D-/> :TComment<CR>
nnoremap <D-/> :TComment<CR>
inoremap <D-/> <esc>:TComment<CR>
vnoremap <leader>c :TComment<CR>
nnoremap <leader>c :TComment<CR>
inoremap <leader>c <esc>:TComment<CR>
nnoremap <leader>pj :%!python -m json.tool<CR>

nnoremap <silent> <Esc><Esc> :noh<CR>:call clearmatches()<CR>

iabbrev @@ caiguo37@gmail.com

"https://github.com/ggreer/the_silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

""Hide some files
let g:netrw_list_hide='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'

""disable markdown folding configuration.
let g:vim_markdown_folding_disabled=1

let g:ctrlspace_default_mapping_key="<C-t>"
let g:airline_exclude_preview = 1

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}

let g:rainbow_active = 1

" NERDTree
nnoremap <leader>a :Ag<space>
nnoremap <leader>ag :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>p :CtrlP<CR>

set autoread
