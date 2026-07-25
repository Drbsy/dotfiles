#!/usr/bin/env bash

set -euo pipefail

wallpaper_dir="$HOME/Pictures/Wallpapers"
preview_img_cache="$HOME/.cache/rofi-wallpapers"
thumb_dir="$preview_img_cache/thumbs"
list_file="$preview_img_cache/list"
theme="$HOME/.config/rofi/raci/wallpaper.rasi"

mkdir -p "$thumb_dir"

find "$wallpaper_dir" -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -print0 |
xargs -0 -n 1 -P "$(nproc)" bash -c '
    thumb_dir="$1"
    img="$2"
    filename="${img##*/}"
    thumb="$thumb_dir/${filename}.png"

    if [[ ! -f "$thumb" ]] || [[ "$img" -nt "$thumb" ]]; then
        magick "$img" -thumbnail 320x180^ -gravity center -extent 320x180 "$thumb"
    fi
' _ "$thumb_dir"

find "$wallpaper_dir" -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) |
sort |
while IFS= read -r img; do
    filename="${img##*/}"
    printf "%s\0icon\x1f%s/%s.png\n" "$filename" "$thumb_dir" "$filename"
done > "$list_file"

chosen=$(
    rofi -dmenu \
         -i \
         -theme "$theme" \
         -p "Wallpaper" < "$list_file"
)

[[ -z "$chosen" ]] && exit 0

full_path=$(find "$wallpaper_dir" -type f -name "$chosen" | head -n 1)

awww img "$full_path" --transition-type random
wal -q -i "$full_path"
hyprctl reload