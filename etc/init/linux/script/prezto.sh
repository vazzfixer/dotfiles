. "$DOTPATH"/etc/lib/vital.sh

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
