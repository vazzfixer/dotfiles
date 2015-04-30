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
TERM=xterm-color
PS1='[\u@\h \W]\$ '
OSTYPE=`uname`
HISTTIMEFORMAT='%Y-%m-%d %T '
HISTSIZE=10000
TERM=xterm-256color

# -------------------------------------------------
# set alias
alias grep='grep -E --color=auto'
alias vi='vim'

# -------------------------------------------------
# import

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
# etc

# tmux start
if [ -z "$TMUX" -a -z "$STY" ]; then
    if type tmuxx >/dev/null 2>&1; then
        tmuxx
    elif type tmux >/dev/null 2>&1; then
        if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
            tmux attach && echo "tmux attached session "
        else
            tmux new-session && echo "tmux created new session"
        fi
    elif type screen >/dev/null 2>&1; then
        screen -rx || screen -D -RR
    fi
fi

# OS environments
case "${OSTYPE}}" in
  Darwin*)
    if [ -f $HOME/dotfiles/.bashrc_mac ]; then
      source $HOME/dotfiles/.bashrc_mac
    fi
    ;;
  linux*)
    if [ -f $HOME/dotfiles/.bashrc_linux ]; then
      source $HOME/dotfiles/.bashrc_linux
    fi
    ;;
esac

# for work environment ( override if needed )
if [ -f $HOME/.bashrc.work ]; then
  source $HOME/.bashrc.work
fi

# -------------------------------------------------
# shell関数

pandoc_html () {
  pandoc -s --self-contained -t html5 -c ~/.pandoc/github.css $@
}

pandoc_pdf () {
  pandoc -V documentclass=ltjarticle --latex-engine=lualatex $@
}

