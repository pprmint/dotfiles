#!/bin/sh
color=$(hyprpicker -f hex -a)

temp_svg="$HOME/.local/share/scripts/icons/circle_temp.svg"
echo "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"40\" height=\"40\" viewBox=\"0 0 24 24\" fill=\"$color\" stroke=\"#eee\" stroke-width=\"1.5\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><circle cx=\"12\" cy=\"12\" r=\"10\" /></svg>" > $temp_svg

dunstify -a "Color picker" "$color" "Copied to the clipboard" -i $temp_svg
paplay "$HOME/.local/share/scripts/sounds/Success.wav"