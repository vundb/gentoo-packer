#!/bin/bash

chroot /mnt/gentoo /bin/bash -x <<'EOF'
ln -snf /usr/share/zoneinfo/UTC /etc/localtime
EOF
