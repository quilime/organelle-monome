# Organelle + Monome

## Hardware:

  - Critter + Gutari Organelle
  - Monome 128 Grayscale

## References:

Organelle
https://cdn.shopify.com/s/files/1/0159/3944/files/Welcome_to_Organelle_-_English_v2.pdf?15905572571206896609
http://forum.critterandguitari.com/t/installing-supercollider-on-the-organelle/164

Monome
http://monome.org/docs/linux/
http://llllllll.co/t/building-serialosc-on-arch-linux/738
http://archive.monome.org/community/discussion/15226/linux-libmonome-installation-trouble/p1

PureData
https://puredata.info/community/pdwiki/ComPort

# Installation

## Setup wifi & get write permissions

    1. ip link set wlan0 up
    2. wpa_supplicant -D nl80211,wext -i wlan0 -c <(wpa_passphrase "name" "pass") &
    3. dhcpcd wlan0
    4. mount / -o remount,rw

## Install Deps

    1. pacman -Syy python

## Install libmonome and serialosc

Arch doesn't look at usr/local/lib by default, but libmonome places its files there.
    echo "/usr/local/lib" > /etc/ld.so.conf.d/usrlocal.conf

    mkdir monome
    cd monome
    git clone https://github.com/monome/libmonome.git
    git clone https://github.com/monome/serialosc.git

    cd libmonome
    ./waf configure
    ./waf
    ./waf install

    cd ../serialosc
    git submodule init && git submodule update
    ./waf configure
    ./waf
    ./waf install
