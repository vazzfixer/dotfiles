_Z_CMD=j
source $HOME/dotfiles/zsh/my-plugin/z.sh
precmd() {
      _z --add "$(pwd -P)"
}

