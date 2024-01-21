#!/bin/sh
update_temperature() {
    current_temperature=$(busctl --user -- get-property rs.wl-gammarelay / rs.wl.gammarelay Temperature | awk '{print $2}')
}

case "$1" in
    increase)
        update_temperature
        if [ "$current_temperature" -lt 6500 ]; then
            busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n +250
            update_temperature
        fi
        dunstify -a "Temperature" -t 2000 -h string:x-canonical-private-synchronous:temperature "${current_temperature}K" -i ~/.local/share/scripts/icons/temp_down.svg
        ;;
    decrease)
        busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n -250
        update_temperature
        dunstify -a "Temperature" -t 2000 -h string:x-canonical-private-synchronous:temperature "${current_temperature}K" -i ~/.local/share/scripts/icons/temp_up.svg
        ;;
    reset)
        busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500
        update_temperature
        dunstify -a "Temperature" -t 2000 -h string:x-canonical-private-synchronous:temperature "Reset to 6500K" -i ~/.local/share/scripts/icons/reset.svg
        ;;
    *)
    echo "Usage: $0 {increase|decrease|reset}"
    ;;
esac