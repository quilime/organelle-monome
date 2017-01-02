#!/bin/sh

set -x

# Arch doesn't look at usr/local/lib by default, but libmonome places its files there.
echo "/usr/local/lib" > /etc/ld.so.conf.d/usrlocal.conf

mkdir -p
pushd tmp > /dev/null

git clone https://github.com/monome/libmonome.git
git clone https://github.com/monome/serialosc.git

pushd libmonome > /dev/null
./waf configure
./waf
./waf install

popd > /dev/null

pushd serialosc > /dev/null
git submodule init && git submodule update
./waf configure
./waf
./waf install
