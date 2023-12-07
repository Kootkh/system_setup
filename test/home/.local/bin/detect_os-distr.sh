#!/bin/sh
# Detects which OS and if it is Linux then it will detect which Linux
# Distribution.

OS=`uname -s`
REV=`uname -r`
MACH=`uname -m`

GetVersionFromFile()
{
    VERSION=`cat $1 | tr "\n" ' ' | sed s/.*VERSION.*=\ // `
}

if [ "${OS}" = "SunOS" ] ; then
    OS=Solaris
    ARCH=`uname -p`
    OSSTR="${OS} ${REV}(${ARCH} `uname -v`)"
elif [ "${OS}" = "AIX" ] ; then
    OSSTR="${OS} `oslevel` (`oslevel -r`)"
elif [ "${OS}" = "Linux" ] ; then
    KERNEL=`uname -r`
    if [ -f /etc/redhat-release ] ; then
        DIST='RedHat'
        PSUEDONAME=`cat /etc/redhat-release | sed s/.*\(// | sed s/\)//`
        REV=`cat /etc/redhat-release | sed s/.*release\ // | sed s/\ .*//`
    elif [ -f /etc/SuSE-release ] ; then
        DIST='SuSE'
        DIST_VERSION=`cat /etc/SuSE-release | tr "\n" ' '| sed s/VERSION.*//`
        REV=`cat /etc/SuSE-release | tr "\n" ' ' | sed s/.*=\ //`
    elif [ -f /etc/mandrake-release ] ; then
        DIST='Mandrake'
        PSUEDONAME=`cat /etc/mandrake-release | sed s/.*\(// | sed s/\)//`
        REV=`cat /etc/mandrake-release | sed s/.*release\ // | sed s/\ .*//`
    elif [ -f /etc/debian_version ] ; then
        DIST='Debian'
        DIST_VERSION="`cat /etc/debian_version`"
        REV=""

    fi
    if [ -f /etc/UnitedLinux-release ] ; then
        DIST="${DIST}[`cat /etc/UnitedLinux-release | tr "\n" ' ' | sed s/VERSION.*//`]"
    fi

    OSSTR="${OS} ${DIST} ${REV}(${PSUEDONAME} ${KERNEL} ${MACH})"

fi

##echo ${OSSTR}
#echo OS: ${OS}
#echo DIST: ${DIST}
#echo DIST_VERSION: ${DIST_VERSION}
#echo REV: ${REV}
#echo PSUEDONAME: ${PSUEDONAME}
#echo KERNEL: ${KERNEL}
#echo MACH: ${MACH}



################################################################################
# Debian specific fecth
################################################################################
#user=$USER@
#OS="$(lsb_release -sirc)"
#Desktop="${XDG_CURRENT_DESKTOP}"
#Kernel="$(uname -sr)"
#Uptime="$(uptime -p | sed 's/up //')"
#Packages="$(dpkg -l | grep -c ^i)"
#Shell="$(basename "$SHELL")"
#CPU="$(lscpu | grep Model\ name | sed 's/name:\ //' | sed "s/([^)]*)/()/g" | sed 's/[)(]//g')"
#GPU="$(glxinfo -B | grep Device: | sed "s/([^)]*)/()/g" | sed 's/[)(]//g')"
#RAM="$(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
#IP="$(hostname -I | awk '{print $1}')"
#
#
#echo '          _,met$$$$$gg.        '            $user$(hostname)
#echo '       ,g$$$$$$$$$$$$$$$P.     '            OS: $OS
#echo '     ,g$$P""       """Y$$.".   '            Desktop: $Desktop
#echo '    ,$$P"              `$$$."  '            Kernel: $Kernel
#echo '   ,$$P       ,ggs.     `$$b:  '            Uptime: $Uptime
#echo '  `d$$"     ,$P""   .    $$$   '            Packages: $Packages
#echo '   $$P      d$"     ,    $$P   '            Shell: $Shell
#echo '   $$:      $$.   -    ,d$$"   '            CPU: $CPU
#echo '   $$\;      Y$b._   _,d$P     '            GPU: $GPU
#echo '   Y$$.    `.`"Y$$$$P""        '            RAM: $RAM
#echo '   `$$b      "-.__             '            IP:  $IP
#echo '    `Y$$                       '
#echo '     `Y$$.                     '
#echo '       `$$b.                   '
#echo '         `Y$$b.                '
#echo '            `"Y$b._            '
#echo '                `""""          '

