#!/bin/bash
echo vagrant | sudo -S sh -c 'date > /etc/vagrant_box_build_time'

#from: https://github.com/misheska/basebox-packer/blob/master/template/misheska-ubuntu1204/script/vagrant.sh

# Set up sudo.  Be careful to set permission BEFORE copying file to sudoers.d
( cat <<'EOP'
%vagrant ALL=NOPASSWD:ALL
EOP
) > /tmp/vagrant
echo vagrant | sudo -S chmod 0440 /tmp/vagrant
echo vagrant | sudo -S chown root:root /tmp/vagrant
echo vagrant | sudo -S mv /tmp/vagrant /etc/sudoers.d/

# Install vagrant keys
cd ~
mkdir ~/.ssh
cd ./.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
cd ~
#echo vagrant | sudo -S chmod -R 600 ./.ssh
#echo vagrant | sudo -S chown -R vagrant ./.ssh 
