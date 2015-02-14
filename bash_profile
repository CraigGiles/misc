if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ga='git add'
alias gm='git commit -m '
alias gs='git status'
alias ll='ls -la'

export PATH=/usr/local/bin:$PATH
