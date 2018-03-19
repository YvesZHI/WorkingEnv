#!/bin/bash


version=`lsb_release -r | awk '{print $2}'`

if [ "$version" == "16.04" ];then
	sudo cp interfaces_bak interfaces
	sudo sed -i -e "s/NAME/$1/g" interfaces
	sudo sed -i -e "s/IP/$2/g" interfaces
	sudo mv interfaces /etc/network/
	sudo /etc/init.d/networking restart
else
	sudo cp 01-netcfg.yaml_bak 01-netcfg.yaml
	sudo sed -i -e "s/NAME/$1/g" 01-netcfg.yaml
	sudo sed -i -e "s/IP/$2/g" 01-netcfg.yaml
	sudo mv 01-netcfg.yaml /etc/netplan/
	sudo netplan apply
fi

sudo service ssh restart
