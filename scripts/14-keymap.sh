#!/bin/bash

KEYMAP="${KEYMAP:-us}"

chroot /mnt/gentoo /bin/bash <<'EOF'
  sed -i "s/keymap=\".*\"/keymap=\"${KEYMAP}\"/" /etc/conf.d/keymaps
EOF
