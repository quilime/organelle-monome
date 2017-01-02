#!/bin/sh

set -x

# Arch doesn't look at usr/local/lib by default, but libmonome places its files there.
echo "/usr/local/lib" > /etc/ld.so.conf.d/usrlocal.conf

mkdir tmp
cd tmp
git clone https://github.com/monome/libmonome.git
git clone https://github.com/monome/serialosc.git

cd libmonome
./waf configure
./waf
./waf install

cd ../serialosc
git submodule init && git submodule update
./waf configure
./waf
./waf install
