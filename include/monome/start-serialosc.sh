#!/bin/sh
echo "Stopping any instance of serialosc before starting again."
./stop-serialosc.sh
serialosc-device /dev/ttyUSB0 &
echo "Starting serialosc-device on /dev/ttyUSB0"