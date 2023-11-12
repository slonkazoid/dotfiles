#!/usr/bin/env bash

# long live avt

video_path="${1:-$HOME/Desktop/"$(date '+%Y-%m-%d %H-%M-%S')".mkv}"

notify_end() {
	image_path="/tmp/thumb_$(basename "${video_path}")_$RANDOM.png"
	if ffmpeg -hide_banner -i "${video_path}" -frames:v 1 "${image_path}" &>/dev/null
	then could_make_image=
	else echo "error while making thumbnail" >&2
	fi

	case "$(
	notify-send 'Video recorded' "Saved to '${video_path}'" \
		${could_make_image+-i "${image_path}"} \
		-a 'wf-recorder' -t 5000 -w \
		-A "view=View" -A "delete=Delete" \
	)" in
	view)
		xdg-open "${video_path}"
		;;
	delete)
		rm "${video_path}"
		;;
	esac
	rm "${image_path}"
	echo "${video_path}"
}

findmonitor() {
	echo "$(pactl list cards | grep -oPm1 'Name: \K[^\s]+').monitor"
}

wf-recorder \
	-x rgb24 -c libx264rgb \
	-p crf=14 -p level=5.2 -p preset=veryfast -p profile=high444 \
	-f "${video_path}" >&2 && notify_end || exit $? &

pid=$!

notify-send "Recording screen" "Recording video to '${video_path}'"

kill -0 $pid 2>/dev/null && wait $pid
