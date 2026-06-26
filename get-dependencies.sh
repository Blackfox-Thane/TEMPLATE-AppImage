#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
sudo pacman -Syu --noconfirm minizip \
							 qt6-base \
							 kvantum \
							 qt6ct \
							 lxqt-qtplugin \

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
./get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
# sudo ./make-aur-package doomrunner

# If the application needs to be manually built that has to be done down here
echo "Getting app..."
echo "---------------------------------------------------------------"
wget https://github.com/Youda008/DoomRunner/releases/download/v1.9.2/DoomRunner-1.9.2-Linux-x86_64-dynamic_exe.zip
unzip ./DoomRunner-1.9.2-Linux-x86_64-dynamic_exe.zip -d ./AppDir/bin
