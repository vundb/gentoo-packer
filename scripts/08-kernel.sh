#!/bin/bash -uex

cp $SCRIPTS/scripts/kernel.config /mnt/gentoo/tmp/
if [ "$ARCH" == "x86" ]; then
    sed -i 's/CONFIG_64BIT=y/CONFIG_64BIT=n/' /mnt/gentoo/tmp/kernel.config
    sed -i 's/CONFIG_TRIM_UNUSED_KSYMS=y/CONFIG_TRIM_UNUSED_KSYMS=n/' /mnt/gentoo/tmp/kernel.config
fi

chroot /mnt/gentoo /bin/bash -uex <<'EOF'
emerge -vq1 sys-kernel/gentoo-sources
cd /usr/src/linux
mv /tmp/kernel.config .config
make kvmconfig
make listnewconfig
make olddefconfig
echo 'make'
make -s
echo 'make modules_install'
make -s modules_install
echo 'make install'
make -s install
EOF
