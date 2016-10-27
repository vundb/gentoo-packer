#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge -vq app-emulation/docker
rc-update add docker default
EOF
