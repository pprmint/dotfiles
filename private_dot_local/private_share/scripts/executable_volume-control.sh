#!/bin/sh

# In case you wanna change the default increment for volume.
vol_increment=0.05

# My keyboard's volume knob is funny; It sends two keystrokes in quick succession when you turn it.
# This prevents the volume from changing too quickly.
last_execution_time=$(cat ~/.local/share/scripts/.volume-control-last 2>/dev/null || echo 0)
current_time=$(date +%s%3N)
time_since_last_execution=$((current_time - last_execution_time))
if [ "$time_since_last_execution" -lt 75 ]; then
    exit 0
fi
echo "$current_time" > ~/.local/share/scripts/.volume-control-last

# I use ponymix to show the current volume in dunstify.
update_volume() {
    current_volume=$(ponymix get-volume)
}

is_muted=$(wpctl get-volume @DEFAULT_SINK@ | grep -q '\[MUTED\]'; echo $?)

vol_up_notification() {
    dunstify -a "Volume" -t 2000 -h string:x-canonical-private-synchronous:volume "$current_volume%" -h int:value:"$current_volume" -i ~/.local/share/scripts/icons/volume_up.svg
}

vol_down_notification() {
    dunstify -a "Volume" -t 2000 -h string:x-canonical-private-synchronous:volume "$current_volume%" -h int:value:"$current_volume" -i ~/.local/share/scripts/icons/volume_up.svg
}

mute_notification() {
    dunstify -a "Volume" -t 2000 -h string:x-canonical-private-synchronous:volume "Muted" -h int:value:"$current_volume" -i ~/.local/share/scripts/icons/volume_mute.svg -u critical
}

case "$1" in
    increase)
        update_volume
        # Don't wanna go above 100% and blow my speakers, headphones and/or my head up.
        if [ "$current_volume" -eq 100 ]; then
            if [ "$is_muted" -eq 0 ]; then
                mute_notification
            else
                vol_up_notification
            fi
        else
            wpctl set-volume @DEFAULT_AUDIO_SINK@ "$vol_increment+"
            if [ "$is_muted" -eq 0 ]; then
                mute_notification
                update_volume
            else
                update_volume
                vol_up_notification
                paplay ~/.local/share/scripts/sounds/Asterisk.wav
            fi
        fi
    ;;
    decrease)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ "$vol_increment-"
        update_volume
        if [ "$is_muted" -eq 0 ]; then
            mute_notification
        else
            vol_down_notification
            paplay ~/.local/share/scripts/sounds/Asterisk.wav
        fi
    ;;
    toggle-mute)
        if [ "$is_muted" -eq 0 ]; then
            wpctl set-mute @DEFAULT_SINK@ 0
            update_volume
            vol_up_notification
            paplay ~/.local/share/scripts/sounds/Asterisk.wav
        else
            wpctl set-mute @DEFAULT_SINK@ 1
            update_volume
            mute_notification
        fi
    ;;
    *)
        echo "Usage: $0 {increase|decrease|toggle-mute}"
        exit 1
    ;;
esac
