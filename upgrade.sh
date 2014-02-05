!#/bin/bash
echo vagrant | sudo -S apt-get update
echo vagrant | sudo -S apt-get --yes dist-upgrade
echo REBOOTING!
echo vagrant | sudo -S reboot
