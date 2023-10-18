#!/bin/bash

mic_source=$(pactl info | grep "Default Source:" | awk '{print $3}')


mic_volume=$(pactl list sources | awk -v mic_source="$mic_source" '/^Source/ {in_source=0} $0 ~ ("Name: " mic_source) {in_source=1} in_source && /Volume:/ {print $5}')

# Convert the volume to percentage
mic_percentage=$(awk -v volume="$mic_volume" 'BEGIN {split(volume, a, "%"); print a[1]}')

echo $mic_percentage%