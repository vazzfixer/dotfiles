#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
#

# -------------------------------------------------
# Keybind configuration

# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes to end of it)
bindkey -e

# -------------------------------------------------
# zsh alias
alias vi='vim'
alias htop='sudo htop'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ -f $HOME/.zsh/antigen/antigen.zsh ]]; then
  source $HOME/.zsh/antigen/antigen.zsh
fi

if [[ -f $HOME/.zsh/cool-peco/cool-peco ]]; then
  source $HOME/.zsh/cool-peco/cool-peco
  zle -N cool-peco-ps
  zle -N cool-peco-ghq
  zle -N cool-peco-history
  zle -N cool-peco-filename-search
  bindkey '^p^p' cool-peco-ps
  bindkey '^p^g' cool-peco-ghq
  bindkey '^p^r' cool-peco-history
  bindkey '^p^s' cool-peco-filename-search
fi

if [[ -f $HOME/.zsh/z/z.sh ]]; then
  source $HOME/.zsh/z/z.sh
fi

# Load the oh-my-zsh's library.
#antigen use oh-my-zsh

# Tell antigen that you're done.
#antigen-apply
#

if [ -d $HOME/.anyenv ] ; then
    eval "$(anyenv init - zsh)"
fi

# for work environment ( override if needed )
if [ -f $HOME/.zshrc.work ]; then
  source $HOME/.zshrc.work
fi

# brew api token
if [ -f ~/.brew_api_token ];then
  source ~/.brew_api_token
fi

# set brew-file wrapper
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

# -------------------------------------------------
# go settings

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# -------------------------------------------------
# history

HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
## ヒストリファイルにコマンドラインだけではなく実行時刻と実行時間も保存する。
setopt extended_history
## 同じコマンドラインを連続で実行した場合はヒストリに登録しない。
setopt hist_ignore_dups
## スペースで始まるコマンドラインはヒストリに追加しない。
setopt hist_ignore_space
## すぐにヒストリファイルに追記する。
setopt inc_append_history
## zshプロセス間でヒストリを共有する。
setopt share_history
## C-sでのヒストリ検索が潰されてしまうため、出力停止・開始用にC-s/C-qを使わない。
setopt no_flow_control

# -------------------------------------------------
# zsh options
# ディレクトリ名でcdを可能にする
setopt auto_cd
# 補完機能. 個別にOFFりたい場合は、 alias git="nocorrect git"とか無効に
# やっぱ邪魔なのでOFFる
unsetopt correct

# 補完時の表示をコンパクトにする
setopt list_packed

# -------------------------------------------------
# shell functions.
dotfiles=$HOME/dotfiles

for textfile in $( ls $dotfiles/etc/profile/*.sh ); do
  source $textfile
done

rand () {
  expr $RANDOM % 41
}
