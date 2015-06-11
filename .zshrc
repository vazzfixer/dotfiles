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

if [ -d $HOME/.anyenv ] ; then
    eval "$(anyenv init -)"
fi

# for work environment ( override if needed )
if [ -f $HOME/.zshrc.work ]; then
  source $HOME/.zshrc.work
fi

# -------------------------------------------------
# zsh options
# ディレクトリ名でcdを可能にする
setopt auto_cd
# 補完機能. 個別にOFFりたい場合は、 alias git="nocorrect git"とか無効に
setopt correct
# 補完時の表示をコンパクトにする
setopt list_packed


# -------------------------------------------------
# shell functions.
dotfiles=$HOME/dotfiles

# road pandoc functions
if [ -f $dotfiles/etc/profile/pandoc.sh ]; then
  source $dotfiles/etc/profile/pandoc.sh
fi

# road z.sh
z=`brew --prefix`/etc/profile.d/z.sh
if [ -f $z ]; then
    source $z
fi

# road peco-select-history
if [ -f $dotfiles/etc/profile/peco-select-history.sh ]; then
  source $dotfiles/etc/profile/peco-select-history.sh
fi

rand () {
  expr $RANDOM % 41
}
