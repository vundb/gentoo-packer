#!/bin/bash -uex

KEYMAP="${KEYMAP:-us}"

chroot /mnt/gentoo /bin/bash -uex <<'EOF'
  sed -i "s/keymap=\".*\"/keymap=\"${KEYMAP}\"/" /etc/conf.d/keymaps
EOF
