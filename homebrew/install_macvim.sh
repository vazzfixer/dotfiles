#!/bin/sh

# macvim
brew tap supermomonga/homebrew-splhack
brew install cscope
brew install lua
brew install --HEAD cmigemo-mk
brew install --HEAD ctags-objc-ja
brew install gettext-mk
brew link ctags-objc-ja
brew install macvim-kaoriya --HEAD --with-lua　--with-cscope
brew linkapps

# remove outdated versions
brew cleanup
