#!/bin/bash
pactl set-sink-volume @DEFAULT_SINK@ ${1}5%
vol="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -m1 -Eo '[0-9]?[0-9]?[0-9]%' | head -n1 | tr -d %)"
if (( "$vol" >= "150" )); then
    pactl set-sink-volume @DEFAULT_SINK@ 150%
    notify-send "Max volume (150)"
fi
