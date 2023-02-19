#!/usr/bin/env bash

screenshot_path="$(xdg-user-dir PICTURES)/Screenshot_$(date +%Y%m%d_%H%M%S).png"

notify() {
    action="$(notify-send 'Screenshot taken' "Saved as '$screenshot_path'" -i "$screenshot_path" -a 'grim' -t 5000 -A 'copy=Copy' -A "view=View" -A "delete=Delete")"
    if [[ "$action" == "copy" ]]; then
        # shellcheck disable=SC2094
        wl-copy -t "$(xdg-mime query filetype "$screenshot_path")" < "$screenshot_path"
    elif [[ "$action" == "view" ]]; then
        xdg-open "$screenshot_path"
    elif [[ "$action" == "delete" ]]; then
        rm "$screenshot_path"
    fi
}

case "$1" in
area)
    area="$(slurp)" &&
        grim -g "$area" "$screenshot_path" && notify
    ;;

window)
    area="$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)" &&
        grim -g "$area" "$screenshot_path" && notify
    ;;

*)
    grim -c "$screenshot_path" && notify
    ;;
esac
