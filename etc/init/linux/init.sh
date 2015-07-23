#!/bin/sh

. "$DOTPATH"/etc/lib/vital.sh

install_yum_package() {
  e_header "install yum packages"
  sudo yum install gcc
  sudo yum install tmux
  sudo yum install zsh
  e_success "install yum packages"
}

change_default_to_zsh() {
  e_header "changing default shell to zsh"
  chsh -s $(which zsh)
}

install_dist_files() {
  for i in "$DOTPATH"/etc/init/"$(get_os)"/"$(get_dist)"/*[^init].sh
  do
    if [ -f "$i" ]; then
      e_arrow "$(basename "$i")"
      bash "$i"
    else
      continue
    fi
  done
}

dist=get_dist
if [ "$dist" = "Amazon" ]; then
  install_yum_package
  install_dist_files
elif [ "$dist" = "CentOS" ]; then
  install_yum_package
else
  e_error "unsupported distribution. install common settings only."
fi

change_default_to_zsh
