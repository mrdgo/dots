#!/bin/sh
exec dbus-launch --sh-syntax xmonad || exec dbus-launch --sh-syntax --exit-with-session dwm
