#!/usr/bin/bash

# check for super user privileges granter app
source ./test_funcs.sh

# die if we are not root user
check_for_root_user

# Commands that you don't want running as root would be invoked
# with: sudo -u $real_user
# So they will be run as the user who invoked the sudo command
# Keep in mind if the user is using a root shell (they're logged in as root),
# then $real_user is actually root
# sudo -u $real_user non-root-command

# Commands that need to be ran with root would be invoked without sudo
# root-command

# Commands that you don't want running as root would be invoked
# with: sudo -u $real_user
# So they will be run as the user who invoked the sudo command
# Keep in mind if the user is using a root shell (they're logged in as root),
# then $real_user is actually root
# sudo -u $real_user non-root-command

# Commands that need to be ran with root would be invoked without sudo
# root-command

#if [[ ! -d /home/$real_user/.local/src ]]; then
#    sudo -u $real_user mkdir /home/$real_user/.tmp
#fi
#
#echo "Real user: $real_user"

###############################
# Check for apt replacement
###############################

## nala Install apt replacement - nala
#if [ ! -f /usr/bin/nala ]; then
#    apt install nala
#    if [ $? -eq 0 ]; then
#        # Select fastest repos for nala
#        nala fetch
#        package_manager=nala
#    else
#        package_manager=apt
#    fi
#else
#    package_manager=nala
#fi


#apt install nala
#if [ $? -eq 0 ]; then
#    # Select fastest repos for nala
#    nala fetch
#    package_manager=nala
#else
#    package_manager=apt
#fi
#
#
#
#echo "Package management utility: $package_manager"

printf "\e[1;32mDone!\e[0m\n"
exit 0
