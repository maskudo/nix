#!/usr/bin/env bash

# Function to check if Polybar is running
is_running() {
    ps cax | grep polybar > /dev/null
}

# Function to kill Polybar
kill_polybar() {
    echo "Terminating already running Polybar instances..."
    killall -q polybar
    pkill polybar
    while pgrep -x polybar >/dev/null; do sleep 1; done
}

# Function to launch Polybar
launch_polybar() {
    polybar bar1 2>&1 | tee -a /tmp/polybar.log & disown
}

if is_running; then
    kill_polybar
else
    launch_polybar
fi


