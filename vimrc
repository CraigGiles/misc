" ==================================================
" VIM Settings
" ==================================================
set nocompatible                " Must be first line

set background=dark         " Assume a dark background
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting

set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set autoread                " Autoread when a file is changed from the outside
set visualbell              " don't beep
set noerrorbells            " don't beep
set gdefault                " /%s/foo/bar by default replaces all foo with bar
set wildignore+=*.swp       " Ignore vim's swp files
set wildignore+=*.bak       " Ignore vim's backup files
set nobackup                " don't use backup files
set nowb                    " don't use backup files
set noswapfile              " don't use swap files
set noundofile              " don't use undo files
set noautochdir             " don't automatically change directories
set so=5                    " keep 15 lines above and below cursor when scrolling

scriptencoding utf-8

set autowrite                       " Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set spell                       " Spell checking on

" ==================================================
" UI Settings
" ==================================================
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

set cursorline                  " Highlight current line

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
                                " Selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolloff=5                 " Minimum lines to keep above and below cursor
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" ==================================================
" Formatting
" ==================================================
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

" ==================================================
" Key Bindings / Shortcuts
" ==================================================
"Easy escaping to normal model
imap jj <esc>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" resize vertical splits
nmap <F2> :vertical resize +5<CR>
nmap <F3> :vertical resize -5<CR>

" CTRL-b will jump into a function
nmap <C-b> <C-]>

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

nmap <leader>] :nohlsearch<CR>

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Open splits
nmap vs :vsplit<cr>
nmap hs :split<cr>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" ==================================================
" Plugins
" ==================================================
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))

" let neobundle manage
NeoBundleFetch 'Shougo/neobundle.vim'

" Tim Pope's git integration
NeoBundle 'tpope/vim-fugitive'

" NerdTree file explorer
NeoBundle 'scrooloose/nerdtree'

" fuzzy finder
NeoBundle "wincent/command-t"

" NerdTree Commentor
NeoBundle 'scrooloose/nerdcommenter'

" Tagbar for sidebar function organization
NeoBundle 'majutsushi/tagbar'

" Project based browsing
NeoBundle 'amiorin/vim-project'

" PHP Complete
NeoBundle 'shawncplus/phpcomplete.vim'

" Syntax Checking
NeoBundle 'scrooloose/syntastic'

" Solarized color scheme
NeoBundle "altercation/vim-colors-solarized"

" Railscast Theme
NeoBundle "jpo/vim-railscasts-theme"

call neobundle#end()
filetype plugin indent on

" ==================================================
" Plugins Settings
" ==================================================
"NERDTree
map <leader>1 :NERDTreeToggle<CR>
map <leader>2 :NERDTreeFind<CR>
map <C-e> <plug>NERDTreeTabsToggle<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.idea', '\.DS_Store']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" Tagbar
nnoremap <silent> <leader>7 :TagbarToggle<CR>

" Command-T fuzzy finder
nmap <C-p> :CommandT<CR>

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>



" ==================================================
" Theme
" ==================================================
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

