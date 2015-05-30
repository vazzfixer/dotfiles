#!/bin/bash

# -------------------------------------------------
# setup info
#   - homebrew ( see Brewfile for detail )
#   - locate

# -------------------------------------------------
# install homebrew
brew_dir=/usr/local/bin
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
if [ ! -f $brew_dir/brew ]; then
  echo "install brew"
  sudo mkdir $brew_dir
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
if [ -d /usr/local/Libraly ]; then
  cd /usr/local/Library && git stash && git clean -d -f
fi

$HOME/dotfiles/etc/init/install_all.sh

# -------------------------------------------------
# mac locate command

diff=`diff /System/Library/LaunchDaemons/com.apple.locate.plist $HOME/dotfiles/macos/launchctl/com.apple.locate.plist`
if [ $? ne 0 ];then
  echo "Update locate.plist..."
  sudo cp -f $HOME/dotfiles/macos/launchctl/com.apple.locate.plist /System/Library/LaunchDaemons/com.apple.locate.plist
  sudo launchctl unload /System/Library/LaunchDaemons/com.apple.locate.plist
  sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
fi
