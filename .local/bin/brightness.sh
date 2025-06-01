#!/bin/bash

function send_notification() {
	brightness=$(brightnessctl get)

	dunstify -a "changebrightness" -u low -r "9993" -h int:value:"$brightness" "Brightness ${brightness}" -t 2000
}

case $1 in
up)
  brightnessctl -e set 5%+
	send_notification $1
	;;
down)
  brightnessctl -e set 5%-
	send_notification $1
	;;
esac
