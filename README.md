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

# Install deps

This may be incomplete as I've installed a lot of packages as I've been working on my organelle, YMMV.

   pacman -Syy git svn python

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

## Startup serialosc-device directly

    ./build/bin/serialosc-device /dev/ttyUSB0
    # make a note of the portnumber

## Open Monome Serial OSC Test Patch

Plug in your Monome and open Patches/Monome/main.pd



# Optional: Send/rRceive raw bytes with ComPort

## Install [comport]

via https://puredata.info/community/pdwiki/ComPort

  cd /root/externals/
  svn co https://svn.code.sf.net/p/pure-data/svn/trunk/externals/iem/comport/comport/
  cd comport
  make

Then, open PureData from the GUI and add ComPort to your externals path.

1. Navigate to File > Preferences > Path.
2. Click "New"
3. Browse to /root/externals/comport
4. Click "OK"

## Open Monome Test Patch

Plug in your Monome and open monome-comport.pd.

# References

Organelle

- http://forum.critterandguitari.com/t/serialosc-monome-with-organelle/233/15
- http://forum.critterandguitari.com/t/installing-supercollider-on-the-organelle/164

Monome

- http://monome.org/docs/linux/
- http://monome.org/docs/osc/
- http://monome.org/docs/grid-studies/pd/
- http://llllllll.co/t/critter-guitari-organelle/1570/45

PureData

- https://puredata.info/community/pdwiki/ComPort
