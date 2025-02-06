#!/usr/bin/env bash

if [[ "$(pactl get-source-mute @DEFAULT_SOURCE@)" == "Mute: yes" ]]; then
	echo  Mute
else
	echo  "$(wpctl get-volume @DEFAULT_SOURCE@ | cut -f2 -d' ' | jq -r '. * 1000 | round / 10')"%
fi
