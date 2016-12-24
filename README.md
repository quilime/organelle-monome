# Organelle + Monome

## Hardware

  - Critter + Gutari Organelle
  - Monome 128 Grayscale
  - Powered USB Hub

  Note: Half of my 128's LEDs weren't lit when powered from the USB port on the Organelle, but otherwise works fine. I used a powered USB hub to solve this problem.

# Installation

##  Set read/write permissions and Setup WIFI

    # allow read/write permissions
    mount / -o remount,rw

    # setup wifi
    # note: this works with 2.4GH networks
    ip link set wlan0 up
    wpa_supplicant -D nl80211,wext -i wlan0 -c <(wpa_passphrase "networkname" "pass") &
    dhcpcd wlan0

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

## Plug in Monome

  It should show up on `/dev/ttyUSB0`

## Startup serialosc-device directly

    ./build/bin/serialosc-device /dev/ttyUSB0

##  Monome Organelle Test Patch

Patches/Monome/main.pd


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
