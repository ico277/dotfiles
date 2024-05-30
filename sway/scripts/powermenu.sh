#!/bin/sh
# function to run command as root using sudo password
function SUDO() {
    sudo -S $@ <<< "$pw"
}

# get sudo password using bemenu and check if password is correct
pw="$(bemenu --password indicator --prompt "sudo password: " <<< "")" 
SUDO whoami
if [ "$?" != "0" ] ; then
    notify-send "Error: could not authenticate using sudo!"
    exit 1
fi

current="$(SUDO auto-ryzenadjctl status | grep "profile" | awk -F " -> " '{print $2}')"
profiles="$(SUDO auto-ryzenadjctl profiles | awk -F ":" '{print $1}')"
selection="$(bemenu --prompt "$current ->" <<< $profiles)"

SUDO auto-ryzenadjctl set profile $selection
sleep 1
current="$(SUDO auto-ryzenadjctl status | grep "profile" | awk -F " -> " '{print $2}')"
notify-send "Set ryzenadj profile to $current!"

