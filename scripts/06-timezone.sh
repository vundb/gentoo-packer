#!/bin/bash

TZ=${TZ:-UTC}

chroot /mnt/gentoo /bin/bash <<'EOF'
ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime
EOF
