#!/bin/sh

# anyenvはgit submoduleで入ってる

anyenv update
anyenv install rbenv
anyenv install pyenv
anyenv install plenv

# anyenv plugins
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

# rbenv utilities
gem install rbenv-rehash

# plenv utilities
plenv install-cpanm
