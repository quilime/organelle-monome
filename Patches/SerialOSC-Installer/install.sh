#!/bin/sh

LOC="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # script working dir
BIN=/usr/local/bin
LIB=/usr/local/lib

sleep 0.5

echo "Enabling r/w"
mount / -o remount,rw

sleep 1

echo "Preparing"
systemctl disable serialosc.service
rm /etc/systemd/system/serialosc.service
${LOC}/killserialosc.sh

sleep 1

echo "Copying Libs"
cp -r ${LOC}/lib/monome /usr/local/lib/

sleep 1

echo "Copying Shared Objs"
cp ${LOC}/lib/libmonome.so /usr/local/lib/

sleep 1

echo "Linking Shared Objs"
ln -s ${LIB}/libmonome.so ${LIB}/libmonome.so.1
ln -s ${LIB}/libmonome.so ${LIB}/libmonome.so.1.4.0

sleep 1

echo "Setting Paths"
# libmonome looks for libs in in /usr/local/lib/, so add it to our libpath
echo "${LIB}" > /etc/ld.so.conf.d/usrlocal.conf
ldconfig

sleep 1

echo "Copying Binaries"
cp ${LOC}/monomeserial ${BIN}/
cp ${LOC}/serialoscd ${BIN}/
cp ${LOC}/serialosc-detector ${BIN}/
cp ${LOC}/serialosc-device ${BIN}/

#sleep 1

echo "Adding Services"
cp ${LOC}/serialosc.service /etc/systemd/system/
chmod 644 /etc/systemd/system/serialosc.service
systemctl enable --now serialosc.service

# create startup script. serialosc hangs when starting directly as a ExecStart
echo "serialoscd" > ${BIN}/start-serialoscd
chmod u+x ${BIN}/start-serialoscd

sleep 1

echo "Disabling r/w"
mount / -o remount,ro
