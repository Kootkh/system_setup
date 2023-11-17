#!/usr/bin/bash

#############################################################
# Fonts
#############################################################

# check for super user privileges granter app
source ./fn_check_for_root_user.sh

# die if we are not root user
check_for_root_user

if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi

# Commands that you don't want running as root would be invoked
# with: sudo -u $real_user
# So they will be run as the user who invoked the sudo command
# Keep in mind if the user is using a root shell (they're logged in as root),
# then $real_user is actually root
# sudo -u $real_user non-root-command

# Commands that need to be ran with root would be invoked without sudo
# root-command

# nala Install apt replacement - nala
if [ ! -f /usr/bin/nala ]; then
    apt install nala
    # Select fastest repos for nala
    nala fetch
fi

###############################
# USUAL Fonts
###############################
# sudo apt install fonts-wine fonts-font-awesome fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus fonts-material-design-icons-iconfont fonts-materialdesignicons-webfont fonts-cantarell
#

nala install fonts-wine fonts-font-awesome fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus fonts-material-design-icons-iconfont fonts-materialdesignicons-webfont fonts-cantarell

fc-cache

printf "\e[1;32mInstallation complete!\e[0m\n"
exit 0
