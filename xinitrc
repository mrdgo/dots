#!/bin/sh
export TERMINAL="st"
export SHELL=/bin/bash
export _JAVA_AWT_WM_NONREPARENTING=1

#/home/maxim/.config/init_wm.sh &
exec dbus-launch --sh-syntax --exit-with-session xmonad
#exec dbus-launch --sh-syntax --exit-with-session dwm
