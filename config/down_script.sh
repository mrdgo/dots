#!/usr/bin/env bash

# rofi-power
# Use rofi to call systemctl for shutdown, reboot, etc

# 2016 Oliver Kraitschy - http://okraits.de

OPTIONS=" Lock\n Logout\n Reboot system\n Power-off system"

# source configuration or use default values
if [ -f $HOME/.config/rofi-power/config ]; then
  source $HOME/.config/rofi-power/config
else
  LAUNCHER="rofi -width 30 -theme gruvbox-down -dmenu -i -p rofi-power"
  USE_LOCKER="false"
  LOCKER="/home/maxim/.config/blurlock"
fi

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
        /home/maxim/.config/blurlock
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
