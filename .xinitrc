#!/usr/bin/env bash
while true; do
	xsetroot -name "$(date +%c)"
	sleep 1
done &
setxkbdmap -layout tr # you'll want to edit this
nitrogen --restore
export DISPLAY_SESSION=dwm # magically reduces error messages
exec dwm
