#!/bin/sh
list=$(ls $HOME/.config/i3/scripts/autostart.d/*.sh | sort -n)
while IFS= read -r script; do
    echo "Running $script"
    bash -c "$script"
    if [ "$?" != "0" ] ; then
        i3-nagbar -m "Error starting '$script'!" & sleep 5s && kill $! &
        echo "Error starting '$script'!" >&2
    fi
done <<< "$list"

echo "Done"

