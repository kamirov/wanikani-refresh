#!/bin/bash

# == Inputs
prefix=wanikani-wallpaper
wanikani_api_token="<YOUR_API_KEY>"    # Generate this via WaniKani
device_num=1                         # Only change this if you're managing multiple wallpapers via the generator

# == Implementation

# Delete all previously downloaded wallpapers
if ls "$(dirname "$0")"/$prefix-* 1> /dev/null 2>&1; then
    echo "Deleting previous wallpapers..."
    rm "$(dirname "$0")"/$prefix-*
fi

datetime=$(date -u +"%Y-%m-%dT%H-%M-%SZ")
output_file="$prefix-$datetime.png"
user_agent="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36"
generator_url="http://wkw.natural20design.com/?k=$wanikani_api_token&d=$device_num"

# Fetch the wallpaper
curl -s -A "$user_agent" -o "$(dirname "$0")/$output_file" $generator_url

echo "Wallpaper saved to $output_file"
