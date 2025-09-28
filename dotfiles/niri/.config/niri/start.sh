#!/usr/bin/env bash

swww-daemon &
swww img ~/Pictures/Wallpapers/hollow-knight.png
waybar &
foot --server &

nm-applet --indicator &
pypr --debug /tmp/pypr.log &
xrdb -load ~/.Xdefaults &

copyq &
# gnome-keyring-daemon &
pkill dunst &
dunst &
zen &
discord &
# vicinae server &
sleep 10
go run ~/.config/niri/scripts/auto-hide-waybar.go &
