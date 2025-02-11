#!/bin/bash

# This script assumes a default location of /etc/default/grub for the grub config file. There are currently no safety checks, if you are not completely certain about what you are doing, do not run the script and modify the the ET default grub file by hand. Running update-grub2 and a reboot are required after modification.

sudo sed -i.bax 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash audit=off iommu=pt intel_iommu=off amd_iommu=off"/g' /etc/default/grub

echo "Updating grub config...Restart systems to enable changes. Backup grub config written to  /etc/default/grub"
sudo update-grub2
