#!/usr/bin/bash

source ./funcs.sh

###############################
# check for super user privileges
###############################
check_for_root_privileges

###############################
# die if we are not root user
###############################
check_for_root_user


###############################
#
if [[ ! -d /home/$real_user/.local/src ]]; then
    sudo -u $real_user mkdir /home/$real_user/.tmp
fi

cd /home/$real_user/.tmp

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
DELTA_VERSION=$(curl -s "https://api.github.com/repos/dandavison/delta/releases/latest" | grep -Po '"tag_name": "\K[^"]*')

#echo "LAZYGIT_VERSION => $LAZYGIT_VERSION"
#echo "DELTA_VERSION => $DELTA_VERSION"

sudo -u $real_user curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
#sudo -u $real_user curl -Lo git-delta_${DELTA_VERSION}_amd64.deb "https://github.com/jesseduffield/lazygit/releases/latest/download/git-delta_${DELTA_VERSION}_amd64.deb"
sudo -u $real_user curl -Lo git-delta.deb "https://github.com/dandavison/delta/releases/download/${DELTA_VERSION}/git-delta_${DELTA_VERSION}_amd64.deb"
sudo -u $real_user tar xf lazygit.tar.gz lazygit
install lazygit /usr/local/bin
dpkg -i git-delta.deb
sudo -u $real_user rm  git-delta.deb lazygit.tar.gz lazygit

printf "\e[1;32mInstallation complete!\e[0m\n"
exit 0
