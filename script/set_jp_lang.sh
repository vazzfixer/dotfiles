#!/bin/sh

source $HOME/dotfiles/etc/lib/vital.sh

e_header "change locale to ja_JP.UTF-8"

sudo yum -y install ibus-kkc vlgothic-*
sudo localectl set-locale LANG=ja_JP.UTF-8
