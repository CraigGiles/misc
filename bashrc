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
alias gs='git status'
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -L ~/.emacs.d/modules/releases/ "$@" &>/dev/null &'
alias em'/Applications/Emacs.app/Contents/MacOS/Emacs -L ~/.emacs.d/modules/releases/' 

alias fsearch='Ag . | FZF --exact'

# FZ settings to pipe through ag
# NOTE: To use you must use 'brew install the_silver_searcher'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PATH="/usr/local:$PATH"
export PATH="/Users/gilesc/go/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

MVIM=/Applications/MacVim.app/Contents/bin
if test -f "$MVIM/mvim"; then
    export PATH="$MVIM:$PATH"
fi

export JAVA_HOME=$(/usr/libexec/java_home)
