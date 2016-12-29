# Organelle + Monome

## Hardware

  - Critter + Gutari Organelle
  - Monome 128 Grayscale
  - USB Wifi Adapter (I used a [Canakit adapter](http://www.canakit.com/raspberry-pi-wifi.html), but any adapter with a Ralink 5370 chipset should work).
  - 1920 x 1080 monitor w/HDMI connection.
  - Mouse & Keyboard
  - Powered USB Hub

Half of my 128's LEDs weren't lit when powered from the USB port on the Organelle, the addition of the powered USB hub solved this.

# Setup

Attach your Organelle to a 1920 x 1080 monitor via HDMI, and plug in a mouse, keyboard, and wifi adapater via an external USB hub. Power up the Organelle by plugging it in.

# Install
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

## Copy Files

Copy everything in `scripts/` in this repo to `/root/scripts` on the Organelle.

Copy the everything in `Patches/` to `/usbdrive/Patches/` on the Organelle.


## Install Dependencies

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

  After plugging in the Monome via USB, it should show up as `/dev/ttyUSB0`.

##  Monome Organelle Test Patches

    Patches/Monome/main.pd

This patch should connect the Monome to the organelle. When the patch stars, all the LED's should flash on and then off. Each Monome button should illuminate when it's pressed. Open the [serialosc] patch to see how the patch connects to serialosc via the start/stop serialosc scripts.

    Patches/Monome Basic Poly/main.pd

This patch combines the Basic Poly patch that came with the Organelle, utilizing the Monome's buttons as keys.


# Optional/Alternative: Send/Receive raw bytes with ComPort

I've also included a test patch to experiment with sending serial directly to the Monome via [comport]. This is included just to be thourough, and could be useful for other serial interfaces, such as Arduino.

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
