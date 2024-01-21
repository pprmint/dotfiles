#!/bin/sh
update_brightness() {
    current_brightness=$(busctl --user -- get-property rs.wl-gammarelay / rs.wl.gammarelay Brightness)
    current_brightness=${current_brightness:2}
    current_brightness=$(awk -v current_brightness="$current_brightness" 'BEGIN { printf "%.0f", current_brightness * 100 }')
}

case "$1" in
    increase)
        busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateBrightness d +0.05
        update_brightness
        dunstify -a "Brightness" -t 2000 -h string:x-canonical-private-synchronous:brightness "$current_brightness%" -h int:value:"$current_brightness" -i ~/.local/share/scripts/icons/brightness_max.svg
        ;;
    decrease)
        busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateBrightness d -0.05
        update_brightness
        dunstify -a "Brightness" -t 2000 -h string:x-canonical-private-synchronous:brightness "$current_brightness%" -h int:value:"$current_brightness" -i ~/.local/share/scripts/icons/brightness_min.svg
        ;;
    reset)
        busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Brightness d 1
        update_brightness
        dunstify -a "Brightness" -t 2000 -h string:x-canonical-private-synchronous:brightness "Reset to 100%" -h int:value:"$current_brightness" -i ~/.local/share/scripts/icons/reset.svg
        ;;
    *)
esac