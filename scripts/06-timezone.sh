#!/bin/bash -uex

TZ=${TZ:-UTC}

chroot /mnt/gentoo /bin/bash -uex <<'EOF'
ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime
EOF
