#!/usr/bin/env bash

killall -q polybar

while pgrep -x polybar > /dev/null; do
    sleep 1
done

CONFIG=~/.dotfiles/polybar/config

for OUTPUT in $(xrandr | grep " connected" | cut -d ' ' -f1); do
	echo "MONITOR=$OUTPUT polybar -c $CONFIG top &"
	MONITOR="$OUTPUT" polybar -c $CONFIG top &
	echo "$CONFIG launched on $OUTPUT"
done
