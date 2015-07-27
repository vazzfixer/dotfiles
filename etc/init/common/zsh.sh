#!/bin/zsh

. "$DOTPATH"/etc/lib/vital.sh

zsh_path=$(which zsh)
# /etc/shellsにzsh追加
if ! grep $zsh_path /etc/shells > /dev/null 2>&1 ; then
    e_header "/etc/shellに$zsh_pathを追加します."
    echo $zsh_path | sudo tee -a /etc/shells
fi

current_shell=`grep $(whoami) /etc/passwd | cut -d':' -f7`
if [ "$current_shell" != "$zsh_path" ]; then
  e_header "changing default login shell to $zsh_path"
  #zshをデフォルトのshellに
  chsh -s $zsh_path
fi

# preztoの最新版を$HOME/.zpreztoに置く
e_header "install prezto and plugins"
if [[ -f $HOME/.zsh/antigen/antigen.zsh ]]; then
  source $HOME/.zsh/antigen/antigen.zsh

  antigen bundle sorin-ionescu/prezto
  e_success "prezto install"
  if [ ! -f $HOME/.zprezto ]; then
    ln -s $HOME/.antigen/repos/.zprezto $HOME/.zprezto
    e_success "linking $HOME/.zprezto"
  fi

  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    if [ ! -f ${ZDOTDIR:-$HOME}/.${rcfile:t} ]; then
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
      e_success "linking ${ZDOTDIR:-$HOME}/.${rcfile:t}"
    fi
  done
fi
e_done "install prezto"
