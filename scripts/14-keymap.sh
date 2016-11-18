#!/bin/bash

chroot /mnt/gentoo /bin/bash -x <<'EOF'
  sed -i "s/keymap=\".*\"/keymap=\"es\"/" /etc/conf.d/keymaps
EOF
