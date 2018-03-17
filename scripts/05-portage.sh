#!/bin/bash -uex

MAKEOPTS=${MAKEOPTS:--j3}

echo 'Sync portage'
chroot /mnt/gentoo /bin/bash -uex <<'EOF'
mkdir -p /usr/portage
emerge-webrsync -v -q
echo "MAKEOPTS=\"${MAKEOPTS}\"" >> /etc/portage/make.conf
EOF
