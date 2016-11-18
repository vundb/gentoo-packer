#!/bin/bash

echo "MAKEOPTS=\"-j3\"" >> /mnt/gentoo/etc/portage/make.conf
mkdir /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf

echo 'Sync portage'
chroot /mnt/gentoo /bin/bash -x <<'EOF'
emerge-webrsync
emerge --oneshot --quiet portage
EOF
