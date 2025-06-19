#!/usr/bin/env bash

session_name="generate-palette"

if tmux has-session -t "$session_name" 2>/dev/null; then
    tmux kill-session -t "$session_name"
fi

tmux new-session -d -s "$session_name" '$EDITOR generate-palette.sh'
tmux split-window -h -p 10 -t "$session_name" 'pastel list; exec $SHELL'
tmux split-window -h -p 10 -t "$session_name.1" 'watchexec -w generate-palette.sh ./generate-palette.sh'
tmux attach-session -t "$session_name"
