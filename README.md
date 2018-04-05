# organelle + monome grid & serialosc

![](http://media.quilime.com/files/img/organelle-monome.png)

## Hardware

  - Critter + Gutari Organelle
    - Tested with Monome 128 Grid Grayscale (non varibright), other Monome Grids should work

    Optional

      - Powered USB Hub

## Patches

### SerialOSC-Install

SerialOSC Installer patch.

### Monome Basic Poly

Indiviual Monome Keys illuminate when pressed and trigger the Basic Poly voice patch that shipped with the Organelle.

### Grid Apps

Various Grid apps examples ported to PureData from Aleph via https://github.com/boqs/pd-grid, including

  - grid
  - kria
  - meadowphysics
  - step
  - whitewhale

Note: These apps do not make sound, but they could be used as a starting point for other patches.

## How to Use

  1. Copy the example patches to your Organelle's USB drive or SD card.

    2. Plug in the Monome in via USB. Note: The Organelle's USB port doesn't supply enough power for a Monome 128 Grid to light all its LED's, a powered USB hub was required.

## Installation

Run SerialOSC-Installer first. This patch installs the serialosc binaries and libmonome shared libraries to the Organelle's OS. It also adds serialosc as a daemon that runs at startup.

  1. Plug in the Monome Grid via USB
  2. Press AUX to start installation

Upon a successful installation, the display should notify you if it is connected and active and the Grid's light should illuminate. Pressing a key will light it up.

If you are not compiling the extensions yourself, you only need the compiled extensions and the pd files to run the patches.


## Uninstall

Via the terminal, navigate to the SerialOSC-Installer folder and run

    ./uninstall.sh

Then, delete all patches from your Organelle.


