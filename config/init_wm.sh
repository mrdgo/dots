#!/bin/sh
exec picom &
exec dunst &

if [ ! -z `pfetch | grep dwm` ]; then
    exec slstatus &
fi

exec setxkbmap us -variant intl

# Go into desktop mode if possible
hdmi_state=$(xrandr -q | awk '/HDMI-1/{print $2}')
if [ $hdmi_state = "connected" ]; then
    xrandr --output eDP-1 --off --output HDMI-1 --auto
fi

exec /home/maxim/.fehbg

