#!/bin/sh

# Go into desktop mode if possible
hdmi_state=`xrandr -q | awk '/HDMI-1/{print $2}'`
if [ $hdmi_state = "connected" ]; then
    xrandr --output eDP-1 --off --output HDMI-1 --auto
fi

if [ ! -z "$(lsusb | grep Massdrop)" ]; then
    setxkbmap us -variant intl
fi
