cd ~
mkdir /tmp/vmware
echo vagrant | sudo -S mount -o loop ~/linux.iso /tmp/vmware
cd ~
tar -xf /tmp/vmware/VMwareTools*
cd vmware-tools-distrib/
echo vagrant | sudo -S ./vmware-install.pl --default
echo vagrant | sudo -S umount /tmp/vmware
cd ..
rm ~/linux.iso
rm -rf ~/vmware-tools-distrib
