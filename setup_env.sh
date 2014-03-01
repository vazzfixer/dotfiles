#!/bin/bash

DOT_FILES=( .bashrc .bashrc_perlbrew .bashrc_rbenv .bashrc_git)
BACKUP=$HOME/dotbackup
DATE=`date +"%Y%m%d%k%M%S"`

# backup folder
if [ ! -d $HOME/dotbackup ]; then
  mkdir $BACKUP
fi

for file in ${DOT_FILES[@]}
do
  if [ -f $HOME/$file ]; then
    mv $HOME/$file $BACKUP/$file.$DATE
    if [ $? -ne 0 ]; then
      echo "バックアップへの移動失敗 : $HOME/$file"
      continue
    fi
  fi
  ln -s $HOME/dotfiles/$file $HOME/$file
  echo "シンボリックリンク作成 : $file"
done

#if [ ! -d ~/.vim/bundle ]; then
#  mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && vim -c ':NeoBundleInstall'
#fi

