#!/usr/bin/env bash

swww-daemon &
swww img ~/Pictures/Wallpapers/berserk-brand.png
foot --server &

nm-applet --indicator &
xrdb -load ~/.Xdefaults &

dunst &
# waybar &
~/.config/mango/autohide-waybar.sh &
zen &
# discord &
# vesktop &
powermode-indicator &
awatcher &
wl-paste --watch cliphist store &
wlsunset -s "21:00" -S "06:00" &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots &
pactl set-sink-volume alsa_output.pci-0000_06_00.6.HiFi__Speaker__sink 0 &
input-remapper-control --command stop-all && input-remapper-control --command autoload &
