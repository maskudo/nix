#!/usr/bin/env bash

awww-daemon &
awww img ~/Pictures/Wallpapers/portal.png
waybar &
foot --server &

nm-applet --indicator &
xrdb -load ~/.Xdefaults &

copyq &
# gnome-keyring-daemon &
pkill dunst &
dunst &
zen &
discord &
wl-paste --watch cliphist store &
# vicinae server &
sleep 10
go run ~/.config/niri/scripts/auto-hide-waybar.go &
