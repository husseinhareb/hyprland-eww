#!/bin/bash

# Send the "Next" command to Spotify
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next

echo "Played the next song on Spotify."
