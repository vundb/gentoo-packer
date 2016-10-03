#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
	emerge app-portage/gentoolkit
	emerge app-misc/screen
  emerge app-editors/vim
	emerge net-dns/bind-tools
EOF