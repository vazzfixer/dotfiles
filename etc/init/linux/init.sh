#!/bin/sh

. "$DOTPATH"/etc/lib/vital.sh

install_yum_package() {
  e_header "install yum packages"
  sudo yum install -y gcc
  sudo yum install -y tmux
  sudo yum install -y zsh
  e_success "install yum packages"
}

change_default_to_zsh() {
  e_header "changing default shell to zsh"
  chsh -s $(which zsh)
}

yum_cron_security() {
  e_newline
  e_header "install yum-cron-security"
  sudo yum install yum-cron-security -y

  sudo service yum-cron start
  sudo chkconfig yum-cron on

  status=`chkconfig --list yum-cron | cut -f5 | cut -d':' -f2`
  if [ "$status" = "on" ]; then
    e_success "checkconfig yum-cron on"
  else
    e_error "checkconfig yum-cron on"
  fi

  e_done "intall yum-cron-security"
}

dist=`get_dist`
if [ "$dist" = "Amazon" -o "$dist" = "CentOS" ]; then
  install_yum_package
  install_dist_files
  yum_cron_security
else
  e_error "unsupported distribution. install common settings only."
fi

change_default_to_zsh
