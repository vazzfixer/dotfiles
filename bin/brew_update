#!/bin/sh

log_dir=$HOME/Library/Logs/Homebrew/update

log_name=${log_dir}/`date "+%Y%m%d"`.log

if [ ! -d ${log_dir} ]; then
  mkdir -p ${log_dir}
fi

brew doctor >> ${log_name} 2>&1
if [ $? -ne 0 ]; then
    brew file update >> ${log_name} 2>&1
    brew file cask_upgrade >> ${log_name} 2>&1
fi
