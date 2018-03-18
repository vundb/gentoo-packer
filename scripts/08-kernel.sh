#!/bin/bash -uex

cp $SCRIPTS/scripts/kernel.config /mnt/gentoo/tmp/
if [ "$ARCH" == "x86" ]; then
    sed -i 's/CONFIG_64BIT=y/CONFIG_64BIT=n/' /mnt/gentoo/tmp/kernel.config
    sed -i 's/CONFIG_TRIM_UNUSED_KSYMS=y/CONFIG_TRIM_UNUSED_KSYMS=n/' /mnt/gentoo/tmp/kernel.config
fi

OLD_ARCH=${ARCH}

case "${ARCH}" in
    x86|x86_64|amd64)
        ARCH=x86
    ;; 
esac

echo "ARCH=${ARCH}"

chroot /mnt/gentoo /bin/bash -uex <<'EOF'
emerge -vq sys-kernel/gentoo-sources
cd /usr/src/linux
mv /tmp/kernel.config .config
echo 'make kvmconfig'
make kvmconfig
echo 'make listnewconfig'
make listnewconfig
echo 'make olddefconfig'
make olddefconfig
echo 'make'
make
echo 'make modules_install'
make modules_install
echo 'make install'
make install
EOF

# reset ARCH back just incase it would cause problems for others
ARCH=${OLD_ARCH}
