#!/bin/bash

sed -i "s/#en_US\.UTF-8/en_US\.UTF-8/" /mnt/gentoo/etc/locale.gen

chroot /mnt/gentoo /bin/bash -x <<'EOF'
locale-gen
eselect locale set en_US.utf8
EOF
