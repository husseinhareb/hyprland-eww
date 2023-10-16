#!/bin/bash

# Define the base directory
base_dir="/home/shtam/.config/eww/topbar/scripts/spotify/"

# Function to extract the album art URL from the metadata
get_album_art_url() {
    dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:"org.mpris.MediaPlayer2.Player" string:"Metadata" | \
    grep -A 1 "string \"mpris:artUrl\"" | \
    tail -n 1 | \
    cut -d '"' -f 2
}

# Function to get the song name
get_song_name() {
    dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:"org.mpris.MediaPlayer2.Player" string:"Metadata" | \
    grep -A 1 "string \"xesam:title\"" | \
    tail -n 1 | \
    cut -d '"' -f 2
}

# Check if Spotify is running
if dbus-send --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Peer.Ping 2>/dev/null; then
    # Get album art URL using D-Bus
    album_art_url=$(get_album_art_url)
    
    if [ -n "$album_art_url" ]; then
        # Get the current song name
        song_name=$(get_song_name)

        if [ -n "$song_name" ]; then
            # Read the previously stored song name from a file
            previous_song_name=$(cat "${base_dir}spotify_song_name.txt" 2>/dev/null)

            # Compare the current song name with the previously stored one
            if [ "$song_name" != "$previous_song_name" ]; then
                # Remove old album art file if it exists
                rm -f "${base_dir}image.jpg"

                # Extract the track ID from the album art URL to uniquely identify the song
                track_id=$(echo "$album_art_url" | awk -F'/' '{print $(NF-1)}')

                # Download the album art for the current song as "image.jpg"
                wget -q -O "${base_dir}image.jpg" "$album_art_url"

                # Update the stored song name
                echo "$song_name" > "${base_dir}spotify_song_name.txt"
            fi
        fi
    fi
fi
echo "/home/shtam/.config/eww/topbar/scripts/spotify/image.jpg"