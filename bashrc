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
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs "$@"'

alias fsearch='Ag . | FZF --exact'

export SBT_OPTS="-Xmx8G -Xss8M -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled"
export GOPATH="/Users/gilesc/Development/golang"
export PATH=$PATH:$GOPATH/bin

# FZF settings to pipe through ag
# NOTE: To use you must use 'brew install the_silver_searcher'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PATH="/usr/local:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)
$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export PATH="/usr/local/sbin:$PATH"
