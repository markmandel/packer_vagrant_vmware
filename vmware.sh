cd ~
mkdir /tmp/vmware
echo vagrant | sudo -S mount -o loop ~/linux.iso /tmp/vmware
cd ~
mkdir vmware
cd vmware
cp /tmp/vmware/VMwareTools-9.2.3-1031360.tar.gz .
wget https://dl.dropboxusercontent.com/u/16521384/vmhgfs-fix.sh
wget https://dl.dropboxusercontent.com/u/16521384/vmtools.inode.c.patch
chmod +x vmhgfs-fix.sh
./vmhgfs-fix.sh
cd vmware-tools-distrib/
echo vagrant | sudo -S ./vmware-install.pl --default
echo vagrant | sudo -S umount /tmp/vmware
cd ..
rm ~/linux.iso
rm -rf ~/vmware
