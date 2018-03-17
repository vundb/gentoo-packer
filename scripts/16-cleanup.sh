#!/bin/bash -uex

chroot /mnt/gentoo /bin/bash <<'EOF'
echo "sys-fs/zerofree **" >> /etc/portage/package.accept_keywords
emerge -vq sys-fs/zerofree
cd /usr/src/linux && make clean
emerge -vq --depclean
EOF

rm -rf /mnt/gentoo/usr/portage/*
rm -rf /mnt/gentoo/tmp/*
rm -rf /mnt/gentoo/var/log/*
rm -rf /mnt/gentoo/var/tmp/*

chroot /mnt/gentoo /bin/bash <<'EOF'
mkdir /usr/portage/metadata/
echo "masters = gentoo" >> /usr/portage/metadata/layout.conf
EOF

mount -o remount,ro /mnt/gentoo
chroot /mnt/gentoo /bin/bash <<'EOF'
zerofree /dev/sda4
EOF

swapoff /dev/sda3
dd if=/dev/zero of=/dev/sda3 || true
mkswap /dev/sda3
