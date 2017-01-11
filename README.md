# Organelle + Monome

![](http://media.quilime.com/files/img/organelle-monome.png)

## Hardware

  - Critter + Gutari Organelle
  - Monome 128 Grayscale

Optional

  - Powered USB Hub

## How to Use

Copy the example patches to the Patches folder on the USB drive.

Plug in the Monome to the USB Hub, and the USB Hub into the Organelle. On my Monome 128, half of the LEDs weren't lit when powered from the USB port on the Organelle. The keys worked, however. Other Monome's may not need a hub, YMMV.

### Monome-Install

Run this patch first. This patch installs the serialosc binaries and libmonome shared libraries to the Organelle's OS.

Press AUX to start installation.

After installation, all the monome's LED's should blink, and then each key's LED should illuminate when pressed. The Organelle should display the last key pressed x y and state. Pressing AUX again will toggle a lightshow.

### Monome Basic Poly

Try this patch after running Monome-Install. Indiviual Monome Keys illuminate when pressed, and trigger the Basic Poly voice patch that shipped with the Organelle.
