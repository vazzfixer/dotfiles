#!/bin/sh

# mactex
brew install ghostscript
brew install imagemagick
brew cask install mactex

# remove outdated versions
brew cleanup
