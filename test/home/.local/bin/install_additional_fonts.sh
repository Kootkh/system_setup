#!/usr/bin/bash

source ./funcs.sh

###############################
# Check for super user privileges. Die if we are not root user.
###############################
check_for_root_privileges

###############################
# Select package manager
###############################
select_package_manager

###############################
# install additional fonts
###############################
$package_manager install fonts-wine fonts-font-awesome fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus fonts-material-design-icons-iconfont fonts-materialdesignicons-webfont fonts-cantarell

fc-cache

printf "\e[1;32mInstallation complete!\e[0m\n"
exit 0
