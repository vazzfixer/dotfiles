# -------------------------------------------------
# Source global definitions
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

# -------------------------------------------------
# prompt color set
RESET=$(tput sgr0)
DARK_GRAY=$(tput setaf 0)
GREEN=$(tput setaf 2)
ORANGE=$(tput setaf 3)
MAGENTA=$(tput setaf 5)

# -------------------------------------------------
# common os environment settings
export LANG=ja_JP.UTF-8
export VISUAL=vim
TERM=xterm-color
PS1='[\u@\h \W]\$ '
OSTYPE=`uname`
HISTTIMEFORMAT='%Y-%m-%d %T '
HISTSIZE=10000
TERM=xterm-256color

# -------------------------------------------------
# application environment
export GITHUB_URL=https://github.com/

# -------------------------------------------------
# set alias
export LS_COLORS='no=01;37:fi=00:di=01;36:ln=01;32:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;32;01:ex=01;33:*core=01;31:'
alias grep='grep -E --color=auto'
export GREP_COLOR='1;37;41'

case "${OSTYPE}" in
  Darwin*)
    alias ls='ls -G'
    alias ll='ls -lG'
    alias la='ls -laG'
    ;;
  Linux*)
    alias ls='ls --color=auto'
    alias ll='ls -l --color=auto'
    alias la='ls -al --color=auto'
    ;;
esac

alias vi='vim'

# -------------------------------------------------
# import
export PATH="$PATH:/usr/local/sbin"

# add git repository name in PS1
if [ -a $HOME/.git-completion.bash ]; then
  source $HOME/.git-completion.bash
fi

# load perlbrew settings
PERLBREW_ROOT="$HOME/perl5/perlbrew"
if [ -f $PERLBREW_ROOT/etc/bashrc ]; then
  source $PERLBREW_ROOT/etc/bashrc
fi

# load rbenv settings
if [ -d $HOME/.rbenv/bin ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# -------------------------------------------------
# prompt
#function prompt_command {
#  PS1='[\u@\h \W\[\e[0;35m\]$(__git_ps1)\[\e[0m\]]\$ '
#  #PS1="\[$RESET\]\[$DARK_GRAY\]\u in \[$GREEN\]\w$(__git_ps1) \[$DARK_GRAY\]$\[$RESET\] "
#  #PS1='\[\e[0;32m\][pl:${PERLBREW_PERL:-"system"}]\[\e[0m\]$ '
#}

#PROMPT_COMMAND=prompt_command

# -------------------------------------------------
# OS
case "${OSTYPE}}" in
  Darwin*)
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
    export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH # should be fixed.
    export BYOBU_PREFIX=$(brew --prefix)
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
    brew=/usr/local/bin
    type brew >/dev/null 2>&1 && export PATH=$brew:${PATH//$brew:/}
    ;;
  linux*)
    ;;
esac

# -------------------------------------------------
# for work environment ( override if needed )
if [ -f $HOME/.bashrc.work ]; then
  source $HOME/.bashrc.work
fi
