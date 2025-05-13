#!/usr/bin/env bash

# Show polybar
polybar-msg cmd show

CURSOR_STILL_NEAR_TOP=1

# Hide polybar when the cursor moves *below* the top 30 pixels
TOP_EDGE_LIMIT=30

while [ "$CURSOR_STILL_NEAR_TOP" -eq 1 ]; do
  Y_POS=$(xdotool getmouselocation | cut -d " " -f2 | cut -d ":" -f2)
  Y_POS=$(($Y_POS))
  if [ "$Y_POS" -gt "$TOP_EDGE_LIMIT" ]; then
    CURSOR_STILL_NEAR_TOP=0
  else
    sleep 0.05
  fi
done

# Hide polybar
polybar-msg cmd hide
