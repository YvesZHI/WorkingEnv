#!/bin/bash


source ./setDBUS.sh

#res=$(gsettings set org.gnome.Vino enabled true 2>&1 >/dev/null)
#echo $res
#if [ -n "$res" ]; then
#	echo
#	echo "ERROR: do NOT run me as root or with sudo!"
#	echo
#	exit 1
#fi
gsettings set org.gnome.Vino enabled true 
gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino require-encryption false
gsettings set org.gnome.Vino use-alternative-port true
gsettings set org.gnome.Vino use-upnp true
gsettings set org.gnome.Vino authentication-methods "['vnc']"
gsettings set org.gnome.Vino alternative-port 5901
vino-passwd
