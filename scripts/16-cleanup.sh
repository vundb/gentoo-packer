#!/bin/bash

rm -rf /mnt/gentoo/tmp/*
rm -rf /mnt/gentoo/var/log/*
rm -rf /mnt/gentoo/var/tmp/*

chroot /mnt/gentoo /bin/bash -x <<'EOF'
wget http://frippery.org/uml/zerofree-1.0.4.tgz
tar xvzf zerofree-*.tgz
cd zerofree*/
make
EOF

mv /mnt/gentoo/zerofree* ./
cd zerofree*/

mount -o remount,ro /mnt/gentoo
./zerofree /dev/sda4

swapoff /dev/sda3
dd if=/dev/zero of=/dev/sda3
mkswap /dev/sda3
