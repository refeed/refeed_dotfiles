#!/bin/bash
# Script to send current volume notification to dunstify 
# need depencies pamixer, dunstify and canberra-gtk-play for sound
# add this script to you volume control bind
msgID="2345"
volume="$(pactl get-sink-volume @DEFAULT_SINK@ | grep Volume | tr -d ' ' | cut -d '/' -f 2 | sed 's/%//')"
 

# check volume
if [ "$volume" -gt "65" ]; then
	dunstify  "🔊 $volume" -t 800 -r $msgID -u low -h int:value:$volume
elif [ "$volume" == "0" ]; then
	dunstify  "🔈 Muted " -t 800 -r $msgID -u low -h int:value:$volume
else
	dunstify  "🔉 $volume" -t 800 -r $msgID -u low -h int:value:$volume
fi

# play sound
#canberra-gtk-play -i audio-volume-change -d "changeVolume"
