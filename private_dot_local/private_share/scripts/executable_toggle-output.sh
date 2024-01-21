#!/bin/sh

# Names of sinks for speakers and headphones. (List with `pactl list sinks short`)
speakers="alsa_output.pci-0000_2a_00.4.2.analog-stereo"
headphones="alsa_output.pci-0000_27_00.1.3.hdmi-stereo-extra3"

# Get current default sink.
current_sink=$(pactl get-default-sink)

# Toggle between the two sinks.
if [ "$current_sink" == "$speakers" ]; then
    pactl set-default-sink "$headphones"
    dunstify -a "Audio output" -t 2000 -h string:x-canonical-private-synchronous:sink "Headphones" -i ~/.local/share/scripts/icons/headphones.svg
else
    pactl set-default-sink "$speakers"
    dunstify -a "Audio output" -t 2000 -h string:x-canonical-private-synchronous:sink "Speakers" -i ~/.local/share/scripts/icons/speaker.svg
fi
