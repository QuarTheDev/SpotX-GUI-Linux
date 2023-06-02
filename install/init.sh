#!/usr/bin/env bash

# WARNING
# This is just the basic UNPACKER for SpotX-GUI.
# This unpacks essential items for the installer to run properly.
# If you're looking for the source to the actual installer,
# view the GitHub;
# https://github.com/QuarTheDev/SpotX-GUI-Linux

# vars
LICENSE="https://raw.githubusercontent.com/QuarTheDev/SpotX-GUI-Linux/main/install/license"
INSTALLER="https://raw.githubusercontent.com/QuarTheDev/SpotX-GUI-Linux/main/install/spotx-gui-installer.sh"
ICON32="https://raw.githubusercontent.com/QuarTheDev/SpotX-GUI-Linux/main/install/icon32x32.png"
ICON64="https://raw.githubusercontent.com/QuarTheDev/SpotX-GUI-Linux/main/install/icon64x64.png"
ICON128="https://raw.githubusercontent.com/QuarTheDev/SpotX-GUI-Linux/main/install/icon128x128.png"
# vars

printf "Setting up installation directory...\n\n"
#INIT DIRECTORY
printf "Making folders...\n"
mkdir -p ~/.temp/
printf "Created ~/.temp/\n"
mkdir -p ~/.temp/icons/
printf "Created ~/.temp/icons/\n\n"
printf ""
printf "Downloading content...\n\n"
cd ~/.temp/
printf "Downloading license\n"
wget -q $LICENSE
printf "Created ~/.temp/license\n\n"
printf "Downloading spotx-gui-installer.sh\n"
wget -q $INSTALLER
printf "Created ~/.temp/spotx-gui-installer.sh\n\n"
cd ~/.temp/icons/
printf "Downloading icon32x32.png\n"
wget -q $ICON32
printf "Created ~/.temp/license\n\n"
printf "Downloading icon64x64.png\n"
wget -q $ICON64
printf "Created ~/.temp/spotx-gui-installer.sh\n\n"

printf "Downloading icon128x128.png\n"
wget -q $ICON128
printf "Created ~/.temp/spotx-gui-installer.sh\n\n"
printf "Preparation completed. Launching installer...\n\n"

cd ~/.temp/ 
sh spotx-gui-installer.sh
printf "Removing temporary files...\n"
rm -rf ~/.temp:?
printf "Transaction complete\n"
exit
