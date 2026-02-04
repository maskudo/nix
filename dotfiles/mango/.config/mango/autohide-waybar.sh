#!/usr/bin/env bash

waybar &
sleep 5
pkill -SIGUSR1 waybar

WAYBAR_VISIBLE=0 # assume waybar starts visible

mmsg -w -l | while read -r line; do
  if echo "$line" | grep -q "󰃇"; then
    # overview mode → show waybar
    if [ "$WAYBAR_VISIBLE" -eq 0 ]; then
      pkill -USR1 waybar
      WAYBAR_VISIBLE=1
    fi
  else
    # any other layout → hide waybar
    if [ "$WAYBAR_VISIBLE" -eq 1 ]; then
      pkill -USR1 waybar
      WAYBAR_VISIBLE=0
    fi
  fi
done
