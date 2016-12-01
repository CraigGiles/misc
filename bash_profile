if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export BROWSER=safari

alias tmux="TERM=screen-256color-bce tmux"
set -g default-terminal "xterm-256color"
alias g='mvim --remote-silent'
alias ll='ls -la'
alias ls='ls -1'
alias gs='git status'

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=/usr/local/bin:$PATH
