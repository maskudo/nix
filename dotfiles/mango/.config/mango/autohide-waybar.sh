#!/usr/bin/env bash

waybar &
sleep 2

WAYBAR_VISIBLE=1 # waybar starts visible; not overview => first event hides it

# Stream monitor state via the mmsg IPC. Overview is active when a monitor
# reports the sentinel tag 0 in active_tags (all tags become active).
mmsg watch all-monitors | while read -r line; do
  if jq -e 'any(.monitors[].active_tags[]; . == 0)' <<<"$line" >/dev/null 2>&1; then
    # overview mode -> show waybar
    if [ "$WAYBAR_VISIBLE" -eq 0 ]; then
      pkill -SIGUSR1 waybar
      WAYBAR_VISIBLE=1
    fi
  else
    # any other layout -> hide waybar
    if [ "$WAYBAR_VISIBLE" -eq 1 ]; then
      pkill -SIGUSR1 waybar
      WAYBAR_VISIBLE=0
    fi
  fi
done
