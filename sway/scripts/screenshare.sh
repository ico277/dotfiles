#!/bin/bash
set -x

geometry(){
	windowGeometries=$(
		swaymsg -t get_workspaces -r | jq -r '.[] | select(.focused) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'; \
		swaymsg -t get_outputs -r | jq -r '.[] | select(.active) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'
	)
	geometry=$(slurp -d <<< "$windowGeometries") || exit $?
	echo $geometry
}

# Ensure we're not using the wayland backend on SDL
unset SDL_VIDEODRIVER

geometry=$(geometry) || exit $?
wf-recorder -c rawvideo --geometry="$geometry" -m sdl -f pipe:wayland-mirror

