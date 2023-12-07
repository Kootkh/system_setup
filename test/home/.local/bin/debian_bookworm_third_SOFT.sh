#!/usr/bin/env bash

source ./funcs.sh
################################################################################
################################################################################
# Check for super user privileges. Die if we are not have them
check_for_root_privileges                           # $real_user
################################################################################
# Check if script running under root user.
check_for_root_user                                 # $real_user_home_dir
################################################################################
# Select package manager
select_package_manager                              # $package_manager
################################################################################
################################################################################


################################################################################
# Android
################################################################################
$package_manager install -yy adb fastboot android-sdk-libsparse-utils android-sdk-platform23

################################################################################
# Brave browser
################################################################################
$package_manager install -yy apt-transport-https curl gnupg -yy
sudo -u $real_user curl -s https://brave-browser-apt-release.s4.brave.com/brave-core.asc | apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install -yy brave-browser

################################################################################
# Desktop Recording
################################################################################
apt install -yy simplescreenrecorder obs-studio

################################################################################
# Desktop
################################################################################
apt install synaptic -yy
apt install thunar thunar-media-tags-plugin thunar-vcs-plugin thunar-volman -yy
apt install ffmpegthumbnailer -yy
apt install cups cups-pdf -yy
apt install nitrogen -yy
apt install lxappearance -yy
apt install dmenu -yy
apt install qt5-style-plugins -yy
# apt install virtualbox virtualbox-ext-pack virtualbox-dkms virtualbox-guest-additions-iso virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 -yy

################################################################################
# Make QT apps match GTK apps
################################################################################
#sudo chown $USER /etc/environment
#sudo chmod 755 /etc/environment
#sudo echo "QT_QPA_PLATFORMTHEME=gtk2" >> /etc/environment
#sudo chown root:root /etc/environment
#sudo chmod 600 /etc/environment
#sudo usermod -aG vboxusers $USER

################################################################################
# Downloaders & Stuff
################################################################################
#sudo apt install transmission-gtk wget curl -yy

################################################################################
#         Sounds and Codecs
################################################################################
sudo apt install pulseaudio pulseaudio-utils -yy
sudo apt install pavucontrol -yy
sudo apt install pulseaudio-dlna pulseaudio-equalizer gstreamer1.0-pulseaudio -yy
sudo apt install alsa-utils gstreamer1.0-alsa alsamixergui alsaplayer-gtk -yy
sudo apt install alsa-player-daemon alsa-player-common alsa-player-alsa -yy
sudo apt install libao-common libao-dbd libao-dev libao4 -yy
sudo apt install libasound2 libasound-data libasound-dev libasound-doc libasound-plugins -yy
sudo apt install exfat-utils -yy

################################################################################
#         Terminals, Terminal Apps, and Text Editors
################################################################################
sudo apt install rxvt-unicode -yy
sudo apt install ranger -yy
sudo apt install feh -yy
sudo apt install neofetch -yy
sudo apt install figlet -yy
sudo apt install lolcat -yy
sudo apt install vim -yy
sudo apt install nano -yy
sudo apt install geany -yy
sudo apt install build-essential -yy
sudo apt install cmake -yy
sudo apt install p7zip p7zip-full unrar-free unzip -yy
sudo apt install lshw -yy
sudo apt install powerline -yy

################################################################################
#	Image Software
################################################################################
sudo apt install gimp -yy
sudo apt install inkscape -yy




################################################################################
#         Networking
################################################################################
sudo apt install network-manager -yy
sudo apt install network-manager-openvpn -yy
sudo apt install network-mangager-openvpn-gnome -yy
sudo apt install samba samba-common samba-libs cifs-utils libcups2 cups smbclient -yy
sudo apt install gvfs-backends -yy
sudo apt install net-tools -yy
sudo apt install ssh -yy

################################################
#         Backup smb.conf
################################################
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak

##############################################################
#   Extract relevant information to simplify smb.conf
##############################################################
sudo chmod 755 /etc/samba/smb.conf.bak
sudo chmod 755 /etc/samba/smb.conf
sudo grep -v -E "^#|^;" /etc/samba/smb.conf.bak | grep . > /etc/samba/smb.conf

################################################
#         Enable SSH and SAMBA
################################################
sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl enable smbd
sudo systemctl start smbd
sudo systemctl enable nmbd
sudo systemctl start nmbd
