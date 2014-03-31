### history
export HISTFILE=~/.zsh_history              # historyファイル
export HISTIGNORE=ls:history
export HISTSIZE=10000                       # ファイルサイズ
export HISTTIMEFORMAT='%Y-%m-%d %T '        # bashのhistory zshのfc -ifldで使用する時刻フォーマット
export SAVEHIST=10000                       # saveする量
setopt EXTENDED_HISTORY                     # zshの開始終了を記録
setopt extended_history                     # 履歴ファイルに時刻を記録
setopt hist_ignore_dups                     # 重複を記録しない
setopt hist_reduce_blanks                   # スペース排除
setopt inc_append_history                   # 履歴をインクリメンタルに追加
setopt ignore_eof                           # Ctrl+D では終了しないようになる（exit, logout などを使う）
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'   # 単語の区切り指定
