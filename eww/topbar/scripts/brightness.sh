#!/bin/bash

user_home="$HOME"


if [ "$1" == "icon" ]; then
    echo "$user_home/.config/eww/topbar/images/icons/brightness/brightness.png"
elif [ "$1" == "level" ]; then
    brightnessctl | grep Current | awk '{gsub(/[()%]/,"",$4); print $4}'
fi
