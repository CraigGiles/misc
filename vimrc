" vim is not compatible with vi
set nocompatible
set mouse=a

" ========================================
" key bindings
" ========================================
let mapleader = ","
let g:mapleader = ","

"Easy escaping to normal model
imap jj <esc>

" Quickly edit/reload the vimrc file (,ev and ,sv)
nmap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" CMD 1 opens up the file list
map <leader>1 :NERDTreeToggle<CR>

nmap <leader>7 :TagbarToggle<CR>

" ========================================
" VIM settings
" ========================================
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

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e

" Omni complete
set omnifunc=syntaxcomplete#Complete

" ========================================
" Vundle Bundles
" ========================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'majutsushi/tagbar'

" Fuzzy Finder
Bundle 'kien/ctrlp.vim'              

" Snipmate dependancies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

" Left column file browser 
Bundle "scrooloose/nerdtree"

" Project based vim
Bundle "amiorin/vim-project"

" Powerline : https://powerline.readthedocs.org/en/latest/installation/osx.html
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Solarized color scheme
Bundle "altercation/vim-colors-solarized"

" Railscast Theme
Bundle "jpo/vim-railscasts-theme"

" ========================================
" VIM Projects
" ========================================
set rtp+=~/.vim/bundle/vim-project/
let g:project_enable_welcome = 1 
let g:project_use_nerdtree = 1

" custom starting path
call project#rc("/Users/cgiles/Development/nfs/git-repos/")
Project 'dsl', 'DSL'
Project 'dsl-idl', 'dsl-idl'
Project 'pm', 'pm'

" default starting path (the home directory)
call project#rc()


" ========================================
" Window Navigation
" ========================================
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" ========================================
" Movement bindings
" ========================================
" Disables the arrow keys (MUAHAHAHA)
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nnoremap j gj           " move vertically by visual line
nnoremap k gk           " move vertically by visual line

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <C-j> <M-j>
  nmap <C-k> <M-k>
  vmap <C-j> <M-j>
  vmap <C-k> <M-k>
endif

" ========================================
" CtrlP Plugin Options
" ========================================
" Set directory to the nearest .git 
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|\.(o|swp|pyc|egg)$'

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**
set wildignore+=*.class,.git,.hg,.svn

" Familiar commands for file/symbol browsing
map <c-p> :CtrlP<cr>

" ========================================
" Basic Vim Settings
" ========================================
" Show matching brackets when text indicator is over them
set t_vb=
set tm=500

" Look for the tags file in current or root until you find it
set tags=./tags
let g:easytags_dynamic_files=1


" ========================================
" Powerline Settings
" ========================================
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
set encoding=utf-8
let g:Powerline_symbols = 'fancy'
let g:Powerline_mode_V="V·LINE"
let g:Powerline_mode_cv="V·BLOCK"
let g:Powerline_mode_S="S·LINE"
let g:Powerline_mode_cs="S·BLOCK"

" ========================================
" Color Scheme Settings 
" ========================================
" Enables syntax highlighting
syntax enable
" set background=dark
" colorscheme railscasts

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "railscasts"

" Colors
" Brown        #BC9357
" Dark Blue    #6D9CBD
" Dark Green   #509E50
" Dark Orange  #CC7733
" Light Blue   #CFCFFF
" Light Green  #A5C160
" Tan          #FFC66D
" Red          #DA4938 

hi Normal     guifg=#E6E1DC guibg=#232323
hi Cursor     guibg=#FFFFFF
hi CursorLine guibg=#333435
hi LineNr     guifg=#666666
hi Visual     guibg=#5A647E
hi Search     guifg=NONE    guibg=#131313  gui=NONE
hi Folded     guifg=#F6F3E8 guibg=#444444  gui=NONE
hi Directory  guifg=#A5C160 gui=NONE
hi Error      guifg=#FFFFFF guibg=#990000
hi MatchParen guifg=NONE    guibg=#131313
hi Title      guifg=#E6E1DC

hi Comment    guifg=#BC9357 guibg=NONE     gui=italic
hi! link Todo Comment

hi String     guifg=#A5C160
hi! link Number String
hi! link rubyStringDelimiter String

" nil, self, symbols
hi Constant guifg=#6D9CBD

" def, end, include, load, require, alias, super, yield, lambda, proc
hi Define guifg=#CC7733 gui=NONE
hi! link Include Define
hi! link Keyword Define
hi! link Macro Define

" #{foo}, <%= bar %>
hi Delimiter guifg=#509E50
" hi erubyDelimiter guifg=NONE

" function name (after def)
hi Function guifg=#FFC66D gui=NONE

"@var, @@var, $var
hi Identifier guifg=#CFCFFF gui=NONE

" #if, #else, #endif

" case, begin, do, for, if, unless, while, until, else
hi Statement guifg=#CC7733 gui=NONE
hi! link PreProc Statement
hi! link PreCondit Statement

" SomeClassName
hi Type guifg=NONE gui=NONE

" has_many, respond_to, params
hi railsMethod guifg=#DA4938 gui=NONE

hi DiffAdd guifg=#E6E1DC guibg=#144212
hi DiffDelete guifg=#E6E1DC guibg=#660000

hi xmlTag guifg=#E8BF6A
hi! link xmlTagName  xmlTag
hi! link xmlEndTag   xmlTag
hi! link xmlArg      xmlTag
hi! link htmlTag     xmlTag
hi! link htmlTagName xmlTagName
hi! link htmlEndTag  xmlEndTag
hi! link htmlArg     xmlArg

" Popup Menu
" ----------
" normal item in popup
hi Pmenu guifg=#F6F3E8 guibg=#444444 gui=NONE
" selected item in popup
hi PmenuSel guifg=#000000 guibg=#A5C160 gui=NONE
" scrollbar in popup
hi PMenuSbar guibg=#5A647E gui=NONE
" thumb of the scrollbar in the popup
hi PMenuThumb guibg=#AAAAAA gui=NONE

