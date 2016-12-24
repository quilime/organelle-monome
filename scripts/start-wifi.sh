#!/bin/sh
# note: this has been tested successfully with 2.4Ghz networks
ip link set wlan0 up
wpa_supplicant -D nl80211 -i wlan0 -c wifi-wpa.conf &
dhcpcd wlan0
