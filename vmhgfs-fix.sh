#!/bin/bash
#
# Patch to fix VMware-Tools installation in kernel 3.8.x
# Working for Ubuntu 13.04 (Xubuntu and Kubuntu also)
# http://ubuntuforums.org/showthread.php?t=2136277&page=3
#

# Get VMwareTools file (it should be in the default format VMwareTools-9.x.x...)
VMFILE=`ls | grep VMwareTools-9.*`

if [[ ! $VMFILE ]]
then
  printf "\nERROR: \nVMwareTools-9.(...).tar.gz not found.\n\nYou should place it in the current folder and/or \nRename it as VMwareTools-9... (default format name)\n\n"
  exit
fi

# Check for vmware-tools-distrib folder
if [[ ! -d vmware-tools-distrib ]]
then
  printf "\nExtracting VMware-tools...\n"
  # Extract VMware Tools
  tar xf $VMFILE
else
  printf "\n/vmware-tools-distrib already exists.\nPlease remove it before applying this patch.\n\n"
  exit
fi

# Record the current directory
PATCH_DIR=$PWD

printf "\nApplying patch to VMware-Tools...\n\n"
sleep 3
pushd vmware-tools-distrib/lib/modules/source

# Make a backup of vmhgfs.tar
cp vmhgfs.tar vmhgfs.tar.backup
# Extract vmhgfs.tar
tar xf vmhgfs.tar
# Go to extracted vmhgfs.tar
pushd vmhgfs-only/
# Apply patch
patch -p1 < $PATCH_DIR/vmtools.inode.c.patch
popd
# Remove old vmhgfs.tar
rm -rf vmhgfs.tar
# Repack new vmhgfs.tar
tar cf vmhgfs.tar vmhgfs-only
# Remove vmhgfs-only dir which is not needed
rm -rf vmhgfs-only
popd

printf "\nPatch Applied!\n"
printf "Now try to install VMware-Tools.\n\n"
