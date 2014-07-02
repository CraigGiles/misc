" ==================================================
" VIM Settings
" ==================================================
set nocompatible                " Disable vi-compatibility
set t_Co=256
set mouse=a
set linespace=5
set guifont=Monaco:h14          " Sets the font                   
set so=5                        " keep 15 lines above and below cursor when scrolling
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set number			" Show line numbers
set nobackup			" Don't use backup files
set noswapfile			" Don't use swap files

set tags=tags


" I don't want to pull up these folders/files when calling COMMAND-T
set wildignore+=*/vendor/**
set wildignore+=*/cli/**
set wildignore+=*/logs/**
set wildignore+=*/sql/**
set wildignore+=*/tools/**
set wildignore+=*.swp   
set wildignore+=*.bak  

" ==================================================
" Key Bindings
" ==================================================
" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
imap jj <ESC>

"easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Open splits
nmap vs :vsplit<CR>
nmap hs :split<CR>

" resize vertical splits
nmap <F1> :vertical resize +5<CR>
nmap <F2> :vertical resize -5<CR>

nmap <F9> :set spell<CR>
nmap <F10> :set nospell<CR>

" CMD-1 opens up the file list
map <leader>1 :NERDTreeToggle<CR>

" Find the current file in NERDTree file structure
nmap <leader>2 :NERDTreeFind<CR>

" CMD-7 opens up the tagbar
nmap <leader>7 :TagbarToggle<CR>

" Command T
nmap <C-p> :Find . -iname  

" ==================================================
" Functions
" ==================================================

" ==================================================
" Plugins
" ==================================================
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))

" let neobundle manage 
NeoBundleFetch 'Shougo/neobundle.vim'

" base line of configs
NeoBundle "tpope/vim-sensible"

" Tim Pope's git integration
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-eunuch'
" lets you surround text with things
NeoBundle "tpope/vim-surround"

" Comment code
NeoBundle "tpope/vim-commentary"

" Complimentary pairs
NeoBundle "tpope/vim-unimpaired"

" Delete all buffers except the current working buffer
NeoBundle "vim-scripts/BufOnly.vim"

" NerdTree file explorer
NeoBundle 'scrooloose/nerdtree'

" NerdTree Commentor
NeoBundle 'scrooloose/nerdcommenter'

" Tagbar for sidebar function organization
NeoBundle 'majutsushi/tagbar'

" PHP Complete
NeoBundle 'shawncplus/phpcomplete.vim'

" fuzzy finder
NeoBundle "wincent/command-t"

" Syntax Checking
NeoBundle 'scrooloose/syntastic'

" Themes
NeoBundle "jpo/vim-railscasts-theme"
NeoBundle "nanotech/jellybeans.vim"

call neobundle#end()
filetype plugin indent on

" Enables syntax highlighting
syntax enable
set background=dark
colorscheme jellybeans
