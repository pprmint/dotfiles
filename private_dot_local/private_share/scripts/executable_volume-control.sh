#!/bin/sh
update_volume() {
    current_volume=$(ponymix get-volume)
}

is_muted=$(wpctl get-volume @DEFAULT_SINK@ | grep -q '\[MUTED\]'; echo $?)

mute_notification() {
    dunstify -a "Volume" -t 2000 -h string:x-canonical-private-synchronous:audio "Muted" -h int:value:"$current_volume" -i ~/.local/share/scripts/icons/volume_mute.svg -u critical
}

case "$1" in
    increase)
        update_volume
        if [ "$current_volume" -eq 100 ]; then
            if [ "$is_muted" -eq 0 ]; then
                mute_notification
            else
                dunstify -a "Volume" -t 2000 -h string:x-canonical-private-synchronous:audio "$current_volume%" -h int:value:"$current_volume" -i ~/.local/share/scripts/icons/volume_up.svg
            fi
        else
            wpctl set-volume @DEFAULT_AUDIO_SINK@ "0.05+"
            if [ "$is_muted" -eq 0 ]; then
                mute_notification
                update_volume
            else
                update_volume
                dunstify -a "Volume" -t 2000 -h string:x-canonical-private-synchronous:audio "$current_volume%" -h int:value:"$current_volume" -i ~/.local/share/scripts/icons/volume_up.svg
                paplay ~/.local/share/scripts/sounds/Asterisk.wav
            fi
        fi
        ;;
    decrease)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ "0.05-"
        update_volume
        if [ "$is_muted" -eq 0 ]; then
            mute_notification
        else
            dunstify -a "Volume" -t 2000 -h string:x-canonical-private-synchronous:audio "$current_volume%" -h int:value:"$current_volume" -i ~/.local/share/scripts/icons/volume_down.svg
            paplay ~/.local/share/scripts/sounds/Asterisk.wav
        fi
        ;;
    toggle-mute)
        if [ "$is_muted" -eq 0 ]; then
            wpctl set-mute @DEFAULT_SINK@ 0
            update_volume
            dunstify -a "Volume" -t 2000 -h string:x-canonical-private-synchronous:audio "$current_volume%" -h int:value:"$current_volume" -i ~/.local/share/scripts/icons/volume_up.svg
            paplay ~/.local/share/scripts/sounds/Asterisk.wav
        else
            wpctl set-mute @DEFAULT_SINK@ 1
            update_volume
            dunstify -a "Volume" -t 2000 -h string:x-canonical-private-synchronous:audio "Muted" -h int:value:"$current_volume" -i ~/.local/share/scripts/icons/volume_mute.svg -u critical
        fi
        ;;
    *)
        echo "Usage: $0 {increase|decrease|toggle-mute}"
        exit 1
        ;;
esac