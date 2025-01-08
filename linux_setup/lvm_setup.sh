#!/bin/bash

# Update package list and upgrade all packages
apt update && apt upgrade -y

# Install LVM2 package
apt install -y lvm2

# Create physical volume
pvcreate /dev/sda2

# Create volume group
vgcreate vg0 /dev/sda2

# Create logical volumes
lvcreate -L 20G -n root vg0
lvcreate -L 4G -n swap vg0
lvcreate -l 100%FREE -n home vg0

# Format logical volumes
mkfs.ext4 /dev/vg0/root
mkfs.ext4 /dev/vg0/home
mkswap /dev/vg0/swap

# Mount logical volumes
mount /dev/vg0/root /mnt
mkdir /mnt/home
mount /dev/vg0/home /mnt/home
swapon /dev/vg0/swap

# Install base system
debootstrap --arch amd64 bullseye /mnt http://deb.debian.org/debian/

# Configure the system (e.g., fstab, network, etc.)
# ...

echo "Debian 12 with LVM setup is complete!"
