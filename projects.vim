set rtp+=~/.vim/bundle/vim-project/
let g:project_enable_welcome = 1 
let g:project_use_nerdtree = 1

call project#rc("/home/rsyncadmin/.vim/")
Project 'config', 'config'

call project#rc("/var/www/git-repos/")
Project 'pm', 'PM'

" default starting path (the home directory)
call project#rc()

