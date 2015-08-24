#!/bin/sh

source $HOME/dotfiles/etc/lib/vital.sh

e_header "adding yum repositories"

# yumのpriorityツール
sudo yum -y install yum-plugin-priorities

# CentOS Base priority=1
sudo sed -i -e "s/\]$/\]\npriority=1/g" /etc/yum.repos.d/CentOS-Base.repo

# fedora EPEL priority=5
sudo yum -y install epel-release
sudo sed -i -e "s/\]$/\]\npriority=5/g" /etc/yum.repos.d/epel.repo

# RPM Forge   priority=10
sudo yum -y install http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
sudo sed -i -e "s/\]$/\]\npriority=10/g" /etc/yum.repos.d/rpmforge.repo

e_done "adding yum repositories"
