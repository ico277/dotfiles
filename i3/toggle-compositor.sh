#!/bin/env bash
if [ $(ps -aux | grep [p]icom | wc -l) -eq "0" ]; then
	picom --config $HOME/.config/picom/picom.conf &
else 
	pkill -9 picom
fi
