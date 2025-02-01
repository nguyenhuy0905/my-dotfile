#!/bin/bash

pst=$(playerctl status 2>/dev/null)

if [[ ! $? ]]; then
    printf "NOO"
    exit 0
fi

pmtd='playerctl metadata --format " {{ artist }} - {{ title }} "'

case "${pst}" in
    "Playing" ) printf "" && eval "$pmtd";;
    "Paused" ) printf "" && eval "$pmtd";;
    "Stopped" ) printf "";;
esac
