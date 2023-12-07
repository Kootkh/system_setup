#!/bin/bash

###############################
# Check for super user privileges.
# Die if we are not root user.
###############################

# Keep in mind if the user is using a root shell (they're logged in as root),
# then $real_user is actually root
#
# Commands that you don't want running as root would be invoked with:
# > sudo -u $real_user
#
# So they will be run as the user who invoked the sudo command
# > sudo -u $real_user non-root-command
#
# Commands that need to be ran with root would be invoked without sudo
# > root-command

check_for_root_privileges(){

    if [[ $EUID -ne 0 ]]; then
        echo "$me Script must be run with root privileges" 1>&2
        exit 1
    fi

    if [ $SUDO_USER ]; then
        real_user=$SUDO_USER
    else
        real_user=$(whoami)
    fi

    return
}


###############################
# Check if script running under root user.
###############################
check_for_root_user(){

    if [ $SUDO_USER ]; then
        real_user=$SUDO_USER
    else
        real_user=$(whoami)
    fi


    if [[ $real_user =~ root ]]; then
        #printf "\e[0;33mYou are running script as \033[5m\e[1;31mROOT\e[0m\e[0;33m user.\e[0m\n"
        printf "\e[0;33mYou are running script as \e[5;37;41mROOT\e[0m\e[0;33m user.\e[0m\n"
        #printf "\e[0;33mNot as \e[1;95muser with escalated privileges\e[0;33m!\e[0m\n"
        printf "\e[0;33mNot as \e[3;30;46muser with escalated privileges\e[0;33m!\e[0m\n"
        printf "\e[0;101mAre you sure what you are doing?\e[0m\n"
        read -p "(Y/y/Д/д):" -n 1 -r
        echo    # (optional) move to a new line

        ## negative
        #if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        #    # handle exits from shell or function but don't exit interactive shell
        #    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
        #fi

        ## positive
        if [[ $REPLY =~ ^[YyДд]$ ]]; then
            # do dangerous stuff
            echo "Ok, continue..."
            real_user_home_dir=/$real_user
        else
            echo "Ok, stopping..."
            exit 1;
        fi

    else

        real_user_home_dir=/home/$real_user

    fi

    return

}

###############################
# Select package manager
###############################
select_package_manager(){

    # Try to install apt replacement - nala
    if [ ! -f /usr/bin/nala ]; then
        apt install nala
        if [ $? -eq 0 ]; then
            # Select fastest repos for nala
            #nala fetch $DISTR $BRANCH
            package_manager=nala
        else
            package_manager=apt
        fi
    else
        package_manager=nala
    fi

    return

}

###############################
# select super user privileges provider App
###############################
select_suppapp(){

    if [[ -x "$(command -v doas)" ] && [ -e /etc/doas.conf ]]; then
        suppapp=doas

    elif [ -x "$(command -v sudo)" ]; then
        suppapp=sudo
    else
        printf "\e[0;33mSuper-User Privileges Provider Application - \e[5;37;41mNot Found\e[0m\n"
        printf "\e[0;33mPlease install \e[0;36;40msudo\e[0;33m/\e[0;36;40mdoas\e[0m\n"
        exit 1
    fi

    return

}
# ...
