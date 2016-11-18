#!/bin/bash

chroot /mnt/gentoo /bin/bash -x <<'EOF'
emerge --quiet "=virtual/linux-sources-1"

emerge --quiet ">=app-emulation/virtualbox-guest-additions-5.1.8" --autounmask-write
etc-update --automode -5
emerge --quiet ">=app-emulation/virtualbox-guest-additions-5.1.8"

rc-update add virtualbox-guest-additions default
EOF
