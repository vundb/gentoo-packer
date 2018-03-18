#!/bin/bash -uex

chroot /mnt/gentoo /bin/bash -uex <<'EOF'
emerge -vq "virtual/linux-sources"

emerge -vq  ">=app-emulation/virtualbox-guest-additions-5.1" --autounmask-write
etc-update --automode -5
emerge -vq  ">=app-emulation/virtualbox-guest-additions-5.1"

rc-update add virtualbox-guest-additions default
EOF
