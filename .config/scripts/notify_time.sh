#!/bin/bash

export DISPLAY=":0"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"
notify-send "Current Time" "$(date +"%-I:%M%p")" -t 15000
paplay /home/badtz/.config/scripts/gong.ogg --volume 32536
