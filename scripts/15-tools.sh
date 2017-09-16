#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge -v -q app-emulation/virtualbox-guest-additions
emerge -v -q app-editors/vim
emerge -v -q app-portage/gentoolkit
EOF
