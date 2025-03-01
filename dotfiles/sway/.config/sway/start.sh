#!/usr/bin/env bash
swww-daemon &
swww img ~/Pictures/Wallpapers/hollow-knight.png

nm-applet --indicator &
# pypr --debug /tmp/pypr.log &
waybar &
xrdb -load ~/.Xdefaults

zen &
copyq &
discord &
gnome-keyring-daemon &
pkill dunst &
swaync &
