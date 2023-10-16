#!/bin/bash

## Files and CMD
FILE="$HOME/.cache/eww_launch.dashboard"
CFG="$HOME/.config/eww/dashboard/"
EWW=`which eww`

## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	${EWW} daemon
	sleep 1
fi

## Open widgets 
run_eww() {
	${EWW} --config "$CFG" open-many \
		   date \
		   reddit \
		   telegram \
		   youtube \
		   github \
		   system \
		   weather \
		   apps \
		   time \
		   spotify \
		   logout \
		   sleep \
		   reboot \
		   resources \
		   poweroff \
		   profile
}

## Launch or close widgets accordingly
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	run_eww
else
	${EWW} --config "$CFG" close  date github reddit youtube telegram system apps time weather spotify profile poweroff resources reboot sleep reboot logout
	rm "$FILE"
fi
