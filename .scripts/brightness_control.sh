#!/bin/bash
MONITOR=$(hyprctl activeworkspace -j | jq -r '.monitor')
BRIGHTNESS=$1
LEVEL=$2

if [ $MONITOR = "eDP-1" ]; then
	brightnessctl set "$LEVEL%$BRIGHTNESS"
	VALUE=$(brightnessctl -d amdgpu_bl1 -m | cut -d "," -f 4)
	CURRENT=${VALUE::-1}
else
	ID=$(hyprctl activeworkspace -j | jq -r '.monitorID')
	ddcutil setvcp 10 $BRIGHTNESS $LEVEL --display $ID
	CURRENT=$(ddcutil -t getvcp 10 --display $ID | cut -d " " -f 4)
fi

if [[ $CURRENT -lt 50 ]]; then
	echo 
else
	echo 󰖨
fi
