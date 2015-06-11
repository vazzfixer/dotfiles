#!/bin/sh

# HomebrewではなくHaskelのパッケージ管理cabal
# pandocを利用して、markdownをPDF/html化するための準備
brew install ghc cabal-install
brew install graphviz
brew install plantuml
brew cask install basictex

cabal update
cabal install cabal-install
cabal install pandoc

sudo tlmgr update --self
sudo tlmgr update --all
sudo tlmgr install collection-langjapanese collection-latexrecommended collection-fontsrecommended

# remove outdated versions
brew cleanup
