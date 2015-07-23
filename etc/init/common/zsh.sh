#!/bin/bash

zsh_path=`which zsh`

# /etc/shellsにzsh追加
if ! grep "zsh" /etc/shells > /dev/null 2>&1 ; then
    echo $zsh_path | sudo tee -a /etc/shells
fi

if [ ! "$SHELL" = "zsh" ]; then
  #zshをデフォルトのshellに
  chsh -s $zsh_path
fi

#zshに切り替える
exec /bin/zsh
. $HOME/.zprofile
. $HOME/.zshrc

# preztoの最新版を$HOME/.zpreztoに置く
antigen bundle sorin-ionescu/prezto
ln -s ~/.antigen/repos/.zprezto ~/.zprezto

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  #.zshrcはdotfiles/.zshrcを使うのでエラー無視
done
