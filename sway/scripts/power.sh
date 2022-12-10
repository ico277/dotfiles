#!/bin/sh

file="/etc/default/cpupower"
while IFS="=" read -r key value; do
    case "$key" in
    '#'*) ;;
    *)
        eval "$key=\"$value\""
    esac
done < "$file"

if [ "$1" == "battery" ] ; then
    pkexec sh -c "cpupower frequency-set --min $min_freq --max $max_freq -g $governor && cpupower set --perf-bias $perf_bias"
    notify-send -i battery --app-name "$0" "Changed power mode to '$1'"
elif [ "$1" == "performance" ] ; then
    #pkexec cpupower frequency-set --min 800ghz --max 3.5ghz #-g performance
    pkexec sh -c "pkexec cpupower frequency-set --min 800mhz --max 3.5ghz -g performance && cpupower set --perf-bias 4"
    notify-send -i battery --app-name "$0" "Changed power mode to '$1'"
elif [ "$1" == "absolute_performance" ] ; then
    #pkexec cpupower frequency-set --min 800ghz --max 3.5ghz #-g performance
    pkexec sh -c "pkexec cpupower frequency-set --min 800mhz --max 3.5ghz -g performance && cpupower set --perf-bias 0"
    notify-send -i battery --app-name "$0" "Changed power mode to '$1'"
elif [ "$1" == "powersave" ] ; then
    #pkexec cpupower frequency-set --min 500ghz --max 2.5ghz #-g powersave
    pkexec sh -c "pkexec cpupower frequency-set --min 500mhz --max 2.5ghz -g powersave && cpupower set --perf-bias 15"
    notify-send -i battery --app-name "$0" "Changed power mode to '$1'"
fi
