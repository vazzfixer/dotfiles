#!/bin/sh

. "$DOTPATH"/etc/lib/vital.sh

e_newline
e_header "install yum-cron-security"
sudo yum install yum-cron-security -y
e_success "installed yum-cron-security"



 yum-cronが起動されている場合
 $ service yum-cron status
 Scheduled yum updates are enabled.
 yum-cronが起動されていない場合
 $ service yum-cron status
 Scheduled yum updates are disabled.

 sudo service yum-cron start

 sudo chkconfig yum-cron on
