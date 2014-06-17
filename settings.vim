" vim is not compatible with vi
set nocompatible
set mouse=a

set clipboard=unnamed   " Copy to clipboard when using (y,d,x,etc.)
set history=700         " Sets how many lines of history VIM has to remember
set nocompatible        " default to vim
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set autoread            " Autoread when a file is changed from the outside
set ruler               " Always show current position
set encoding=utf8       " Show matching brackets when text indicator is over them
set nowrap              " don't wrap lines
set autoindent          " always set autoindenting on
set copyindent          " copy the previous indentation on autoindenting
set shiftwidth=4        " number of spaces to use for autoindenting
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,
set undolevels=1000     " use many muchos levels of undo
set title               " change the terminal's title
set visualbell          " don't beep
set noerrorbells        " don't beep
set gdefault            " /%s/foo/bar by default replaces all foo with bar
set wildignore+=*.swp   " Ignore vim's swp files
set wildignore+=*.bak   " Ignore vim's backup files

set nobackup            " don't use backup files
set nowb                " don't use backup files
set noswapfile          " don't use swap files

set so=5               " keep 15 lines above and below cursor when scrolling
" Show matching brackets when text indicator is over them
set t_vb=
set tm=500

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e
