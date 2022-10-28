#!/bin/bash
for arg in $@
do
    if [ "$arg" = "--last-state" ] ; then
        echo "test"
        state=`cat $HOME/.config/picom/.last_state`
	    if [ "$state" = "0" ] ; then
	        killall -e "picom" -9
	    elif [ "$state" = "1" ] ; then
	        picom --config $HOME/.config/picom/picom.conf --experimental-backends &
	    fi
        exit 0
    fi
done

if ps aux | grep "picom" | grep -v "grep" | grep -v "bash"; then
    echo "0" > $HOME/.config/picom/.last_state
    pkill -9 picom
else 
    echo "1" > $HOME/.config/picom/.last_state
    picom --config $HOME/.config/picom/picom.conf --experimental-backends &
fi
