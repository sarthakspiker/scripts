#!/bin/bash

clear

#get superuser perms

sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

#Android
echo Installing Android Dependencies!
sudo apt-add-repository ppa:openjdk-r/ppa -y
sudo apt update -y
sudo apt install git-core python gnupg flex bison gperf libsdl1.2-dev libesd0-dev \
squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-8-jre openjdk-8-jdk pngcrush \
schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev \
gcc-multilib liblz4-* pngquant ncurses-dev texinfo gcc gperf patch libtool \
automake g++ gawk subversion expat libexpat1-dev python-all-dev bc libcloog-isl-dev \
libcap-dev autoconf libgmp-dev build-essential gcc-multilib g++-multilib pkg-config libmpc-dev libmpfr-dev lzma* \
liblzma* w3m android-tools-adb ccache maven ncftp htop -y
echo Dependencies have been installed
echo repo has been Downloaded!

#ubuntu restricted extras
echo installing ubuntu restricted extras
apt-get install ubuntu-restricted-extras

#VLC
echo installing VLC
sudo apt-get install vlc

#TLP
echo installing TLP
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw

#Arc Theme
echo installing arc theme
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"
sudo apt-get update
sudo apt-get install arc-theme

echo comleting setup 
if [ ! "$(which adb)" == "" ];
then
echo Setting up USB Ports
sudo curl --create-dirs -L -o /etc/udev/rules.d/51-android.rules -O -L https://raw.githubusercontent.com/snowdream/51-android/master/51-android.rules
sudo chmod 644   /etc/udev/rules.d/51-android.rules
sudo chown root /etc/udev/rules.d/51-android.rules
sudo service udev restart
adb kill-server
sudo killall adb
fi


echo All done ! Have fun !
