#!/bin/bash



# Session Name
session="nmap"

# Start New Session with our name
tmux new-session -d -s $session

# Run nmap
tmux split-window -v 
tmux split-window -h
tmux select-pane -t 0
tmux split-window -h

# Run command pane 0
tmux send-keys -t 0 'du' C-m

# Run command pane 1
tmux send-keys -t 1 'ls' C-m

# Run command pane 2
tmux send-keys -t 2 'df' C-m

# Run command pane 3
tmux send-keys -t 3 'whois' C-m

# attach to window
tmux select-pane -t 0
tmux attach -t "$session"
