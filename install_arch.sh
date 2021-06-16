#!/bin/bash
echo "Welcome to Shankar's featherOS install script!"
echo "Please enter the username"
read varuser
id -u $varuser > /dev/null
if [ $? -ne 0 ]; then
	echo "The user is not valid"
	exit -1
fi
cd /opt/featherOS/dwm-6.2/
make clean install
make clean
cd ../st-0.8.4
make clean install
make clean
cd ../dmenu-5.0
make clean install
make clean
cd ../
chsh -s /bin/zsh $varuser
cp .zshrc /home/$varuser/.zshrc
chown $varuser.$varuser /home/$varuser/.zshrc
cp .xinitrc /home/$varuser/.xinitrc
chown $varuser.$varuser /home/$varuser/.xinitrc
cp ./dircolors-solarized/dircolors.256dark /home/$varuser/.dir_colors
