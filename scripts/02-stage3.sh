#!/bin/bash

tarball=stage3-amd64-$STAGE3.tar.bz2

mount /dev/sda4 /mnt/gentoo

cd /mnt/gentoo
curl -sL http://distfiles.gentoo.org/releases/amd64/autobuilds/$STAGE3/$tarball | tar xjp
