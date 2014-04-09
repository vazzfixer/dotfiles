autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 500 # cdrの履歴を保存する個数
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

source $HOME/dotfiles/zsh/my-plugin/zaw/zaw.zsh
zstyle ':filter-select:highlight' selected fg=black,bg=white,standout
zstyle ':filter-select' case-insensitive yes

bindkey '^X^X' zaw-cdr
bindkey '^X^R' zaw-history
bindkey '^X^F' zaw-git-files
bindkey '^X^D' zaw-gitdir
bindkey '^X^B' zaw-git-branches
bindkey '^X^P' zaw-process
bindkey '^X^H' zaw-tmux

