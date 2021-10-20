#!/bin/bash
pgrep -l "picom"
if [ $? -eq "0" ]; then
    pkill -9 picom
else 
    picom --config $HOME/.config/picom/picom.conf &
fi
