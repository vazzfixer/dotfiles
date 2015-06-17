#!/bin/sh

brew_dir=/usr/local/bin
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
if [ ! -f $brew_dir/brew ]; then
  echo "install homebrew"
  sudo mkdir $brew_dir
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ -d /usr/local/Libraly ]; then
  cd /usr/local/Library && git stash && git clean -d -f
fi

# brew-fileを利用して各種brewをinstallするので前準備
brew install rcmdnk/file/brew-file
brew file set_repo -r kegamin/Brewfile
brew file install
