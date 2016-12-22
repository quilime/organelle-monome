# Organelle + Monome

## Hardware:

  - Critter + Gutari Organelle
  - Monome 128 Grayscale



# Installation

## Setup wifi & get write permissions

    # setup wifi
    ip link set wlan0 up
    wpa_supplicant -D nl80211,wext -i wlan0 -c <(wpa_passphrase "name" "pass") &
    dhcpcd wlan0
    # allow read/write permissions
    mount / -o remount,rw

## Install/Update Deps

    pacman -Syy git python

## Install libmonome and serialosc

    # Arch doesn't look at usr/local/lib by default, but libmonome places its files there.
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

## Install [comport]

  https://puredata.info/community/pdwiki/ComPort

  svn co https://pure-data.svn.sourceforge.net/svnroot/pure-data/trunk/externals/iem/comport

  cd comport
  make





## References

Organelle

- http://forum.critterandguitari.com/t/serialosc-monome-with-organelle/233/15
- http://forum.critterandguitari.com/t/installing-supercollider-on-the-organelle/164

Monome

- http://monome.org/docs/linux/
- http://monome.org/docs/osc/
- http://llllllll.co/t/critter-guitari-organelle/1570/45

PureData

- https://puredata.info/community/pdwiki/ComPort