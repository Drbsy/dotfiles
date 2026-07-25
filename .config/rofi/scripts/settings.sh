#!/usr/bin/env bash

uptime=$(uptime -p | sed -e 's/up //g')

theme="$HOME/.config/rofi/raci/settings.rasi"
wallpaper_mgr="$HOME/.config/rofi/scripts/wallpaper.sh"

rofi_cmd() {
    rofi -dmenu \
        -i \
        -p "Settings:" \
        -mesg "Uptime: $uptime" \
        -theme "$theme"
}

options="WallPaper\nWi-Fi\nBluetooth\nAudio"

chosen=$(echo -e "$options" | rofi_cmd)

case "$chosen" in
    "Wi-Fi")
        nm-connection-editor &
        ;;
    "Bluetooth")
        blueman-manager &
        ;;
    "Audio")
        pavucontrol &
        ;;
    "WallPaper")
        "$wallpaper_mgr" &
        ;;
esac