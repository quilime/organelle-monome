#!/bin/sh
echo "Stopping any instance of serialosc before starting again."
/usbdrive/include/monome/stop-serialosc.sh
/usbdrive/include/monome/serialosc-device /dev/ttyUSB0 &
echo "Starting serialosc-device on /dev/ttyUSB0"
