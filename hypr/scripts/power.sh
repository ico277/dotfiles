#!/bin/sh

profile="$1"
if [ ! "$profile" ] ; then
    profile="$(printf "performance\nbalanced\npower-saver" | bemenu)"
fi
cmd="powerprofilesctl set $profile"
$cmd
if [ ! "$?" == "0" ] ; then
    notify-send "Error running '$cmd'!"
    if [ "$2" == "1" ] ; then
        pkexec systemctl restart power-profiles-daemon
        $cmd
    fi
else
    notify-send "Power profile succsessfully set to '$profile'!"
fi
