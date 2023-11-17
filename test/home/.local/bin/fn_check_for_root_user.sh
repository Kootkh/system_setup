#!/bin/bash
# Make sure only root can run script
check_for_root_user(){
    if [[ $EUID -ne 0 ]]; then
        echo "$me script must be run as root" 1>&2
        exit 1
    fi
}
# ...
