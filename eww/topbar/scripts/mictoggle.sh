#!/bin/bash

# Get the current microphone status
mic_status=$(pactl list sources | awk -v mic_source="$mic_source" '/^Source/ {in_source=0} $0 ~ ("Name: " mic_source) {in_source=1} in_source && /Mute:/ {print $2}')
mic_status="${mic_status:3}"
echo $mic_status
# Check if the microphone is muted and toggle its status
if [ "$mic_status" == "yes" ]; then
  pactl set-source-mute @DEFAULT_SOURCE@ 0
  echo "Microphone unmuted"
else
  pactl set-source-mute @DEFAULT_SOURCE@ 1
  echo "Microphone muted"
fi
