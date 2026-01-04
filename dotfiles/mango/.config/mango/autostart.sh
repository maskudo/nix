#!/usr/bin/env bash

swww-daemon &
swww img ~/Pictures/Wallpapers/portal.png
foot --server &

nm-applet --indicator &
xrdb -load ~/.Xdefaults &

dunst &
waybar &
zen &
discord &
vesktop &
powermode-indicator &
awatcher &
wl-paste --watch cliphist store &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots &
