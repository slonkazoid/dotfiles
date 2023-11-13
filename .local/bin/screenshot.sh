#!/usr/bin/env bash

set -e

screenshot_path="$(xdg-user-dir PICTURES)/Screenshot_$(date +%Y%m%d_%H%M%S).png"
temp_file="/tmp/$(date '+%Y%m%d_%H%M%S')_$RANDOM.png"

pick_window() {
    swaymsg -t get_tree |
        jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' |
        slurp
}

freeze() {
    grim "$temp_file"
    feh "$temp_file" &
    pid="$!"
    sleep 0.2
    swaymsg fullscreen
    sleep 0.1
    grim -g "$(slurp)" "$screenshot_path"
    kill -9 "$pid" || true;
    rm "$temp_file"
}

notify() {
	notify-send 'Screenshot taken' "Saved as '$screenshot_path'" -i "$screenshot_path" \
        -a 'grim' -t 5000 \
        -A 'copy=Copy' -A "view=View" -A "delete=Delete"
}

case "$1" in
area)   grim -g "$(slurp)" "$screenshot_path" ;;
window) grim -g "$(pick_window)" "$screenshot_path" ;;
freeze) freeze ;;
*)      grim -c "$screenshot_path" ;;
esac || {
    notify-send "Error while taking a screenshot"
    exit 1
}

action="$(notify)"
if [[ "$action" == "copy" ]]; then
    mime_type="$(xdg-mime query filetype "$screenshot_path")"
    wl-copy -t "$mime_type" < "$screenshot_path"
elif [[ "$action" == "view" ]]; then
    xdg-open "$screenshot_path"
elif [[ "$action" == "delete" ]]; then
    rm "$screenshot_path"
fi
