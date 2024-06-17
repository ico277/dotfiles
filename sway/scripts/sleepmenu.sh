#!/bin/sh

# Check if system uses systemd or elogind
if command -v systemctl > /dev/null; then
    SLEEP_CMD="systemctl"
elif command -v loginctl > /dev/null; then
    SLEEP_CMD="loginctl"
else
    notify-send "No compatible init system found (systemd or elogind required)."
    exit 1
fi

# Options for bemenu
options="$(printf "suspend\nhibernate\npoweroff\nreboot")"

# Display menu and capture selection
selection="$(bemenu --prompt "sleep ->" <<< $options)"

# Execute the selected command
case $selection in
    suspend)
        $SLEEP_CMD suspend
        ;;
    hibernate)
        $SLEEP_CMD hibernate
        ;;
    poweroff)
        $SLEEP_CMD poweroff
        ;;
    reboot)
        $SLEEP_CMD reboot
        ;;
    *)
        notify-send "Invalid selection"
        exit 1
        ;;
esac

