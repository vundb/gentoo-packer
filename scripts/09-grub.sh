#!/bin/bash -uex

chroot /mnt/gentoo /bin/bash -uex <<'EOF'
emerge -vq sys-boot/grub
grub-install /dev/sda
echo "GRUB_TIMEOUT=0.1" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
EOF
