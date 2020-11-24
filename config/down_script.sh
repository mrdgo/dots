#!/usr/bin/env bash

# rofi-power
# Use rofi to call systemctl for shutdown, reboot, etc

# 2016 Oliver Kraitschy - http://okraits.de

OPTIONS=" Lock\n Logout\n Reboot system\n Power-off system"

LAUNCHER="rofi -width 30 -theme gruvbox-down -dmenu -i -p rofi-power"

# Show exit wm option if exit command is provided as an argument
if [ ${#1} -gt 0 ]; then
  OPTIONS="$OPTIONS"
fi

option=`echo -e $OPTIONS | $LAUNCHER | awk '{print $2}' | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
    case $option in
      Lock)
        sleep 0.2
        slock
        ;;
      Logout)
        sudo pkill -u $USER
        ;;
      Reboot)
        doas reboot
        ;;
      Power-off)
        doas poweroff
        ;;
    esac
fi
