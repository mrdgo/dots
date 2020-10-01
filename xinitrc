#!/bin/sh
export TERMINAL="alacritty"
export SHELL=/bin/bash
export _JAVA_AWT_WM_NONREPARENTING=1

exec /home/maxim/.config/init_wm.sh &
#exec dbus-launch --sh-syntax --exit-with-session dwm
exec dbus-launch --sh-syntax --exit-with-session xmonad
