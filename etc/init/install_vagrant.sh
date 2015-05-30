#!/bin/sh

brew cask install vagrant

# remove outdated versions
brew cleanup

# install plugins

vagrant plugin install sahara
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-vbox-snapshoa
vagrant plugin install dotenv
