#!/bin/bash -uex

LANG="${LANG:-en_US}"

chroot /mnt/gentoo /bin/bash -uex <<'EOF'
cat > /etc/env.d/02locale <<'LOC'
LANG="${LANG}.UTF-8"
LC_COLLATE=C
LOC
sed -i "s/#en_US\.UTF-8/${LANG}\.UTF-8/" /etc/locale.gen
locale-gen
EOF
