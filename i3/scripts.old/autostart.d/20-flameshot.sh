#!/bin/sh
# check if flameshot is running
if ps aux | grep "flameshot" | grep -v "grep" | grep -v "/bin/sh"; then
    killall -e "flameshot" -9
fi

# sleep for 1 second
sleep 1s

# launch flameshot tray
flameshot &
