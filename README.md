# Organelle + Monome via SerialOSC

![](http://media.quilime.com/files/img/organelle-monome.png)

## Hardware

  - Critter + Gutari Organelle
    - Tested with Monome 128 Grid Grayscale, other monomes should work

    Optional

      - Powered USB Hub

## How to Use

  1. Copy the example patches to your Organelle's USB drive or SD card.

    2. Plug in the Monome in via USB. Note: The Organelle's USB port doesn't supply enough power for a Monome 128 Grid to light all its LED's. A powered hub may be required for your Grid.

## Installation

Run the SerialOSC-Install patch. This patch installs the serialosc binaries and libmonome shared libraries to the Organelle's OS. It also adds serialosc as a daemon that runs at startup.

Press AUX to start installation.

After installation, plug in a Monome Grid to the Organelle or a connected USB Hub. The display should
notify you if it is connected and active. Unplug the grid and it should display that it's disconnected. When the grid is active, pressing a key will light it up and a sound will be heard.

## Patches

### SerialOSC-Install

SerialOSC Installer patch.

### Monome Basic Poly

Try this patch after running Monome-Install. Indiviual Monome Keys illuminate when pressed, and trigger the Basic Poly voice patch that shipped with the Organelle.

## Uninstall

Via the terminal, navigate to the SerialOSC-Installer folder and run

    ./uninstall.sh


