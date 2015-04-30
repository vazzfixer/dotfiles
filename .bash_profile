if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

export LANG=ja_JP.UTF-8
export VISUAL=vim
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/dotfiles/bin"
export GITHUB_URL=https://github.com/
export LS_COLORS='no=01;37:fi=00:di=01;36:ln=01;32:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;32;01:ex=01;33:*core=01;31:'
export GREP_COLOR='1;37;41'
