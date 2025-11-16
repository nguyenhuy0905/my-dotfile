#!/usr/bin/env bash

print_help() {
    cat << EOF
Usage: $0 [OPTION...] CHANNEL-TAG

Prints out the channel ID of the YouTube channel given its tag name.
This script is orginally developed to extract channel ID for Newsboat.

If this script returns nothing and exits successfully, either the channel
tag is wrong, or the script is broken in some way.

CHANNEL-TAG: Without the leading @

    Eg. Extract channel ID from
    
    https://www.youtube.com/@TsodingDaily

    Then CHANNEL-TAG is TsodingDaily

Options:

    --help, -h: Print this thing

EOF
}

if [ -z "$1" ]; then
    print_help
    exit 1
fi

if [ "$1" = "-h" -o "$1" = "--help" ]; then
    print_help
    exit 0
fi

channel_tag="$1"
yt_url="https://www.youtube.com/@"
yt_url+=${channel_tag}

curl "${yt_url}" | grep -Eo '"externalId":"[a-zA-Z0-9_]*"' | sed -E 's/"externalId":"(.*)"/\1/g'
