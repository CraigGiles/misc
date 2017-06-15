if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export BROWSER=safari

function new-tmux-from-dir-name {
    dir_name=$(echo `basename $PWD` | tr '.' '-')
    tmux new-session -As $dir_name
}

# Tmux
alias tmux="TERM=screen-256color-bce tmux"
alias tnew="new-tmux-from-dir-name"

alias g='mvim --remote-silent'
alias gvim='gnvim'
alias ll='ls -lhg'
alias gs='git status'

export SBT_OPTS="-Xmx2G -Xss2M -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled"

# FZF settings to pipe through ag
# NOTE: To use you must use 'brew install the_silver_searcher'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PATH=/usr/local/bin:$PATH
export JAVA_HOME=$(/usr/libexec/java_home)
$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
