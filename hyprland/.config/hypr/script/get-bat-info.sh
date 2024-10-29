#!/bin/sh

IFS= read -r percentage </sys/class/power_supply/BAT0/capacity
IFS= read -r sts </sys/class/power_supply/BAT0/status

if [ "$sts" = "Charging" ]; then
    printf ""
elif [ "$percentage" -gt 79 ]; then
    printf " "
elif [ "$percentage" -gt 59 ]; then
    printf "  "
elif [ "$percentage" -gt 39 ]; then
    printf "  "
elif [ "$percentage" -gt 19 ]; then
    printf "  "
fi

printf "%s" "$percentage"
printf '%%\n'
