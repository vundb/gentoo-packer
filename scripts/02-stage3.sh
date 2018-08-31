#!/bin/bash -uex

ARCH="${ARCH:-amd64}"
tarball=stage3-amd64-$STAGE3.tar.xz
[ $ARCH == "x86" ] && tarball=stage3-i686-$STAGE3.tar.xz || true

mkdir -p /mnt/gentoo
mount -o rw /dev/sda4 /mnt/gentoo

echo 'Testing stage3 mirrors'
MIRROR=${MIRROR:-$(grep '^GENTOO_MIRRORS' '/etc/portage/make.conf' | sed -e 's/\s.*$//' )}
flags="${MIRRORSELECT_REGION:+-R $MIRRORSELECT_REGION} ${MIRRORSELECT_COUNTRY:+-c $MIRRORSELECT_COUNTRY}"
MIRROR=${MIRROR:-$(mirrorselect -b10 -s1 -D -o -H -t60 $flags | grep 'GENTOO_MIRRORS=')}
MIRROR=$(echo $MIRROR | sed -e 's/"//g')

# incase we were unable to find a mirror
MIRROR=${MIRROR:-'GENTOO_MIRRORS=http://distfiles.gentoo.org'}

cd /mnt/gentoo
stage3_url="${MIRROR##GENTOO_MIRRORS=}/releases/$ARCH/autobuilds/${STAGE3}/${tarball}"
echo "Download stage3 from $stage3_url"
curl -sL --progress-bar --retry 4 --retry-delay 1 "$stage3_url" | tar xpJ
ls -l
