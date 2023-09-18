#!/bin/sh
cmd="powerprofilesctl set $1"
$cmd
if [ ! "$?" == "0" ] ; then
    notify-send "Error running '$cmd'!"
    if [ "$2" == "1" ] ; then
        pkexec systemctl restart power-profiles-daemon
        $cmd
    fi
else
    notify-send "Power profile succsessfully set to '$1'!"
fi
