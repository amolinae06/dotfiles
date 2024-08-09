#!/bin/sh

. "${HOME}/.cache/wal/colors.sh"

cfgfile="${HOME}/.config/mako/config"

# Associative array, color name -> color code.
declare -A colors
colors=(
    ["background-color"]="$color0"
    ["text-color"]="$foreground"
    ["border-color"]="$color1"
)

for color_name in "${!colors[@]}"; do
  # replace first occurance of each color in config file
  sed -i "0,/^$color_name.*/{s//$color_name=${colors[$color_name]}/}" $cfgfile
done

makoctl reload
