#!/bin/bash

tarball=stage3-amd64-$STAGE3.tar.bz2

mount /dev/sda4 /mnt/gentoo

MIRROR=`mirrorselect -b10 -D -s1 -o -H -c 'Germany' | grep 'GENTOO_MIRRORS='`

cd /mnt/gentoo
curl -LO --progress-bar --retry 4 --retry-delay 1 ${MIRROR:16:-1}releases/amd64/autobuilds/$STAGE3/$tarball
tar xjpf $tarball
rm $tarball