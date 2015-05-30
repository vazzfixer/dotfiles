#!/bin/sh

brew install bash-completion

# remove outdated versions
brew cleanup

# -------------------------------------------------
# bash_completion
if [ -f $(brew --prefix)/etc/bash_completion -a ! -f $HOME/.bash_completion ]; then
  file=$(brew --prefix)/etc/bash_completion
  ln -s $file $HOME/.bash_completion
  echo "make symlink : .bash_completion"
fi
