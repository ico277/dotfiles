#!/bin/bash
flameshot &
nm-applet &
blueberry-tray &
#feh --bg-fill --randomize $HOME/.config/wallpapers/* &
feh --bg-fill $HOME/.config/wallpapers/megumin.jpg & 
/usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/lib/xfce-polkit/xfce-polkit &
picom --config $HOME/.config/picom/picom.conf &
~/screen_conf.sh &
