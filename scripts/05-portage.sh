#!/bin/bash

echo 'Sync portage'
chroot /mnt/gentoo /bin/bash <<'EOF'
mkdir /usr/portage
emerge-webrsync -v -q
echo "MAKEOPTS=\"-j3\" >> /etc/portage/make.conf
echo "masters = gentoo" >> /usr/portage/metadata/layout.conf
EOF
