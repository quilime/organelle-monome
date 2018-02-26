#!/bin/sh

sleep 0.5

echo "Enabling r/w"
mount / -o remount,rw

sleep 1

echo "Removing Paths"
rm /etc/ld.so.conf.d/usrlocal.conf

sleep 1

echo "Removing Libs"
rm -r /usr/local/lib/monome

sleep 1

echo "Removing Shared Objs"
rm /usr/local/lib/libmonome.so

sleep 1

echo "Removing Links"
rm /usr/local/lib/libmonome.so.1
rm /usr/local/lib/libmonome.so.1.4.0
ldconfig

sleep 1

echo "Removing binaries"
rm /usr/local/bin/monomeserial
rm /usr/local/bin/serialoscd
rm /usr/local/bin/serialosc-detector
rm /usr/local/bin/serialosc-device

sleep 1

echo "Disabling Services"
systemctl disable serialosc.service
rm /etc/systemd/system/serialosc.service

sleep 1

echo "Disabling r/w"
mount / -o remount,ro
