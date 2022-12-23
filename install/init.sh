#!/usr/bin/env bash

# WARNING
# This is just the basic UNPACKER for SpotX-GUI.
# This unpacks essential items for the installer to run properly.
# If you're looking for the source to the actual installer,
# view the GitHub;
# https://github.com/QuarTheDev/SpotX-GUI-Linux

# vars
LICENSE=https://raw.githubusercontent.com/QuarTheDev/SpotX-GUI-Linux/main/install/license
INSTALLER=https://raw.githubusercontent.com/QuarTheDev/SpotX-GUI-Linux/main/install/spotx-gui-installer.sh
ICON32=https://raw.githubusercontent.com/QuarTheDev/SpotX-GUI-Linux/main/install/icon32x32.png
ICON64=https://raw.githubusercontent.com/QuarTheDev/SpotX-GUI-Linux/main/install/icon64x64.png
ICON128=https://raw.githubusercontent.com/QuarTheDev/SpotX-GUI-Linux/main/install/icon128x128.png
# vars

echo -e "Setting up installation directory...\n"
#INIT DIRECTORY
echo -e "Making folders..."
mkdir -p ~/.temp/
echo -e "Created ~/.temp/"
mkdir -p ~/.temp/icons/
echo -e "Created ~/.temp/icons/"
echo -e ""
echo -e "Downloading content..."
cd ~/.temp/
echo -e "Downloading license (1.04kb)"
curl -O -s $LICENSE
echo -e "Created ~/.temp/license\n"
echo -e "Downloading spotx-gui-installer.sh (12.1kb)"
curl -O -s $INSTALLER
echo -e "Created ~/.temp/spotx-gui-installer.sh\n"
cd ~/.temp/icons/
echo -e "Downloading icon32x32.png (2.17kb)"
curl -O -s $ICON32
echo -e "Created ~/.temp/license\n"
echo -e "Downloading icon64x64.png (5.73kb)"
curl -O -s $ICON64
echo -e "Created ~/.temp/spotx-gui-installer.sh\n"
echo -e "Downloading icon128x128.png (13.4kb)"
curl -O -s $ICON128
echo -e "Created ~/.temp/spotx-gui-installer.sh\n"
echo -e "Preparation completed. Launching installer..."

cd ~/.temp/ && bash spotx-gui-installer.sh
exit

# If i left behind any leftovers, use this;
rm -f -r ~/.temp/
