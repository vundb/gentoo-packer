#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
mkdir /usr/portage
emerge-webrsync -vq
echo "MAKEOPTS=\"-j3\" >> /etc/portage/make.conf
EOF
