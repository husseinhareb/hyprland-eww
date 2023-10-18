#!/bin/bash

if [[ "$1" == "--kitty" ]]; then
	kitty &

elif [[ "$1" == "--htop" ]]; then
	htop &

elif [[ "$1" == "--thunar" ]]; then
	thunar ~ &

elif [[ "$1" == "--discord" ]]; then
	discord &


elif [[ "$1" == "--obsidian" ]]; then
	obsidian &


elif [[ "$1" == "--torrent" ]]; then
	qbittorrent &
	
elif [[ "$1" == "--notion" ]]; then
	notion-app &
	
elif [[ "$1" == "--obs" ]]; then
	obs &
elif [[ "$1" == "--android" ]]; then
	android-studio &
fi
