#!/bin/sh

. "$DOTPATH"/etc/lib/vital.sh

e_newline
e_header "making vimproc"
if is_osx ; then
  cd ~/.vim/bundle/vimproc
  make -f make_mac.mak
elif is_linux ; then
  cd ~/.vim/bundle/vimproc
  make -f make_unix.mak
else
  e_error "get_os failed. Ignore making vimproc."
fi

e_newline
e_header "NeoBundleInstall"

vim -u $HOME/.vimrc -i NONE -c "try | NeoBundleInstall! | finally | q! | endtry" -e -s -V1

e_done "installed."
