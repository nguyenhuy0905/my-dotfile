#!/usr/bin/env bash

print_help() {
    cat << EOF
$0 [channel-tag]

    channel-tag: Without the leading @
        Eg. Extract channel ID from
        
        https://www.youtube.com/@TsodingDaily

        Then [channel-tag] is TsodingDaily
EOF
}

if [ -z "$1" ]; then
    print_help
    exit 1
fi

channel_tag="$1"
yt_url="https://www.youtube.com/@"
yt_url+=${channel_tag}

# curl "${yt_url}" | grep -Eo "\"externalId\":\"[a-zA-Z0-9]*\""
curl "${yt_url}" | grep -Eo '"externalId":"[a-zA-Z0-9_]*"' | sed -E 's/"externalId":"(.*)"/\1/g'
