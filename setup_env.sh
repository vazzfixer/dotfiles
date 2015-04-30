#!/bin/bash

# -------------------------------------------------
# setup info
# common:
#   - dotfile symlinks:
#     - .bash_profile
#     - .bashrc
#     - .inputrc
#     - .vimrc
#     - .vim/
#     - .gitconfig
#     - .gitignore
#     - .zshrc
#     - .tmux.conf
#     - .pandoc/
#   - NeoBundle(vim plugin manager)

# -------------------------------------------------
# symlink dotfiles

DOT_FILES=( .bash_profile .bashrc .inputrc .vimrc .vim .gitconfig .zshrc .tmux.conf .gitignore .pandoc)
BACKUP=$HOME/dotbackup
DATE=`date +"%Y%m%d%k%M%S"`

# backup folder
if [ ! -d $HOME/dotbackup ]; then
  mkdir $BACKUP
fi

for file in ${DOT_FILES[@]}
do
  [ -L $HOME/$file ] && continue
  if [ -f $HOME/$file ]; then
    mv $HOME/$file $BACKUP/$file.$DATE
    if [ $? -ne 0 ]; then
      echo "backup error : $HOME/$file"
      continue
    fi
  fi
  ln -s $HOME/dotfiles/$file $HOME/$file
  echo "make symlink : $HOME/$file"
done

# -------------------------------------------------
# install NeoBundle
if [ ! -d ~/.vim/bundle ]; then
  mkdir -p ~/.vim/bundle && git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim && vim -c ':NeoBundleInstall'
fi

# -------------------------------------------------
#  OS setup   TODO: should change makefile

if [ `uname` = "Darwin" ]; then
    echo "setup macos..."
    `$HOME/dotfiles/setup_env_macos.sh`
fi
