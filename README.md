# Organelle + Monome

This is a guide for getting a [Monome Grid](http://monome.org/grid/) working with the [Critter + Guitari Organelle](https://www.critterandguitari.com/pages/organelle). The Organelle has an arm CPU, and runs Pure Data on Arch Linux, so you will be using the linux command line. You'll need to get your Organelle [connecting to the internet](http://forum.critterandguitari.com/t/using-a-wifi-adapter/158/9) in order to and install serialosc. Serialosc enables PureData to use OSC commands with the Monome Grid.

#### Hardware used for testing

  - Critter + Gutari Organelle
  - Monome 128 Grayscale
  - USB Wifi Adapter (I used a [Canakit adapter](http://www.canakit.com/raspberry-pi-wifi.html), but any adapter with a Ralink 5370 chipset should work).
  - 1920 x 1080 monitor w/HDMI connection.
  - Mouse & Keyboard
  - Powered USB Hub

Half of my 128's LEDs weren't lit when powered from the USB port on the Organelle, the addition of the powered USB hub solved this.

## Setup

Copy the patches in this repo to the Patches folder on the Organelle's USB.

Copy the `install-serialosc.sh` script in this repo onto the root of Organelle's USB. The folder structure should look like this:

- USBDRIVE/
  - install-serialosc.sh
  - Patches/
    - ...
    - Monome/
    - Monome Basic Poly/
    - ...

Eject the usbdrive from your computer after copying the files, and insert the Organelle's USB drive into the Organalle.

Attach your Organelle to a 1920 x 1080 monitor via HDMI, and plug in a mouse, keyboard, and wifi adapater with a USB hub.  Start up the Organelle by plugging it in. When the Organelle boots up, you will be welcomed with an Arch Linux terminal that looks like this.

    [root@organelle ~]]# _

## Installation

## Setup WIFI

Follow the instructions on [this forum thread](http://forum.critterandguitari.com/t/using-a-wifi-adapter/158/9).

## Enable Read/Write

Run the following command from the terminal.

    ~/scripts/remount-rw.sh

## Install Python

Install python with Arch's package manager, pacman.

    pacman -Syy python

Arch will sync its package database, and then ask you to confirm the installion. Type `y` and hit enter, or just hit enter.

## Run Install Script

Run `serialosc-install.sh` on the Organelle's USB drive.

     cd /usbdrive/ && ./serialosc-install.sh

This downloads and installs libmonome and serialosc. After it's successfully installed, try the included patches to see if everything works.

During installtion, a folder called `tmp/` is created. After everthing is installed and working, you can delete this folder and the install script.

# Patches

Two patches are included:

##  Monome Organelle Test Patches

    Patches/Monome/main.pd

This patch should connect the Monome to the organelle. When the patch stars, all the LED's should flash on and then off. Each Monome button should illuminate when it's pressed. Open the [serialosc] patch to see how the patch connects to serialosc via the start/stop serialosc scripts.

    Patches/Monome Basic Poly/main.pd

This patch combines the Basic Poly patch that came with the Organelle, utilizing the Monome's buttons as keys.
