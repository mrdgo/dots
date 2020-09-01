#!/bin/sh
ifconfig wlp6s0 up
wpa_supplicant -i wlp6s0 -Dnl80211 -c /etc/wpa_supplicant/wpa_supplicant.conf -B
dhclient -r
dhclient wlp6s0

