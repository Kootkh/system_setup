#!/usr/bin/env bash

source ./funcs.sh

########################################################
# check for super user privileges
# die if we are not have them
########################################################
check_for_root_privileges
# $real_user

########################################################
# Check if script running under root user.
########################################################
check_for_root_user
# $real_user_home_dir

########################################################
# Select package manager
###############################
select_package_manager
# $package_manager

##############################
## Prerequirement
##############################
### build-essential             👉 Informational list of build-essential packages
$package_manager install build-essential libx11-dev libxft-dev libxinerama-dev libfreetype6-dev libfontconfig1-dev \

### unzip                       👉 De-archiver for .zip files
### git                         👉 fast, scalable, distributed revision control system
### neofetch                    👉 Shows Linux System Information with Distribution Logo
### cpp                         👉 GNU C preprocessor (cpp)
### wget                        👉 retrieves files from the web
### curl                        👉 command line tool for transferring data with URL syntax
### lsof                        👉 utility to list open files
### makepatch                   👉 utility for directing compilation
### makepasswd                  👉 Generate and encrypt passwords
### rsync
unzip git neofetch wget curl lsof makepatch makepasswd rsync \

##############################
## xorg display server installation
##############################
### xorg                        👉 X.Org X Window System
### xorg-dev                    👉 X.Org X Window System development libraries
### xbacklight                  👉 simple utility to set the backlight level
### xbindkeys                   👉 Associate a combination of keys or mouse buttons with a shell command
### xvkbd                       👉 software virtual keyboard for X11
### xinput                      👉 Runtime configuration and test of XInput devices
xorg xorg-dev xbacklight xbindkeys xvkbd xinput \

########################################################
# DWM & Suckless apps
########################################################

# Creating directories
mkdir $HOME/.config/suckless

if [[ ! -d $real_user_home_dir/.config/suckless ]]; then
    sudo -u $real_user mkdir -p $real_user_home_dir/.config/suckless
fi

# Specify which suckless tools we want to install
## dwm         👉 dynamic window manager
## dmenu       👉 Suckless dynamic menu app launcher
## st          👉 simple terminal
## slstatus    👉 status monitor
### More dwm and slstatus customization https://www.youtube.com/watch?v=X2DS8xAEo-s
## slock       👉 simple X display locker utility
## tabbed      👉 tab interface for application supporting Xembed
## scroll      👉 scrollbackbuffer program for st
tools=( "dwm" "dmenu" "st" "slstatus" "slock" "tabbed" "scroll" )

for tool in ${tools[@]}
do
    # Move to install directory, make, and install
    cd $real_user_home_dir/.config/suckless
    sudo -u $real_user git clone git://git.suckless.org/$tool
    sudo -u $real_user tar czf $real_user_home_dir/.config/suckless/$tool-orig-backup.tar.gz $real_user_home_dir/.config/suckless/$tool
    cd $real_user_home_dir/.config/suckless/$tool
    sudo -u $real_user make
    make clean install
done


########################################################
# Create autostart.sh and put it in to the desired location
########################################################
if [[ ! -d $real_user_home_dir/.local/share/dwm ]]; then
    sudo -u $real_user mkdir -p $real_user_home_dir/.local/share/dwm
fi

if [[ ! -d /home/$real_user/.tmp ]]; then
    sudo -u $real_user mkdir -p $real_user_home_dir/.tmp
fi

sudo -u $real_user cat > $real_user_home_dir/.tmp/temp << "EOF"
#!/usr/bin/env bash

slstatus &

# network applet
nm-applet &

# background
feh --bg-scale ~/.config/backgrounds/debdino.png &

# compositor
picom --config ~/.config/picom/picom.conf &

# sxhkd
sxhkd -c ~/.config/suckless/sxhkd/sxhkdrc &

# Notifications
dunst &

# volume
volumeicon &
EOF

sudo -u $real_user cp $real_user_home_dir/.tmp/temp $real_user_home_dir/.local/share/dwm/autostart.sh
sudo -u $real_user chmod +x $real_user_home_dir/.local/share/dwm/autostart.sh
rm /home/$real_user/.tmp/temp

