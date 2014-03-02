#!/bin/bash


# -------------------------------------------------
# symlink dotfiles

DOT_FILES=( .bash_profile .bashrc .inputrc .vimrc .vim )
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

# -------------------------------------------------
# install NeoBundle
if [ ! -d ~/.vim/bundle ]; then
  mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && vim -c ':NeoBundleInstall'
fi

# -------------------------------------------------
# OS独自setup定義  TODO:インストール系はMakefileに移したい

if [ `uname` = "Darwin" ]; then
  brew=/usr/local/bin
  if [ ! -f $brew/brew ]; then
    echo "install brew"
    sudo mkdir $brew
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
    type brew >/dev/null 2>&1 && export PATH=$brew:${PATH//$brew:/}
  fi

  if [ ! -f $(brew --prefix)/etc/bash_completion ]; then
    echo "install bash-completion"
    brew install bash-completion
  fi
  if [ -f $(brew --prefix)/etc/bash_completion -a ! -f $HOME/.bash_completion ]; then
    file=$(brew --prefix)/etc/bash_completion
    ln -s $file $HOME/.bash_completion
    echo "シンボリックリンク作成 : .bash_completion"
  fi
fi

