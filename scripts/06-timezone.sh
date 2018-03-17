#!/bin/bash -uex

export TZ=${TIMEZONE=:-UTC}

chroot /mnt/gentoo /bin/bash -uex <<EOF
ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime
EOF
