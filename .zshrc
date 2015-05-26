#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
if [[ -f $HOME/.zsh/antigen/antigen.zsh ]]; then
  source $HOME/.zsh/antigen/antigen.zsh
fi

# Load the oh-my-zsh's library.
#antigen use oh-my-zsh

# Tell antigen that you're done.
#antigen-apply
#

# each ostype settings
#if [[ "$OSTYPE" == darwin* ]]; then
#elif [[ "$OSTYPE" == linux* ]]; then
#fi

# tmux start
#if [ -z "$TMUX" -a -z "$STY" ]; then
#    if type tmuxx >/dev/null 2>&1; then
#        tmuxx
#    elif type tmux >/dev/null 2>&1; then
#        if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
#            tmux attach && echo "tmux attached session "
#        else
#            tmux new-session && echo "tmux created new session"
#        fi
#    elif type screen >/dev/null 2>&1; then
#        screen -rx || screen -D -RR
#    fi
#fi

# for work environment ( override if needed )
if [ -f $HOME/.zshrc.work ]; then
  source $HOME/.zshrc.work
fi

# -------------------------------------------------
# shell functions.
dotfiles=$HOME/dotfiles

# road pandoc functions
if [ -f $dotfiles/profile/pandoc.sh ]; then
  source $dotfiles/profile/pandoc.sh
fi

rand () {
  expr $RANDOM % 41
}
