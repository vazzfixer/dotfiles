#!/bin/sh
# homebrew update & upgrade formula
brew update
brew upgrade --all

brew tap homebrew/binary
brew tap phinze/homebrew-cask

# install packages
brew install ack
brew install ag
brew install autoconf
brew install automake
brew install git
brew install gist
brew install hub
brew install gnu-sed
brew install openssl
brew install w3m
brew install wget
brew install tmux
brew install wemux
brew install bash-completion
brew install fontforge
brew install reattach-to-user-namespace
brew install byobu
brew install readline
brew install node
brew install z
brew install htop
brew install unrar
brew install peco

# GNU tools
brew install xz
brew install binutils
brew install coreutils
brew install findutils

# llvm
brew install llvm --with-clang --HEAD
brew install clang-format

# 以下mac用アプリを入れる
brew install brew-cask
brew cask install google-chrome
brew cask install bettertouchtool
brew cask install sourcetree
brew cask install dash
brew cask install alfred
brew cask install kobito
brew cask install skype
brew cask install dropbox
brew cask install iterm2
brew cask install virtualbox
brew cask install github
brew cask install firefox
brew cask install insomniax
brew cask install atom
brew cask install sequel-pro /* mysql gui client */

# remove outdated versions
brew cleanup
