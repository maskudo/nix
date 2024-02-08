#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
pkill polybar
# kill -9 $(pgrep -f 'polybar') >/dev/null 2>&1
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar bar1 2>&1 | tee -a /tmp/polybar.log & disown

