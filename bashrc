if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export TERM=xterm-256color
export BROWSER=safari

function new-tmux-from-dir-name {
    dir_name=$(echo `basename $PWD` | tr '.' '-')
    tmux new-session -As $dir_name
}

# Tmux
alias tmux="TERM=screen-256color-bce tmux"
alias tnew="new-tmux-from-dir-name"

# alias vim='nvim'
alias ll='ls -lahg'
alias fsearch='Ag . | FZF --exact'

export PATH="/usr/local:$PATH"
export PATH="/usr/local/sbin:$PATH"

export GOPATH="$(go env GOPATH)"
export PATH="${PATH}:${GOPATH}/bin"

alias ctags="`brew --prefix`/bin/ctags"
