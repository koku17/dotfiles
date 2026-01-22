#! /bin/bash

TEMPERATURE=$(hyprctl hyprsunset temperature)

if [[ $1 = "toggle" ]]; then
	if [ $TEMPERATURE = "6000" ]; then
		hyprctl hyprsunset temperature 4500 1>&2> /dev/null
	else
		hyprctl hyprsunset temperature 6000 1>&2> /dev/null
	fi
fi

if [[ $1 = "+" ]]; then
	UP=$(( TEMPERATURE + 500 ))
	if [[ $UP -le 10000 ]]; then
		hyprctl hyprsunset temperature $UP 1>&2> /dev/null
	else
		hyprctl hyprsunset temperature 10000 1>&2> /dev/null
	fi
elif [[ $1 = "-" ]]; then
	DOWN=$(( TEMPERATURE - 500 ))
	if [[ $DOWN -ge 1000 ]]; then
		hyprctl hyprsunset temperature $DOWN 1>&2> /dev/null
	else
		hyprctl hyprsunset temperature 1000 1>&2> /dev/null
	fi
fi

STATUS=$(( $TEMPERATURE / 1000 ))
case $STATUS in
	1)
		printf "󰛨"
	;;
	2)
		printf "󱩖"
	;;
	3)
		printf "󱩕"
	;;
	4)
		printf "󱩔"
	;;
	5)
		printf "󱩓"
	;;
	6)
		printf "󱩒"
	;;
	7)
		printf "󱩑"
	;;
	8)
		printf "󱩐"
	;;
	9)
		printf "󱩏"
	;;
	10)
		printf "󱩎"
esac

printf "  $(qalc -t "$TEMPERATURE / 1000")k"
