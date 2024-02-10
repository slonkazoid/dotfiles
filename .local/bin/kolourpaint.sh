#!/usr/bin/env bash

set -e

mime_type="$(wl-paste -l | grep -m 1 -oE '^(text/plain|image/.+)$')"
echo "mime type: $mime_type" >&2

case "$mime_type" in
text/plain) kolourpaint "$(wl-paste)" ;;
image/*)
	file="$(mktemp kolourpaint_sh-$(id -u)-XXXXXXXXXX)"
	wl-paste -t "$mime_type" > "$file"
	kolourpaint "$file" || :
	rm "$file"
	;;
esac
