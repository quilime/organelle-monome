# Organelle + Monome

## Hardware

  - Critter + Gutari Organelle
  - Monome 128 Grayscale
  - Powered USB Hub

Note: Half of my 128's LEDs weren't lit when powered from the USB port on the Organelle, a powered USB hub solved this.

More patches and externals:

  - https://github.com/quilime/organelle-patches
  - https://github.com/quilime/organelle-externals

# Setup

Attach your Organelle to a 1920x1080 display via HDMI, and plug in a mouse/keyboard via an external USB hub. Power up the Organelle by plugging it in.

##  Set read/write permissions

    # allow read/write permissions
    mount / -o remount,rw

Or, run `/root/scripts/remount-rw.sh`, which ships with the Organelle.

## Setup WIFI

via http://forum.critterandguitari.com/t/using-a-wifi-adapter/158/9

    # setup wifi
    # note: this works with 2.4GH networks
    ip link set wlan0 up
    wpa_supplicant -D nl80211,wext -i wlan0 -c <(wpa_passphrase "networkID" "pass") &
    dhcpcd wlan0

You can also use `/scripts/start-wifi.sh` after editing `/scripts/wifi-wap.conf` with your networkID and password.

# Install

This is likely incomplete as I've installed a lot of packages as I've been working on my organelle, YMMV.

   pacman -Syy git svn python

## Install libmonome and serialosc

    # Arch doesn't look at usr/local/lib by default,
    # but libmonome places its files there.
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

## Plug in Monome

  It should show up on `/dev/ttyUSB0`

## Startup serialosc-device directly

    ./build/bin/serialosc-device /dev/ttyUSB0

Or, use `start-serialosc-server.sh` and `stop-serialosc-server.sh` in /scripts/.

##  Monome Organelle Test Patch

Patches/Monome/main.pd


# Optional/Alternative: Send/Receive raw bytes with ComPort

## Install [comport]

via https://puredata.info/community/pdwiki/ComPort

    cd /root/externals/
    svn co https://svn.code.sf.net/p/pure-data/svn/trunk/externals/iem/comport/comport/
    cd comport
    make

## PureData from the GUI and add ComPort to your externals path.

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
