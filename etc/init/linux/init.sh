#!/bin/sh

. "$DOTPATH"/etc/lib/vital.sh

install_yum_package() {
  e_header "install yum packages"
  sudo yum install -y gcc
  sudo yum install -y tmux
  sudo yum install -y zsh
  sudo yum install -y vim
  e_success "install yum packages"
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
if [ "$dist" = "CentOS" ]; then
  install_yum_package
elif [ "$dist" = "Amazon" ]; then
  install_yum_package
  yum_cron_security
else
  e_error "unsupported distribution. install common settings only."
fi
