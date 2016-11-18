#!/bin/bash

chroot /mnt/gentoo /bin/bash -x <<'EOF'
emerge --quiet net-misc/dhcpcd
emerge --quiet app-editors/vim
emerge -C --quiet  app-editors/nano
eselect editor set /usr/bin/vi
emerge --quiet gentoolkit
emerge -uDN --quiet world
emerge --quiet @preserved-rebuild
perl-cleaner --all
emerge -D --depclean --quiet
revdep-rebuild -i
EOF
