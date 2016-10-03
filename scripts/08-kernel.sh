#!/bin/bash

cp $SCRIPTS/scripts/kernel.config /mnt/gentoo/tmp/

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge sys-kernel/gentoo-sources
cd /usr/src/linux
mv /tmp/kernel.config .config
make
make modules_install
make install
EOF
