if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export BROWSER=safari

alias g='mvim --remote-silent'
alias ll='ls -la'
alias gs='git status'

export PATH=/usr/local/bin:$PATH
$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
