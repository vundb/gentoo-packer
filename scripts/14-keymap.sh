#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
  sed -i "s/keymap=\".*\"/keymap=\"de\"/" /etc/conf.d/keymaps
EOF