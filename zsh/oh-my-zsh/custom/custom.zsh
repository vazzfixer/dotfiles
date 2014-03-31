case $(uname -s) in
    Darwin|FreeBSD)
        #[ -f ~/.zshrc.osx     ] && source ~/.zshrc.osx
        #[ -f ~/.zshrc.aws     ] && source ~/.zshrc.aws
        export LANG="ja_JP.UTF-8"
        export LANGUAGE="ja_JP.UTF-8"
        export HOMEBREW_CASK_OPTS="--appdir=/Applications"
        export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH # should be fixed.
        if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
        brew=/usr/local/bin
        type brew >/dev/null 2>&1 && export PATH=$brew:${PATH//$brew:/}
    ;;
    Linux)
    ;;
esac
