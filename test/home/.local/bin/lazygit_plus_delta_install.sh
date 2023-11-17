#!/usr/bin/bash

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

# Commands that you don't want running as root would be invoked
# with: sudo -u $real_user
# So they will be run as the user who invoked the sudo command
# Keep in mind if the user is using a root shell (they're logged in as root),
# then $real_user is actually root
# sudo -u $real_user non-root-command

# Commands that need to be ran with root would be invoked without sudo
# root-command

cd $HOME/.local/src/
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
DELTA_VERSION=$(curl -s "https://api.github.com/repos/dandavison/delta/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
sudo -u $real_user curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo -u $real_user curl -Lo git-delta_${LAZYGIT_VERSION}_amd64.deb "https://github.com/jesseduffield/lazygit/releases/latest/download/git-delta_${LAZYGIT_VERSION}_amd64.deb"
sudo -u $real_user tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
sudo dpkg -i $HOME/.local/src/git-delta_${LAZYGIT_VERSION}_amd64.deb
