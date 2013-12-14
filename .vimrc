" Pathogen plugin manager
call pathogen#infect()

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Autoread when a file is changed from the outside
set autoread

" Always show current position
set ruler

" Show line numbers
set nu

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enables syntax highlighting
syntax enable
colorscheme desert
set background=dark

" Set UTF8 as the standard encoding
set encoding=utf8

" Turn off file backups since most stuff is in git
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab
set tabstop=4
set shiftwidth=4

" Be smart when using tabs
set smarttab

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

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" CtrlP Plugin Options
" Map the key to CMD-T
nmap <M-t> CtrlP

" Unless a starting directory is specified, set directory to the nearest .git 
let g:ctrlp_working_path_mode = 'ra'


