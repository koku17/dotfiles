#! /bin/bashl

get_temp () {
	hyprctl hyprsunset temperature
}

set_temp () {
	hyprctl hyprsunset temperature $1
}

if [[ $1 = "toggle" ]]; then
	if [ $(get_temp) -gt 4500 ]; then
		set_temp 4500 1>&2> /dev/null
	else
		set_temp 6000 1>&2> /dev/null
	fi
fi

if [[ $1 = "+" ]]; then
	TEMPERATURE=$(( $(get_temp) + 500 ))
	if [[ $TEMPERATURE -le 10000 ]]; then
		set_temp $TEMPERATURE 1>&2> /dev/null
	else
		set_temp 10000 1>&2> /dev/null
	fi
elif [[ $1 = "-" ]]; then
	TEMPERATURE=$(( $(get_temp) - 500 ))
	if [[ $TEMPERATURE -ge 1000 ]]; then
		set_temp $TEMPERATURE 1>&2> /dev/null
	else
		set_temp 1000 1>&2> /dev/null
	fi
fi

TEMPERATURE=$(get_temp)
STATUS=$(( TEMPERATURE / 1000 ))
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

printf "  $(qalc -t "$(get_temp) / 1000")k"
