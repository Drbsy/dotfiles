#!/usr/bin/env bash


shutdown=''
reboot=''
lock=''
suspend=''
logout=''

yes=''
no=''

theme="$HOME/.config/rofi/raci/power_menu.rasi"

rofi_cmd() {
    rofi -dmenu \
        -p "Power" \
        -theme "$theme"
}

confirm_cmd() {
    rofi -dmenu \
        -p "Confirmation" \
        -mesg "Are you sure?" \
        -theme "$theme" \
        -theme-str '
            window {
                location: center;
                anchor: center;
                width: 350px;
            }

            mainbox {
                children: [ "message", "listview" ];
            }

            listview {
                columns: 2;
                lines: 1;
            }

            textbox {
                horizontal-align: 0.5;
            }

            element-text {
                horizontal-align: 0.5;
            }
        '
}

confirm_exit() {
    echo -e "$yes\n$no" | confirm_cmd
}
2560x1440
run_rofi() {
    echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

confirm_action() {
    [[ "$(confirm_exit)" == "$yes" ]]
}

case "$(run_rofi)" in
    "$shutdown")
        confirm_action && systemctl poweroff
        ;;

    "$reboot")
        confirm_action && systemctl reboot
        ;;

    "$lock")
        hyprlock
        ;;

    "$suspend")
        if confirm_action; then
            playerctl pause 2>/dev/null
            systemctl suspend
        fi
        ;;

    "$logout")
        confirm_action && hyprctl dispatch exit
        ;;
esac
