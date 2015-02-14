" ==================================================
" Key Bindings
" ==================================================
" Easy opening of splits
nmap vs :vs<CR>
nmap sp :sp<CR>

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Escape to normal mode from insert mode with jj
imap jj<ESC>

" Increase vertical split size by 5
nmap + :vertical resize +5<CR>

" git related commands
nmap ga :Gblame<CR>
nmap gs :Gstatus<CR>
nmap gm :Gcommit<CR>


" File navigation and IDE like settings
map <leader>1 :NERDTreeToggle<CR>
nmap <leader>2 :NERDTreeFind<CR>
nmap <leader>7 :TagbarToggle<CR>

" Jump to definition, <C-t> jumps back
nmap <C-b> <C-]>zz

" set or remove spell check
nnoremap \\ :set spell!<CR>

" hide searh results
nnoremap \] /akosdjfhaosdhjkif<CR>

" ==================================================
" Plugins
" ==================================================
execute pathogen#infect()

let g:project_use_nerdtree = 1
set background=dark
colorscheme railscasts

" ==================================================
" Settings
" ==================================================
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set tags=.git/tags

set nobackup                    " don't use backup files
set nowb                        " don't use backup files
set noswapfile                  " don't use swap files

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
