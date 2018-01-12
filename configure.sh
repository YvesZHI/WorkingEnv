#!/bin/bash


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
gsettings set org.gnome.Vino authentication-methods "['vnc']"
gsettings set org.gnome.Vino alternative-port 5901
vino-passwd
