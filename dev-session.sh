#!/bin/bash

# Development Environment Tmux Session Script
# Usage: ./dev-session.sh [session-name] [project-directory]

SESSION_NAME="${1:-dev}"
PROJECT_DIR="${2:-$(pwd)}"

# Check if we're inside a tmux session
if [ -n "$TMUX" ]; then
    echo "You are already inside a tmux session."
    echo "Please run this script from outside tmux, or use 'tmux detach' first."
    exit 1
fi

# Check if session already exists
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    echo "Session '$SESSION_NAME' already exists. Attaching..."
    tmux attach-session -t "$SESSION_NAME"
    exit 0
fi

# Create new session with first window (neovim)
echo "Creating tmux session '$SESSION_NAME' in directory: $PROJECT_DIR"
tmux new-session -d -s "$SESSION_NAME" -c "$PROJECT_DIR"

# Rename first window and start neovim
tmux rename-window -t "$SESSION_NAME:1" "nvim"
tmux send-keys -t "$SESSION_NAME:1" "nvim " Enter

# Create second window (terminal)
tmux new-window -t "$SESSION_NAME" -c "$PROJECT_DIR" -n "terminal"

# Create third window (git operations)
tmux new-window -t "$SESSION_NAME" -c "$PROJECT_DIR" -n "git"
tmux send-keys -t "$SESSION_NAME:3" "git status" Enter

# Optional: Create a fourth window for system monitoring/logs
tmux new-window -t "$SESSION_NAME" -c "$PROJECT_DIR" -n "system"

# Select the first window (neovim) as default
tmux select-window -t "$SESSION_NAME:1"

# Attach to the session
tmux attach-session -t "$SESSION_NAME"
