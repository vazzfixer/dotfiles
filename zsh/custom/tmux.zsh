
split-result(){
    if [ $# -eq 0 ]; then
        cat > /tmp/tmux.tmp && tmux split-window -h "less /tmp/tmux.tmp"
    else
        tmux split-window -h "$*"
    fi
}
