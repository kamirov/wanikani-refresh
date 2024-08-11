#!/bin/bash

# == Inputs
prefix=wanikani-wallpaper
output_dir="/path/to/output/dir"    
wanikani_api_token="<my-token>"     # Generate via WaniKani
device_num=1                        # Only change this if you're managing multiple wallpapers via the generator

# == Implementation

# Delete all previously downloaded wallpapers
if ls "$output_dir/$prefix"-* 1> /dev/null 2>&1; then
    echo "Deleting previous wallpapers from '$output_dir'..."
    rm "$output_dir/$prefix"-*
fi

datetime=$(date -u +"%Y-%m-%dT%H-%M-%SZ")
output_file="$prefix-$datetime.png"
user_agent="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36"
generator_url="http://wkw.natural20design.com/?k=$wanikani_api_token&d=$device_num"
full_output_path="$output_dir/$output_file"

# Fetch the wallpaper
curl -s -A "$user_agent" -o "$full_output_path" $generator_url

echo "Wallpaper saved to $full_output_path"
