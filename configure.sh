#!/bin/bash



source ./setDBUS.sh

res=$(gsettings set org.gnome.Vino enabled true)
if [ -n "$res" ]; then
	echo "Do NOT run me as root."
	exit 1
fi
gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino require-encryption false
gsettings set org.gnome.Vino use-alternative-port true
gsettings set org.gnome.Vino use-upnp true
gsettings set org.gnome.Vino authentication-methods "['vnc']"
gsettings set org.gnome.Vino alternative-port 5901

