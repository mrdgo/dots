#!/bin/sh
export TERMINAL="alacritty"
export SHELL=/bin/bash
export _JAVA_AWT_WM_NONREPARENTING=1

exec dbus-launch --sh-syntax xmonad || exec dbus-launch --sh-syntax --exit-with-session dwm
