#!/bin/bash

# homebrew
#brew install zsh

zsh_path=/usr/local/bin/zsh

# /etc/shellsにzsh追加
if ! grep "zsh" /etc/shells > /dev/null 2>&1 ; then
    echo $zsh_path | sudo tee -a /etc/shells
fi

chsh -s $zsh_path

# .zshk系統をどっかで対比
antigen bundle sorin-ionescu/prezto
ln -s ~/.antigen/repos/.zprezto ~/.zprezto

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  #.zshrcはdotfiles/.zshrcを使う
done
