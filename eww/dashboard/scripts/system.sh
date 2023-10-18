#!/bin/bash
if [ "$1" == "brightness" ]; then
    brightness=$(brightnessctl g)
    brightness_percent=$(echo "scale=2; $brightness / 26666 * 100" | bc)
    rounded_brightness_percent=$(printf "%.0f" "$brightness_percent")
    echo "$rounded_brightness_percent"


elif [ "$1" == "volume" ]; then
    if command -v pactl &>/dev/null; then
        if pactl list sinks | grep -q 'Mute: yes'; then
            echo 0
        else
            volume=$(pactl list sinks | grep -A 10 "State: RUNNING" | grep 'Volume:' | awk '{print $5}' | cut -d '%' -f1)
            echo "${volume:0:3}"
        fi
    fi

elif [ "$1" == "mic" ]; then
    mic_level=$(pactl list sources | grep 'Volume:' | awk -F/ '{print $2}' | awk '{print $1}' | head -n 3 | tail -n 1)
    echo "${mic_level%\%}"
fi
