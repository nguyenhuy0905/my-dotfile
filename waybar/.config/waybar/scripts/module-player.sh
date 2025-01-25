#!/bin/bash

if [[ ! $(playerctl status 2>/dev/null) ]]; then
    printf ""
    exit 0
fi

pst=$(playerctl status)

case "${pst}" in
    "Playing" ) printf "";;
    "Paused" ) printf "";;
esac

playerctl metadata --format " {{ artist }} - {{ title }} "
