#!/bin/sh
dunst &
slstatus &
killall picom

$HOME/.fehbg

dbus-launch --sh-syntax --exit-with-session dwm
