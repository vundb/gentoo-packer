#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
	emerge -vq app-portage/gentoolkit
	emerge -vq app-misc/screen
  emerge -vq app-editors/vim
	emerge -vq net-dns/bind-tools
EOF