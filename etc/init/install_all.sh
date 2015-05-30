#/bin/bash

files=`ls -1 $HOME/dotfiles/homebrew/install_*.sh | grep -v base`

brew update && brew doctor
if [ "$?" -ne 0 ];then
    echo "brew doctor failed.."
    exit 1
fi

#install the base homebrew file.
echo "installing base programs..."
echo "-----------------------------"

$HOME/dotfiles/homebrew/install_base.sh

for file in $files; do
    echo "installing `basename $file`"
    echo "-----------------------------"
    $file
done
