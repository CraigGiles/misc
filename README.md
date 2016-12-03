Simple place for me to put simple misc files such as vimrc

Clone repository into ~/Development/misc
  mkdir -p ~/Development
  HTTP: git clone https://github.com/CraigGiles/misc.git ~/Development/misc
  SSH: git clone git@github.com:CraigGiles/misc.git ~/Development/misc

Link various dot files to the provided dotfiles
  ln -s ~/Development/misc/bashrc ~/.bash_profile
  ln -s ~/Development/misc/tmux.conf ~/.tmux.conf

Link your sbt plugins for scala development
  mkdir -p ~/.sbt/0.13/plugins
  ln -s ~/Development/misc/sbt-plugins.sbt ~/.sbt/0.13/plugins/plugins.sbt
