#!/bin/bash -uex

chroot /mnt/gentoo /bin/bash -uex <<'EOF'
emerge -vq "=virtual/linux-sources-1"

emerge -vq ">=app-emulation/open-vm-tools-10.0.7" --autounmask-write
etc-update --automode -5
emerge -vq ">=app-emulation/open-vm-tools-10.0.7"

mkdir /mnt/hgfs

rc-update add vmware-tools default
EOF
