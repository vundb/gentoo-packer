#!/bin/bash -uex

OLD_ARCH=${ARCH}

case "${ARCH}" in
    x86|x86_64|amd64)
        ARCH=x86
    ;;
esac

export ARCH
echo "ARCH=${ARCH}"

chroot /mnt/gentoo /bin/bash -uex <<'EOF'
mkdir -p /etc/portage/package.accept_keywords
echo "sys-fs/zerofree **" >> /etc/portage/package.accept_keywords/sys-fs-zerofree
emerge -vq sys-fs/zerofree
cd /usr/src/linux && make clean
emerge -vq --depclean
EOF

ARCH=${OLD_ARCH}

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
