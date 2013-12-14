" Pathogen plugin manager
call pathogen#infect()

" vim is not compatible with vi
set nocompatible

" ========================================
" Leader key bindings
" ========================================
let mapleader=","

nmap <leader>w <C-w>v<C-w>l

" Quickly edit/reload the vimrc file (,ev and ,sv)
nmap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Map Control-P plugin to cmd-p
nmap <D-p> :CtrlP<CR>

" ========================================
" CTags / Code Completion / Code Navigation
" ========================================
" Ctrl-Space    : Open Code Completion Suggestions
" Cmd-b         : goto definition
" Cmd-shift-b   : goto definition in new vsplit
" Cmd-[         : go back to previous tag
" ========================================
imap <C-Space> <C-x><C-o>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <D-B> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <D-b> <C-]>
map <D-[> <C-t>

" Look for the tags file in current or root until you find it
set tags=./tags;/

" Auto generate tags files 
:let g:easytags_dynamic_files=1
" Fast way to exit
nmap <leader>q :q<CR>


" ========================================
" PHP Unit settings
" ========================================


" ========================================
" VIM settings
" ========================================
set history=700   " Sets how many lines of history VIM has to remember

set autoread      " Autoread when a file is changed from the outside
set ruler         " Always show current position
set nu            " Show line numbers
set showmatch     " Show matching brackets when text indicator is over them
set encoding=utf8 " Show matching brackets when text indicator is over them
set smarttab      " Be smart when using tabs
set splitright    " Remove the Windows ^M - when the encodings gets messed up
set nowrap        " don't wrap lines
set expandtab     " use spaces instead of tabs
set tabstop=4     " a tab is four spaces
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
set hlsearch      " highlight search terms
set incsearch     " show search matches as you typej
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set modelines=0          " disable modelines in files
set gdefault             " /%s/foo/bar by default replaces all foo with bar
set incsearch            
set hlsearch

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Clear's search results
nnoremap <leader><space> :noh<cr>

" Disables the arrow keys (MUAHAHAHA)
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr> 

" Show matching brackets when text indicator is over them
set t_vb=
set tm=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Enables syntax highlighting
syntax enable
colorscheme desert
set background=dark

" Turn off file backups since most stuff is in git
set nobackup
set nowb
set noswapfile

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Set CMD T to open up a new tab
nmap <M-t> <Esc>:tabnew<CR>

" ===========================
" CtrlP Plugin Options
" ===========================
" Set directory to the nearest .git 
let g:ctrlp_working_path_mode = 'ra'

" ===========================
" PHP Specific Configurations
" ===========================
