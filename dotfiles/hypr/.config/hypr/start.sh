#!/usr/bin/env bash
swww-daemon &
swww img ~/Pictures/Wallpapers/hollow-knight.png
waybar &

nm-applet --indicator &
pypr --debug /tmp/pypr.log &
xrdb -load ~/.Xdefaults

zen &
copyq &
discord &
gnome-keyring-daemon &
pkill dunst &
dunst &
