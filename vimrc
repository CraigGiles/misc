" ==================================================
" VIM Settings
" ==================================================
set nocompatible   " Disable vi-compatibility
set t_Co=256
set mouse=a

set linespace=15

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
nmap sp :split<CR>

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

" Prepare a new PHP class
function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')

    if strlen(namespace)
        exec 'normal i<?php namespace ' . namespace . ';
    else
        exec 'normal i<?php
    endif

    " Open class
    exec 'normal iclass ' . name . ' {^M}^[O^['
    
    exec 'normal i^M    public function __construct()^M{^M ^M}^['
endfunction
nmap nc :call Class()<cr>


" Add a new dependency to a PHP class
function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ')

    let segments = split(namespace, '\')
    let typehint = segments[-1]

    exec 'normal gg/construct^M:H^Mf)i, ' . typehint . ' $' . dependency . '^[/}^>O$this->^[a' . dependency . ' = $' . dependency . ';^[?{^MkOprotected $' . dependency . ';^M^[?{^MOuse ' . namespace . ';^M^['

    " Remove opening comma if there is only one dependency
    exec 'normal :%s/(, /(/g
'
endfunction
nmap nd :call AddDependency()<cr>

"======================================== 
" Plugins
"======================================== 
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))

" let neobundle manage 
NeoBundleFetch 'Shougo/neobundle.vim'

" Tim Pope's git integration
NeoBundle 'tpope/vim-fugitive'

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
NeoBundle "wincent/command-t"

" Syntax Checking
NeoBundle 'scrooloose/syntastic'

" Solarized color scheme
NeoBundle "altercation/vim-colors-solarized"

" Railscast Theme
NeoBundle "jpo/vim-railscasts-theme"

call neobundle#end()
filetype plugin indent on

"======================================== 
" Railscast Theme
"======================================== 
" Enables syntax highlighting
syntax enable
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
