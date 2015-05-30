#!/bin/sh

# vimの最新版(clipboard対応)
brew install vim
new_vim=`ls -1 /usr/local/Cellar/vim/*/bin/vim`;
if [ -f ${new_vim} ]; then
  echo "linking latest vim ..."
  if [ ! -f /usr/bin/vim_old ]; then
    sudo mv /usr/bin/vim /usr/bin/vim_old
  fi
  sudo ln -s `ls -1 /usr/local/Cellar/vim/*/bin/vim` /usr/bin 2> /dev/null
fi

# remove outdated versions
brew cleanup