########################################################
# XSessions and dwm.desktop
########################################################
if [[ ! -d /usr/share/xsessions ]]; then
    mkdir /usr/share/xsessions
fi

cat > $real_user_home_dir/.tmp/temp << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
EOF

cp $real_user_home_dir/.tmp/temp /usr/share/xsessions/dwm.desktop
rm $real_user_home_dir/.tmp/temp

########################################################
### dwm-flexipatch
###   NOT ALL PATCHES HAVE !!!!!
########################################################
#~$ git clone https://github.com/bakkeby/dwm-flexipatch
#~$ cd $HOME/.config/suckless/dwm-flexipatch
##### edit config
#~$ vim patches.h
# - #define VANITYGAPS_PATCH 1           # gaps between panes
# - #define BAR_ALPHA_PATCH 1            # add transparency for the status bar
# - - uncomment: XRENDER = -lXrender
# - #define BAR_TAGPREVIEW_PATCH 1       # create preview of workspaces
# - - uncomment: IMLIB2LIBS = -lImlib2
# - #define XRDB_PATCH 1                 # manage colors of gui without reloading
#
#~$ vim config.h
#
#~$ sudo make clean install
#
#~$ git clone https://github.com/bakkeby/flexipatch-finalizer
#

########################################################
### DWM Patches
########################################################
dwm-6.2-urg-border
dwm-alwayscenter-28208625-f84cac6
dwm-attachbottom-6.3
dwm-awesombar
dwm-bottomstuck
dwm-cool-autostart
  or dwm-autostart
dwm-centeredwindowname
dwm-cfacts-vanitygaps-6.2_combo
dwm-cyclelayouts-28188524-6.2
dwm-exitmenu-6.3
dwm-hide_vacant_tags
dwm-movestack-20211115
dwm-noborderfloatingfix-6.2
dwm-pertag-20200914
dwm-preservonrestart
dwm-resizecorners-6.2
dwm-restartsig-28188523-5.2
dwm-savefloats-20181212
dwm-scratchpads-20200414
dwm-satusallmons-6.2
dwm-swallow-6.3
dwm-togglefloatingcenter-20210806
dwm-warp-6.2
dwm-xresources-2020827


dwm-fakefullscreen
dwm-fullgaps-toggle
dwm-status2d
dwm-status2d-systray
dwm-titlecolor
dwm-doublepressquit

- copy patches to dwm dir
~$ patch -p1 < dwm-alwayscenter-.....diff

- if patching failed:
~$ vim dwm.c
:split dwm.c.rej


############################
## DWM Tiling Window Manager
############################
https://www.youtube.com/watch?v=JXVle0nyA-o
https://gitlab.com/linuxdabbler/suckless_software
suckless-tools ???

# Packages needed dwm after installation
## Picom 👉 декоратор. Скругление углов, блюр, прозрачность..
### Picom pikulius fork 👉🏻 https://github.com/pijulius/picom
### Picom jonaburg fork 👉🏻 https://github.com/jonaburg/picom
picom \

## Pywal 👉 это инструмент, который создает цветовую палитру из доминирующих
## цветов изображения. Затем он применяет цвета во всей системе и на лету во
## всех ваших любимых программах.
### 👉🏻 https://github.com/dylanaraps/pywal

## Pywalfox 👉 дополнение к темам Firefox и Thunderbird с вашими Pywal цветами
## с использованием официального Theme API от Mozilla
### 👉🏻 https://github.com/frewacom/pywalfox
### 👉🏻 https://addons.mozilla.org/en-US/firefox/addon/pywalfox/

## ChromiumPywal 👉 same, but for Chromium
### 👉🏻 https://github.com/metafates/ChromiumPywal

## numlockx 👉 enable NumLock in X11 sessions
numlockx \



########################################################
# Login as user & make first setup
########################################################

#Add user to sudoers with NOPASSWD

#reconfigure console
dpkg-reconfigure console-setup
#Refresh console 👉🏻 <ctrl> + l ("Small L")

#INSTALL TIMESHIFT & Create “startpoint” snapshot
apt install timeshift
timeshift --create

exit 0
