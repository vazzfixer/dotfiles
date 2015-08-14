#!/bin/sh

. "$DOTPATH"/etc/lib/vital.sh

e_header "install go plugins"
if has go; then
  go get github.com/peco/peco/cmd/peco
else
  e_error "go command doesn't exist. skip installing plugins."
fi

e_done "install go plugins"
