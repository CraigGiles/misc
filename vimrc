" ==================================================
" VIM Settings
" ==================================================
set nocompatible                " Disable vi-compatibility
set t_Co=256
set mouse=a

set linespace=5

set guifont=Monaco:h14          " Sets the font                   

set laststatus=2                " always show statusbar
set showmode                    " always show what mode we're currently editing in
set tabstop=4                   " a tab is four spaces
set smarttab
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set number                      " always show line numbers
set visualbell                  " don't beep
set noerrorbells                " don't beep
set autowrite                   " save on buffer switch
set showcmd                     " show partial command in status line
set noswapfile                  " disable swap files
set nobackup                    " disable backup files
set clipboard=unnamed           " Copy to clipboard when using (y,d,x,etc.)
set history=700                 " Sets how many lines of history VIM has to remember
set cursorline                  " highlight current line
set hlsearch                    " highlight matches
set autoread                    " Autoread when a file is changed from the outside
set ruler                       " Always show current position
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set undolevels=1000             " use many muchos levels of undo
set copyindent                  " copy the previous indentation on autoindenting
set gdefault                    " /%s/foo/bar by default replaces all foo with bar
set so=5                        " keep 15 lines above and below cursor when scrolling
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set spell                       " Spellcheck!
set tags=tags

" I don't want to pull up these folders/files when calling COMMAND-T
set wildignore+=*/vendor/**
set wildignore+=*/cli/**
set wildignore+=*/logs/**
set wildignore+=*/sql/**
set wildignore+=*/tools/**
set wildignore+=*.swp   
set wildignore+=*.bak  

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e
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

" CMD-1 opens up the file list
map <leader>1 :NERDTreeToggle<CR>

" Find the current file in NERDTree file structure
nmap <leader>2 :NERDTreeFind<CR>

" CMD-7 opens up the tagbar
nmap <leader>7 :TagbarToggle<CR>

" Command T
nmap <C-p> :CommandT<CR>

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

" Project based browsing
NeoBundle 'amiorin/vim-project'

" PHP Complete
NeoBundle 'shawncplus/phpcomplete.vim'

" fuzzy finder
" NeoBundle "wincent/command-t"
NeoBundle "kien/ctrlp.vim"

" Syntax Checking
NeoBundle 'scrooloose/syntastic'

" Railscast Theme
NeoBundle "jpo/vim-railscasts-theme"

call neobundle#end()
filetype plugin indent on

" Enables syntax highlighting
syntax enable
set background=dark
colorscheme railscasts

