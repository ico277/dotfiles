#!/bin/bash

# check if tint2 is running
if ps aux | grep "tint2" | grep -v "grep" | grep -v "/bin/sh"; then
    # kill tint2
    killall -e "tint2" -9
fi

# sleep for 1 second
sleep 1s

# Launch tint2
tint2 &
