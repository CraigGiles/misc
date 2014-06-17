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

" CTRL-P fuzzy finder
NeoBundle "kien/ctrlp.vim"

" Syntax Checking
NeoBundle 'scrooloose/syntastic'

" Solarized color scheme
NeoBundle "altercation/vim-colors-solarized"

" Railscast Theme
NeoBundle "jpo/vim-railscasts-theme"

call neobundle#end()
filetype plugin indent on

