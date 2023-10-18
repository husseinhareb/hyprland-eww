#!/bin/bash

status=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:"org.mpris.MediaPlayer2.Player" string:"PlaybackStatus" 2>/dev/null | grep "string")
status="${status#*\"}"
status="${status%\"*}"

if [ -z "$status" ]; then
    echo "/home/shtam/.config/eww/topbar/images/icons/music/play-button.png"
elif [ "$status" == "Playing" ]; then
    echo "/home/shtam/.config/eww/topbar/images/icons/music/pause-button.png"
else
    echo "/home/shtam/.config/eww/topbar/images/icons/music/play-button.png"
fi
