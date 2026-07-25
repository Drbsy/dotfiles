#!/bin/bash

theme="$HOME/.config/rofi/raci/clipboard.rasi"

selected=$(cliphist list | rofi -dmenu \
    -theme "$theme" \
    -p "Clipboard" \
    -kb-custom-1 "Control-Delete")

exit_code=$?

if [ $exit_code -eq 10 ]; then
    cliphist wipe
    notify-send "Clipboard" "History cleared successfully."
    exit 0
fi

if [ $exit_code -eq 0 ] && [ -n "$selected" ]; then
    echo "$selected" | cliphist decode | wl-copy
fi