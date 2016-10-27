#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge -vq sys-boot/grub
grub-install /dev/sda
echo "GRUB_HIDDEN_TIMEOUT=0" >> /etc/default/grub
echo "GRUB_HIDDEN_TIMEOUT_QUIET=true" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
EOF
