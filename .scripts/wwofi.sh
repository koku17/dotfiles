#! /bin/sh

pkill nmcli ; pkill nmtui # kill any fucking nmcli or nmtui process that interfears with
PASS=0

for status in $(nmcli --color no -t r w)
do
	if [[ $status == "enabled" ]]; then
		PASS=1
		break;
	fi
done

if [[ $PASS -eq 0 ]]; then
	notify-send Wifi "Wifi turned off !"
	exit 0;
fi

nmcli -g SSID --colors no d w l | grep -vE "^$" > /tmp/wifi-ssid
SSID=$(cat /tmp/wifi-ssid | wofi -d -p "Wifi Networks")
WIFI_SSID=$SSID
ASK=0

if [ -n "$WIFI_SSID" ]; then
	nmcli d w c "$WIFI_SSID" && notify-send Wifi "Connected to $WIFI_SSID" || ASK=1
fi

if [[ $ASK -eq 1 ]]; then
	WIFI_PSK="$(wofi -d -p "Enter Password for $WIFI_SSID" -P -H 5 -W 35%)"
	[ -z $WIFI_PSK ] && notify-send Wifi "Empty Password" && exit 0
	echo "$WIFI_PSK" | nmcli d w c "$WIFI_SSID" --ask && notify-send Wifi "Connected to $WIFI_SSID" || notify-send -u critical Wifi "Couldn't connect to $WIFI_SSID"
fi

[ -f /tmp/wifi-ssid ] && rm -rf /tmp/wifi-ssid
