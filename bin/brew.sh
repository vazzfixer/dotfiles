#!/bin/sh
# homebrew update & upgrade formula
brew update
brew upgrade --all

# install packages

brew tap homebrew/binary
brew tap phinze/homebrew-cask
brew install ack
brew install ag
brew install autoconf
brew install automake
brew install git
brew install gist
brew install hub
brew install gnu-sed
brew install heroku-toolbelt
brew install openssl
brew install w3m
brew install wget
brew install tmux
brew install wemux
brew install bash-completion
brew install zsh --disable-etcdir
brew install fontforge
brew install reattach-to-user-namespace
brew install byobu
brew install readline
brew install node
brew install z
brew install htop
brew install unrar
brew install pkg-config

# HomebrewではなくHaskelのパッケージ管理cabal
# pandocを利用して、markdownをPDF/html化するための準備
brew install ghc cabal-install
cabal update
cabal install cabal-install
cabal install pandoc
brew cask install basictex
sudo tlmgr update --self
sudo tlmgr update --all
sudo tlmgr install collection-langjapanese collection-latexrecommended collection-fontsrecommended

# vimの最新版(clipboard対応)
brew install vim
if [ -f `ls -1 /usr/local/Cellar/vim/*/bin/vim` ]; then
  echo "installing latest vim ..."
  if [ ! -f /usr/bin/vim_old ]; then
    sudo mv /usr/bin/vim /usr/bin/vim_old
  fi
  sudo ln -s `ls -1 /usr/local/Cellar/vim/*/bin/vim` /usr/bin
fi

# GNU tools
brew install xz
brew install binutils
brew install coreutils
brew install findutils

# ruby
brew install rbenv
brew install ruby-build
brew install heroku-toolbelt

# platform
brew install nginx
brew install mongodb

# macvimを入れる
brew tap supermomonga/homebrew-splhack
brew install cscope
brew install lua
brew install --HEAD cmigemo-mk
brew install --HEAD ctags-objc-ja
brew install gettext-mk
brew link ctags-objc-ja
brew install macvim-kaoriya --HEAD --with-lua　--with-cscope
brew linkapps

# llvm
brew install llvm --with-clang --HEAD
brew install clang-format
 
# powerline用フォントを作成する
brew tap sanemat/font
brew install Caskroom/cask/xquartz
brew install --powerline --vim-powerline ricty

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
brew cask install vagrant
brew cask install virtualbox
brew cask install github
brew cask install firefox
brew cask install insomniax
brew cask install atom

# remove outdated versions
brew cleanup

# installing ricty fonts
if [ -d /usr/local/Celler/ricty/3.2.3/share/fonts ]; then
  # rictyフォントをコピーして,フォントキャッシュをクリアする
  cp -f /usr/local/Cellar/ricty/3.2.3/share/fonts/Ricty*.ttf ~/Library/Fonts/ && fc-cache -vf
  defaults -currentHost write -globalDomain AppleFontSmoothing -int 2
else
    echo "rictyのフォントが未インストール."
fi
