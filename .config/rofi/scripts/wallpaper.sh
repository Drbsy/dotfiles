#!/usr/bin/env bash

set -euo pipefail

wallpaper_dir="$HOME/Pictures/Wallpapers"
preview_img_cache="$HOME/.cache/rofi-wallpapers"
thumb_dir="$preview_img_cache/thumbs"
list_file="$preview_img_cache/list"
theme="$HOME/.config/rofi/raci/wallpaper.rasi"

mkdir -p "$thumb_dir"

find "$wallpaper_dir" -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) -print0 |
xargs -0 -n 1 -P "$(nproc)" bash -c '
    thumb_dir="$1"
    img="$2"
    filename="${img##*/}"
    thumb="$thumb_dir/${filename}.png"

    if [[ ! -f "$thumb" ]] || [[ "$img" -nt "$thumb" ]]; then
        if [[ "${img,,}" == *.gif ]]; then
            magick "${img}[0]" -thumbnail 320x180^ -gravity center -extent 320x180 \
                -fill "rgba(0, 0, 0, 0.65)" -draw "roundrectangle 280,150 312,172 4,4" \
                -fill "white" -draw "polygon 291,155 291,167 301,161" \
                "$thumb"
        else
            magick "${img}[0]" -thumbnail 320x180^ -gravity center -extent 320x180 "$thumb"
        fi
    fi
' _ "$thumb_dir"

find "$wallpaper_dir" -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) |
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
