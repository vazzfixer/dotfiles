# -------------------------------------------------
# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# -------------------------------------------------
# default env
export LANG=ja_JP.UTF-8
TERM=xterm-color
PS1='[\u@\h \W]\$ '
PROMPT_COMMAND=

# -------------------------------------------------
# set alias
export LS_COLORS='no=01;37:fi=00:di=01;36:ln=01;32:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;32;01:ex=01;33:*core=01;31:'
alias ls='ls -G'
alias ll='ls -al'
alias la='ls -a'
alias l='ls -CF'
alias grep='grep -E --color=auto'
export GREP_COLOR='1;37;41'

# -------------------------------------------------
# import
[ -a $HOME/.bashrc_git ] && source $HOME/.bashrc_git
[ -a $HOME/.bashrc_perlbrew ] && source $HOME/.bashrc_perlbrew
[ -a $HOME/.bashrc_rbenv ] && source $HOME/.bashrc_perlbrew
