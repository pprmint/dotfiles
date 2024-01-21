#!/bin/sh

# Only run if no other tofi processes are running.
if pgrep -x "tofi-drun" >/dev/null || pgrep -x "tofi" >/dev/null; then
    exit 0
else
    # Sound to make you aware of your surroundings and avoid unintentionally shutting down your puter.
    paplay ~/.local/share/scripts/sounds/Warning.wav &
    # Order: Shutdown, reboot, suspend, exit.
    options=("" "" "" "")

    selected_option=$(printf '%s\n' "${options[@]}" | tofi --font "lucide" --font-size 20 --prompt-text "" --height 70 --width 206 --corner-radius 35 --text-color "#eee4" --selection-color "#eee" --selection-background "#0000" --horizontal true --result-spacing 15 --text-cursor-corner-radius 0 --text-cursor-thickness 0 --prompt-padding 0 --padding-top 5 --padding-bottom 0 --padding-left 0 --padding-right 0)
    case $selected_option in
        "")
            shutdown now
            ;;
        "")
            reboot
            ;;
        "")
            systemctl suspend
            ;;
        "")
            hyprctl dispatch exit
            ;;
    esac
fi