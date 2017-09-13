#!/bin/bash

echo 'Sync portage'
chroot /mnt/gentoo /bin/bash <<'EOF'
mkdir -p /usr/portage
emerge-webrsync -v -q
echo "MAKEOPTS=\"-j3\"" >> /etc/portage/make.conf
EOF
