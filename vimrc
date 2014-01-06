" vim is not compatible with vi
set nocompatible
set mouse=a

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

" ========================================
" Vundle Bundles
" ========================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" PHP syntax
Bundle 'phpvim'

" Shows structure (bound to CMD-7)
Bundle 'taglist.vim'

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

" Refactorings for VIM, key's below 
" \em :call ExtractMethod()<CR>
" \ev :call ExtractVariable()<CR>
" \ep :call ExtractClassProperty()<CR>
" \ei :call ExtractInterface()<CR>
" \rlv :call RenameLocalVariable()<CR>
" \rcv :call RenameClassVariable()<CR>
" \iaf :call ImplementAbstractFunctions()<CR>
Bundle "beberlei/vim-php-refactor"
Bundle "terryma/vim-multiple-cursors"

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
call project#rc("/Users/gilesc/Development/redhotmayo/")
Project 'website', 'Red Hot Mayo'

" default starting path (the home directory)
call project#rc()

" ========================================
" Laravel Bindings 
" ========================================
abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
abbrev gmig !php artisan generate:migration
abbrev mreset !php artisian migration:reset<cr>
abbrev mrollback !php artisian migration:rollback<cr>
abbrev mmigrate !php artisian migrat<cr>

" Laravel framework commons
nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>


" ========================================
" key bindings
" ========================================
let mapleader = ","
let g:mapleader = ","

" Fast saves
nmap <leader>w :w!<CR>

" CMD 7 opens up the structure list
map <D-7> :TlistToggle<CR>

" CMD 1 opens up the file list
map <D-1> :NERDTreeToggle<CR>

" Down is really the next line
nnoremap j gj
nnoremap k gk
 
"Easy escaping to normal model
imap jj <esc>

" Quickly edit/reload the vimrc file (,ev and ,sv)
nmap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Disables the arrow keys (MUAHAHAHA)
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr> 

"Resize vsplit
nmap <leader>v :vertical resize +5<cr>
nmap <leader>b :vertical resize -5<cr>

"Load the current buffer in Chrome
nmap ,ch :!open -a Google\ Chrome<cr>

" Create split below
nmap :sp :rightbelow sp<cr>
 
" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

highlight Search cterm=underline

" Run PHPUnit tests
map <Leader>t :!phpunit %<cr>

" Remove search results
command! H let @/=""

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e


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

" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
map <C-r> :CtrlPBufTag<cr>
set completeopt-=preview

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**

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
let g:easytags_dynamic_files=1
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
set smartindent   " Smart indenting
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

" Show matching brackets when text indicator is over them
set t_vb=
set tm=500

" Turn off file backups since most stuff is in git
set nobackup
set nowb
set noswapfile

" Enable filetype plugins
filetype plugin on
filetype indent on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Set CMD T to open up a new tab
nmap <D-t> <Esc>:tabnew<CR>

" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)


" ===========================
" CtrlP Plugin Options
" ===========================
" Set directory to the nearest .git 
let g:ctrlp_working_path_mode = 'ra'
