#!/bin/bash

function send_notification() {
    current=$(brightnessctl g)
    max=$(brightnessctl m)
    percent=$(( 100 * current / max ))

    dunstify -a "changebrightness" \
        -u low \
        -r "9993" \
        -h int:value:"$percent" \
        "Brightness ${percent}%" \
        -t 2000
}

case $1 in
up)
    brightnessctl -e set 5%+
    send_notification
    ;;
down)
    brightnessctl -e set 5%-
    send_notification
    ;;
esac
