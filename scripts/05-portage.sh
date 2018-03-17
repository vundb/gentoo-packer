#!/bin/bash

MAKEOPTS=${MAKEOPTS:--j3}

echo 'Sync portage'
chroot /mnt/gentoo /bin/bash <<'EOF'
mkdir -p /usr/portage
emerge-webrsync -v -q
echo "MAKEOPTS=\"${MAKEOPTS}\"" >> /etc/portage/make.conf
EOF
