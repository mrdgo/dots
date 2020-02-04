#!/usr/bin/env bash

# rofi-power
# Use rofi to call systemctl for shutdown, reboot, etc

# 2016 Oliver Kraitschy - http://okraits.de

OPTIONS=" Lock\n Logout\n Reboot system\n Power-off system"

LAUNCHER="rofi -width 30 -theme gruvbox-dark-soft -dmenu -i -p rofi-power"
USE_LOCKER="false"
LOCKER="/home/maxim/.config/blurlock"

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
        $LOCKER
        ;;
      Logout)
        xdotool keydown super keydown shift key e keyup super keyup shift
        ;;
      Reboot)
        systemctl reboot
        ;;
      Power-off)
        systemctl poweroff
        ;;
    esac
fi
