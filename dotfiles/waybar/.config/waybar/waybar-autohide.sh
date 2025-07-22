#!/usr/bin/env bash
#
# # Launch Waybar
waybar &
sleep 5
pkill -SIGUSR2 waybar

bar_visible=true

# Configure thresholds
TOP_EDGE_Y=5
UNHIDE_ZONE_Y=35
SIDE_EDGE_WIDTH=20

# Get screen width (assumes single monitor; update if needed)
SCREEN_WIDTH=$(hyprctl monitors | grep -m1 'at' | cut -d '@' -f 1 | cut -d 'x' -f 1 | tr -d '\t')

# Monitor cursor position
while true; do
  read -r X Y <<<$(hyprctl cursorpos)
  X=$(echo $X | tr -d ',')
  echo $X $Y

  # At top-left or top-right corner
  if [ "$Y" -le "$TOP_EDGE_Y" ] &&
    { [ "$X" -le "$SIDE_EDGE_WIDTH" ] || [ "$X" -ge $((SCREEN_WIDTH - SIDE_EDGE_WIDTH)) ]; } &&
    [ "$bar_visible" = true ]; then

    pkill -SIGUSR2 waybar
    bar_visible=false

    # Stay hidden while cursor is near the top
    while true; do
      read -r X Y < <(hyprctl cursorpos | tr -d ',')
      if [ "$Y" -gt "$UNHIDE_ZONE_Y" ]; then
        break
      fi
      sleep 0.2
    done

  elif [ "$Y" -gt "$UNHIDE_ZONE_Y" ] && [ "$bar_visible" = false ]; then
    pkill -SIGUSR1 waybar
    bar_visible=true
  fi

  sleep 0.2
done
