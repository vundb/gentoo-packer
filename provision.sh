#!/bin/bash

if [ -z $STAGE3 ]; then
  echo "STAGE3 environment variable must be set to a timestamp."
  exit 1
fi

if [ -z $SCRIPTS ]; then
  SCRIPTS=.
fi

chmod +x $SCRIPTS/scripts/*.sh

for script in \
  01-partition   \
  02-stage3      \
  03-mounts      \
  04-resolv.conf \
  05-portage     \
  06-timezone    \
  07-fstab       \
  08-kernel      \
  09-grub        \
  10-$VM_TYPE    \
  11-network     \
  12-vagrant     \
  13-locale      \
	14-keymap      \
  15-tools       \
	16-cleanup
do
  "$SCRIPTS/scripts/$script.sh"
done

echo "All done."
