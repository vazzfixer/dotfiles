#!/bin/sh

. "$DOTPATH"/etc/lib/vital.sh

e_newline
e_header "NeoBundleInstall"

vim -u $HOME/.vimrc -i NONE -c "try | NeoBundleInstall! | finally | q! | endtry" -e -s -V1

e_newline
e_done "installed."
