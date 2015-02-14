#!/bin/sh
brew install automake
git clone https://github.com/FreedomBen/screen-for-OSX.git && cd screen-for-OSX && ./install.sh
echo 'alias screen="/usr/local/bin/screen"' >> ~/.bash_profile
cd ..
rm -rf screen-for-OSX
