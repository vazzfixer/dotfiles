#!/bin/sh

. "$DOTPATH"/etc/lib/vital.sh

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
