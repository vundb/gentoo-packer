#!/bin/bash

chroot /mnt/gentoo /bin/bash -x <<'EOF'
emerge --quiet sys-boot/grub
grub-install /dev/sda
EOF

sed -i 's/GRUB_TIMEOUT=10/GRUB_TIMEOUT=1/' /mnt/gentoo/etc/default/grub

chroot /mnt/gentoo /bin/bash -x <<'EOF'
grub-mkconfig -o /boot/grub/grub.cfg
EOF
