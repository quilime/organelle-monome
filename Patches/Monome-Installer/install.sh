#!/bin/sh

LOC=/usbdrive/Patches/Monome-Installer

sleep 0.5

echo "Enabling r/w"
mount / -o remount,rw

sleep 1

echo "Setting Paths"
echo "/usr/local/lib" > /etc/ld.so.conf.d/usrlocal.conf
sleep 1

echo "Copying Libs"
cp -r ${LOC}/lib/monome /usr/local/lib/

sleep 1

echo "Copying Shared Objs"
cp ${LOC}/lib/libmonome.so /usr/local/lib/

sleep 1

echo "Linking Shared Objs"
ln -s /usr/local/lib/libmonome.so /usr/local/lib/libmonome.so.1
ln -s /usr/local/lib/libmonome.so /usr/local/lib/libmonome.so.1.4.0
ldconfig

sleep 1

echo "Copying Binaries"
cp ${LOC}/monomeserial /usr/local/bin/
cp ${LOC}/serialoscd /usr/local/bin/
cp ${LOC}/serialosc-detector /usr/local/bin/
cp ${LOC}/serialosc-device /usr/local/bin/

sleep 1

echo "Disabling r/w"
mount / -o remount,ro
