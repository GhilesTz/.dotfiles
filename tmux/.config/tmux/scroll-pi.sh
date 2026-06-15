#!/usr/bin/env bash
# Scroll the pi pane — called from tmux bindings
# Usage: scroll-pi.sh up|down

direction="${1:-up}"

# Find the pane running 'pi'
pane=$(tmux list-panes -F '#{pane_id} #{pane_current_command}' | grep ' pi$' | cut -d' ' -f1)

if [ -z "$pane" ]; then
  exit 0 # no pi pane, nothing to do
fi

tmux copy-mode -t "$pane"
if [ "$direction" = "up" ]; then
  tmux send-keys -X -t "$pane" halfpage-up
else
  tmux send-keys -X -t "$pane" halfpage-down
fi
