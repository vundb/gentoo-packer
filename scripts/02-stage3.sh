#!/bin/bash

tarball=stage3-amd64-$STAGE3.tar.bz2

mkdir -p /mnt/gentoo
mount -o rw /dev/sda4 /mnt/gentoo

COUNTRY="${COUNTRY:-USA}"

echo 'Testing stage3 mirrors'
MIRROR=$(grep '^GENTOO_MIRRORS' '/etc/portage/make.conf')
[ -z $MIRROR ] && MIRROR=`mirrorselect -b10 -s1 -o -H -t60 -c $COUNTRY | grep 'GENTOO_MIRRORS='`
MIRROR=$(echo $MIRROR | sed -e 's/"//g')

# incase we were unable to find a mirror
[ -z "${MIRROR}" ] && MIRROR='GENTOO_MIRRORS=http://mirrors.evowise.com/gentoo/'

cd /mnt/gentoo
echo 'Download stage3'
curl -sL --progress-bar --retry 4 --retry-delay 1 "${MIRROR##GENTOO_MIRRORS=}/releases/amd64/autobuilds/${STAGE3}/${tarball}" | tar xpj
ls -l
