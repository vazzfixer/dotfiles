#!/bin/sh

. "$DOTPATH"/etc/lib/vital.sh

if [ "`whoami`" = "$exec_user" ]; then
  e_failure "Login ec2-user to execute this script"
elif [ `sudo whoami` != "root" ]; then
  e_failure "ec2-user can't use sudo command. check errors..."
fi

e_header "Creating new user..."
e_prompt "Input a new username"
read NEWUSER

check=`cut -d':' -f1 /etc/passwd | grep $NEWUSER`
if [ -n "$check" ]; then
  e_error "$NEWUSER is already added. skip to add the user."
  exit 0;
fi

sudo adduser $NEWUSER
sudo usermod -G wheel $NEWUSER
sudo rsync -a ~/.ssh/authorized_keys /home/$NEWUSER/.ssh/
sudo chown -R $NEWUSER:$NEWUSER /home/$NEWUSER/.ssh
sudo chmod -R go-rwx /home/$NEWUSER/.ssh

sudoers_file=/etc/sudoers.d/user
cat << EOF | sudo tee $sudoers_file >/dev/null
$NEWUSER ALL = NOPASSWD: ALL

# User rules for $NEWUSER
$NEWUSER ALL=(ALL) NOPASSWD:ALL
EOF

if [ ! -f $sudoers_file ]; then
  e_failure "sudoersファイルの作成に失敗しました."
else
  e_success "sudoers file generated for $NEWUSER"
fi

e_header "checking sudo command..."
if [ `sudo -u $NEWUSER whoami` != $NEWUSER ]; then
  e_failure "creating $NEWUSER failed. chech errors..."
elif [ `sudo -u $NEWUSER sudo whoami` != "root" ]; then
  e_failure "$NEWUSER can't use sudo command. check errors."
fi
e_success "sudo command succeeded. ready to delete ec2-user"

if [ -f /etc/ssh/sshd_config ]; then
  if grep "DenyUsers" /etc/ssh/sshd_config > /dev/null;then
    e_error "ec2-user can't ssh already. ignore adding DenyUsers"
  else
    e_header "disable ec2-user ssh logging"
    echo "DenyUsers ec2-user" | sudo tee -a /etc/ssh/sshd_config
    sudo service sshd reload
    e_success "ec2-user can't ssh anymore"
  fi
fi

e_done "installed $NEWUSER user. DELETE ec2-user if needed."
