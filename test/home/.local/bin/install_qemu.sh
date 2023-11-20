#!/usr/bin/bash

###############################
# install qemu
###############################
#
# check for super user privileges
# die if we are not root user
source ./fn_check_for_root_user.sh
check_for_root_user

###############################
# Commands that you don't want running as root would be invoked
# with: sudo -u $real_user
# So they will be run as the user who invoked the sudo command
# Keep in mind if the user is using a root shell (they're logged in as root),
# then $real_user is actually root
# sudo -u $real_user non-root-command

# Commands that need to be ran with root would be invoked without sudo
# root-command

###############################
# install qemu
###############################

## prereq
nala install -y qemu-kvm libvrt-clients libvirt-daemon libvirt-daemon system bridge-utils virtinst

## Virt-Manager 👉GUI for KVM
nala install -y virt-manager

## Enable & start KVM service
systemctl enable libvirtd

## Make Network active and auto-restart
virsh net-start default
virsh net-autostart default

## Check network
#virsh net-list --all

### Add “vhost_net”. To improve the performance of network data transfer
### and reduce the load of virtio-net, add vhost_net” kernel module.
### 'vhost-net' is the backend (host side) whereas 'virtio-net' (guest side)
### is the frontend running in the guest kernel space.
modprobe vhost_net

## To check it has been enabled:
lsmod | grep vhost

## Add user to libvirt group
adduser $real_user libvirt
adduser $real_user libvirt-qemu

printf "\e[1;32mInstallation complete!\e[0m\n"
exit 0
