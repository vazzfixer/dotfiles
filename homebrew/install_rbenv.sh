#!/bin/sh

# ruby
brew install rbenv
brew install ruby-build
brew install rbenv-gemset
brew install rbenv-gem-rehash

if [ -d $HOME/.rbenv/plugins/ruby-build ]; then
  rm -rf ~/.rbenv/plugins/ruby-build
fi
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# heroku
brew install heroku-toolbelt
