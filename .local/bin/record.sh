#!/usr/bin/env bash

# long live avt

set -e

video_path="${1:-$HOME/Desktop/"$(date '+%Y-%m-%d %H-%M-%S')".mkv}"
thumbnail_path="/tmp/thumb_$(basename "${video_path}")_$RANDOM.png"

generate_thumbnail() {
	ffmpeg -hide_banner -i "$1" -frames:v 1 "$2" &>/dev/null
}

notify() {
	local thumbnail
	generate_thumbnail "$video_path" "$thumbnail_path" &&
		thumbnail=1 ||
		echo "error while making thumbnail" >&2

	notify-send 'Video recorded' "Saved to '${video_path}'" \
		${thumbnail:+-i "$thumbnail_path"} \
		-a 'wf-recorder' -t 5000 -w \
		-A "view=View" -A "delete=Delete"

	[[ "$thumbnail" == 1 ]] && rm "$thumbnail_path"
}

notify-send "Recording screen" "Recording video to '${video_path}'" &

wf-recorder \
	-x rgb24 -c libx264rgb \
	-p crf=10 -p level=5.2 -p preset=veryfast -p profile=high444 \
	-f "$video_path" >&2 || {
	notify-send "Couldn't record screen" "wf-recorder exited with code $?" &
	exit 1
}

echo "$video_path"

case "$(notify)" in
view) xdg-open "$video_path" ;;
delete)	rm "$video_path" ;;
esac
