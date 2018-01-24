#!/bin/bash


if [[ "$1" == "none" ]]; then
	gsettings set org.gnome.Vino authentication-methods "['none']"
	exit 0
fi

gsettings set org.gnome.Vino authentication-methods "['vnc']"
vino-passwd
