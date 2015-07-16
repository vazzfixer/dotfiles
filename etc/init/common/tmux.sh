#!/bin/sh

. "$DOTPATH"/etc/lib/vital.sh

# tmuxのヘッダーに表示するようのツール群を配置
if [ ! -d /usr/local/bin ];then
  e_newline
  e_header "creating /usr/local/bin folder"
  mkdir /usr/local/bin
  e_done "finished."
fi

e_header "coping dotfiles/bin to /usr/local/bin"
cp $HOME/dotfiles/bin/battery /usr/local/bin
cp $HOME/dotfiles/bin/used_mem /usr/local/bin
e_done "copy dotfiles/bin"
