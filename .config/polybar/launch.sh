#!/bin/bash

# Author: github.com/Mofiqul

## Add this to your wm startup file

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shutdown
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch fullbar
polybar fullbar &
