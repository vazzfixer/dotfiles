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
#   - NeoBundle(vim plugin manager)
# Linux:
# MacOS:
#   - homebrew ( see Brewfile for detail )
#

# -------------------------------------------------
# symlink dotfiles

DOT_FILES=( .bash_profile .bashrc .inputrc .vimrc .vim .gitconfig )
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
  brew_dir=/usr/local/bin
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
  if [ ! -f $brew_dir/brew ]; then
    echo "install brew"
    sudo mkdir $brew_dir
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
  fi
  brew doctor || brew bundle ~/dotfiles/Brewfile

  if [ -f $(brew --prefix)/etc/bash_completion -a ! -f $HOME/.bash_completion ]; then
    file=$(brew --prefix)/etc/bash_completion
    ln -s $file $HOME/.bash_completion
    echo "make symlink : .bash_completion"
  fi
fi

