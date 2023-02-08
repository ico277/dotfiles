#!/bin/sh
_picom() {
    picom --config $HOME/.config/picom/picom.conf
}

for arg in $@
do
    if [ "$arg" = "--last-state" ] ; then
        echo "test"
        state=`cat $HOME/.config/picom/.last_state`
	    if [ "$state" = "0" ] ; then
	        killall -e "picom" -9 || true
	    elif [ "$state" = "1" ] ; then
	        _picom &
	    fi
        exit 0
    fi
done

if [ "$(ps aux | awk '/picom/ {if ($11 ~ /^picom/) print $11}')" ]; then
    echo "0" > $HOME/.config/picom/.last_state
    killall -e "picom" -9 || true
else 
    echo "1" > $HOME/.config/picom/.last_state
    _picom &
fi
