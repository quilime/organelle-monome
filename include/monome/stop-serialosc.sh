#!/bin/sh
echo "Stopping serialosc-device"
killall serialosc-device
kill -9 `pidof serialosc-device`
