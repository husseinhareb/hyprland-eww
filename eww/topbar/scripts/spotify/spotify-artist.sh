#!/bin/bash

if ! command -v playerctl &> /dev/null; then
    echo "playerctl is not installed."
    exit 1
fi

get_spotify_song_linux() {
  playerctl -p spotify metadata --format "{{ artist }}"
}

if pgrep -x "spotify" > /dev/null; then
  song=$(get_spotify_song_linux)

  if [[ -n "$song" ]]; then
      if [ ${#song} -gt 30 ]; then
      song="${song:0:30}..."
    fi
    echo "$song"
  else
    echo "Paused."
  fi
else
  echo "Offline."
fi
