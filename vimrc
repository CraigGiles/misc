" ==================================================
" VIM Settings
" ==================================================
set nocompatible                " Disable vi-compatibility
set t_Co=256
set mouse=a
set linespace=5
set wildmenu                    " Tab complete for menu items
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14          " Sets the font                   
set so=5                        " keep 15 lines above and below cursor when scrolling
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set number			            " Show line numbers
set nobackup                    " don't use backup files
set nowb                        " don't use backup files
set noswapfile                  " don't use swap files
set clipboard=unnamed           " Copy to clipboard when using (y,d,x,etc.)
set history=700                 " Sets how many lines of history VIM has to remember
set showcmd                     " show command in bottom bar
set cursorline                  " highlight current line
set showmatch                   " highlight matching [{()}]
set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches
set autoread                    " Autoread when a file is changed from the outside
set ruler                       " Always show current position
set encoding=utf8               " Show matching brackets when text indicator is over them
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set undolevels=1000             " use many muchos levels of undo
set visualbell                  " don't beep
set noerrorbells                " don't beep
set gdefault                    " /%s/foo/bar by default replaces all foo with bar
set colorcolumn=120             " Vertical line at 120 column

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set tags=tags

" I don't want to pull up these folders/files when calling COMMAND-T
set wildignore+=*/vendor/**
set wildignore+=*/cli/**
set wildignore+=*/logs/**
set wildignore+=*/sql/**
set wildignore+=*/tools/**
set wildignore+=*/docroot/res/out/**
set wildignore+=*.swp   
set wildignore+=*.bak  

" Powerline (Fancy thingy at bottom stuff)
" let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" ==================================================
" Key Bindings
" ==================================================
" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
imap jj <ESC>

"easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open splits
nmap vs :vsplit<CR>
nmap sp :split<CR>

" resize vertical splits
nmap <C-g> :vertical resize +5<CR>

" Run git blame on the current file
nmap gb :Gblame<CR>
nmap <C-g>a :Gblame<CR>

nmap <F9> :set spell<CR>
nmap <F10> :set nospell<CR>

map <leader>1 :NERDTreeToggle<CR>
nmap <leader>2 :NERDTreeFind<CR>
nmap <leader>7 :TagbarToggle<CR>
nnoremap <C-r> :TagbarToggle<CR>

" Command T
nmap <C-p> :CommandT<CR>

" Find the current word throughout the entire application using ACK
nmap <C-f> ""yiw:!ack <C-r>"<CR>

" Jump to definition
nmap <C-b> <C-]>zz

" set or remove spell check
nnoremap \\ :set spell!<CR>

" hide searh results
nnoremap \] /akosdjfhaosdhjkif<CR>

" Set UNDO/REDO to be what i'm used to (CTRL-z, CTRL-Z)
nnoremap <C-z> :undo<CR>
nnoremap <C-Z> :redo<CR>

" Leader-T will run the current unit test
map <leader>t :!clear && phpunit %<CR>

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

" Tim Pope's plugins
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-eunuch'
NeoBundle "tpope/vim-commentary"
NeoBundle "tpope/vim-unimpaired"

" Project based organization
NeoBundle "amiorin/vim-project"

" Delete all buffers except the current working buffer
NeoBundle "vim-scripts/BufOnly.vim"

" NerdTree file explorer
NeoBundle 'scrooloose/nerdtree'

" Tagbar for sidebar function organization
NeoBundle 'majutsushi/tagbar'

" PHP Support
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'vim-scripts/composer.vim'

" Scala and play support
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'gre/play2vim'

" fuzzy finder
NeoBundle "wincent/command-t"

" Syntax Checking
NeoBundle 'scrooloose/syntastic'

" Snippet Manager
NeoBundle "msanders/snipmate.vim"

" Powerline
NeoBundle "Lokaltog/vim-powerline"

" Themes
NeoBundle "jpo/vim-railscasts-theme"
NeoBundle "nanotech/jellybeans.vim"

call neobundle#end()
filetype plugin indent on

let g:project_use_nerdtree = 1
set rtp+=~/.vim/bundle/vim-project/

call project#rc("/var/www/git-repos/")

File '~/.vimrc', 'vimrc'
Project  'pm'


" Enables syntax highlighting
syntax enable
set background=dark
colorscheme railscasts
