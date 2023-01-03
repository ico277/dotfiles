#!/bin/sh
SCRIPT_PATH="$HOME/.config/sway/scripts/"
# get script
line=$(bemenu <<< "$(ls $SCRIPT_PATH)")
if [ ! $line ] ; then
    exit
fi
# exec script
echo exec sh -c \"$SCRIPT_PATH/$line\"
exec sh -c "$SCRIPT_PATH/$line"
