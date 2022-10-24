#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# wait until polybar stops.
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config.ini
#polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown
polybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
