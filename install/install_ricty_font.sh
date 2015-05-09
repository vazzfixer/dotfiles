#!/bin/sh

brew install automake
brew install pkg-config
brew tap sanemat/font
brew install Caskroom/cask/xquartz
brew install --powerline --vim-powerline ricty

# installing ricty fonts
ricty_ver=`ls -1 /usr/local/Cellar/ricty/`;
if [ -d /usr/local/Cellar/ricty/${ricty_ver}/share/fonts ]; then
  echo "install ricty font, and clean font caches..."
  # rictyフォントをコピーして,フォントキャッシュをクリアする
  cp -f /usr/local/Cellar/ricty/${ricty_ver}/share/fonts/Ricty*.ttf ~/Library/Fonts/
  fc-cache -vf
  defaults -currentHost write -globalDomain AppleFontSmoothing -int 2
else
  echo "rictyのフォントが未インストール."
fi

# remove outdated versions
brew cleanup
