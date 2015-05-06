#!bin/sh

brew tap homebrew/binary
brew install docker boot2docker

# remove outdated versions
brew cleanup

# add to launchagents
ln -sfv /usr/local/opt/boot2docker/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.boot2docker.plist

boot2docker init
boot2docker start
