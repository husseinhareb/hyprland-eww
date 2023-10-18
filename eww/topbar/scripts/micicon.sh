#!/bin/bash

mic_source=$(pactl info | grep "Default Source:" | awk '{print $3}')


# Get the microphone status (mute/unmute)
mic_status=$(pactl list sources | awk -v mic_source="$mic_source" '/^Source/ {in_source=0} $0 ~ ("Name: " mic_source) {in_source=1} in_source && /Mute:/ {print $2}')


if [ "$mic_status" == "yes" ]; then
   echo "/home/shtam/.config/eww/topbar/images/icons/audio/mute-mic.png"
else
   echo "/home/shtam/.config/eww/topbar/images/icons/audio/mic.png"
fi
