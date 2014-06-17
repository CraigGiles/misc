" CTRL-/ will comment out the beginning of a line with 
" // then move the cursor to next line in insert mode
imap <C-i> <ESC>0i//<ESC>ji
nmap <C-i> 0i//<ESC>j

"Easy escaping to normal model
imap jj <esc>

" resize vertical splits
nmap <F1> :vertical resize +5<CR>
nmap <F2> :vertical resize -5<CR>

" Quickly edit/reload the vimrc file (,ev and ,sv)
nmap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" CMD-1 opens up the file list
map <leader>1 :NERDTreeToggle<CR>

" LEADER-n changes the current directory of nerdtree to PM
nnoremap <leader>0 :NERDTree /var/www/git-repos/pm/<CR>

" Find the current file in NERDTree file structure
nmap <leader>2 :NERDTreeFind<CR>

" CMD-7 opens up the tagbar
nmap <leader>7 :TagbarToggle<CR>

nmap <leader>n :bp<CR>
nmap <leader>p :bn<CR>

" Quick key for editing snippets
nmap <leader>es :vsplit ~/.vim/bundle/vim-snippets/snippets/php.snippets<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Open splits
nmap vs :vsplit<cr>
nmap hs :split<cr>

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
