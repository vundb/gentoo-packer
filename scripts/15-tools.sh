#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
echo ">=sys-libs/libseccomp-2.3.0 static-libs" > /etc/portage/package.use/docker
emerge -vq app-emulation/docker
groupadd docker
usermod -a -G docker vagrant
rc-update add docker default
EOF
