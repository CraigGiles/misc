#!/bin/bash

echo "simlink configuration files"
ln -s ~/Development/gilesc-misc/bashrc ~/.bash_profile
ln -s ~/Development/gilesc-misc/tmux.conf ~/.tmux.conf
ln -s ~/Development/gilesc-misc/gitignore ~/.gitignore
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/vimrc ~/.vimrc

echo "Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" 

echo "Installing tools via homebrew"
brew install tmux
brew install reattach-to-user-namespace
brew install ripgrep
brew install git
brew install the_silver_searcher

brew install fzf
/usr/local/opt/fzf/install

echo "Git configuration"
git config --global color.ui true
git config --global core.excludesfile '~/.gitignore'
git config --global alias.ls "log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate"
git config --global alias.ll "log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --numstat"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.unpushed "log --branches --not --remotes --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.branches-ordered "branch --sort=-committerdate --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
git config --global alias.branches "branch -a"

echo "Disable key PressAndHold"
defaults write -g ApplePressAndHoldEnabled -bool false

echo "Changing shell to use bash"
chsh -s /bin/bash

echo "Cloning emacs config into emacs.d"
git clone git@github.com:CraigGiles/emacs.d.git ~/.emacs.d
touch ~/.emacs.d/custom.el

echo "Cloning vim config into ~/.vim"
git clone git@github.com:CraigGiles/dotvim.git ~/.vim
