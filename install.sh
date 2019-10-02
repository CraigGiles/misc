#!/bin/bash

echo "simlink configuration files"
ln -s ~/Development/gilesc-misc/bashrc ~/.bash_profile
ln -s ~/Development/gilesc-misc/tmux.conf ~/.tmux.conf
ln -s ~/.vim/vimrc ~/.vimrc

echo "Installing homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing tools via homebrew"
brew install reattach-to-user-namespace
brew install ripgrep
brew install git

brew install fzf
/usr/local/opt/fzf/install
