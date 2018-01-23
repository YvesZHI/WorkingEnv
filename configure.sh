#!/bin/bash


name=`whoami`
if [[ "$name" == "root" ]]; then
	read -p "Execute configure.sh as root may cause some permisson issue, are you sure to continue? y/n:" reply
	if [[ "$reply" != "y" ]]; then
		exit 0
	fi
fi

if [[ "$1" == "noautologin" ]]; then
	sudo rm -f /etc/lightdm/lightdm.conf
	exit 0
fi

if [ ! -f /etc/lightdm/lightdm.conf ]; then
	sudo touch /etc/lightdm/lightdm.conf
fi

res=$(grep "autologin-user=$name" /etc/lightdm/lightdm.conf | wc -l)

if [[ $res == 0 ]]; then
	echo -e "[SeatDefaults]\nautologin-user=$name" | sudo tee -a /etc/lightdm/lightdm.conf > /dev/null
	echo 'Reboot to finish the configuration.'
	echo 'You need to execute ./configure.sh again after the next login. y/n:'
	read input
	if [[ "$input" != "y" ]]; then
		echo 'Abort'
		exit 0
	fi
	echo 'Reboot in 5 seconds...'
	sleep 5
	sudo shutdown -r now
fi


source ./setDBUS.sh

res=$(gsettings set org.gnome.Vino enabled true 2>&1 >/dev/null)
if [ -n "$res" ]; then
	echo $res
	exit 1
fi
gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino require-encryption false
gsettings set org.gnome.Vino use-alternative-port true
gsettings set org.gnome.Vino use-upnp true
if [[ "$1" == "" ]]; then
	port=5901
else
	port=$1
fi
gsettings set org.gnome.Vino alternative-port $port

# disable keyring
sudo mv /usr/bin/gnome-keyring-daemon /usr/bin/gnome-keyring-daemon-old 2>/dev/null
sudo killall gnome-keyring-daemon 2>/dev/null

echo "$port is used to build remote desktop."
echo "Please configure your viewer as x.x.x.x:$port"
# the gsettings below must be executed AFTER the disable keyring above
gsettings set org.gnome.Vino authentication-methods "['none']"
