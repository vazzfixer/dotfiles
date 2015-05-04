#!/bin/sh

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

# remove outdated versions
brew cleanup
