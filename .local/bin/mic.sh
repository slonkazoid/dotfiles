#!/usr/bin/env bash

OUTPUT=

if [[ "$(pactl get-source-mute @DEFAULT_SOURCE@)" == "Mute: yes" ]]; then
	OUTPUT=
fi

if command -v pamixer >/dev/null; then
	if [[ "$OUTPUT" == "" ]]; then
		OUTPUT+=" $(pamixer --default-source --get-volume)%"
	else
		OUTPUT+=" Mute"
	fi
fi

echo "$OUTPUT"
