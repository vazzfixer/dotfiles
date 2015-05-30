#!/bin/sh

brew tap caskroom/versions
brew cask install java7

# remove outdated versions
brew cleanup
