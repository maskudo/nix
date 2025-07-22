#!/usr/bin/env bash

hyprctl dispatch submap reset

# Run hyprlock and wait briefly to ensure it has locked the screen
hyprlock &

# Give hyprlock a bit of time to lock before suspend
sleep 1

# Then suspend
systemctl suspend
