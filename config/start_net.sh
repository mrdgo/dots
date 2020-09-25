#!/bin/sh
wpa_supplicant -i wlp6s0 -Dnl80211 -c /etc/wpa_supplicant/wpa_supplicant.conf -B
dhcpcd wlp6s0
