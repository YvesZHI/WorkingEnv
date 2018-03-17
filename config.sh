#!/bin/bash


sudo cp ca_huawei.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
read -p "configure proxy? [y/n]:" proxy
if [[ "$proxy" == "Y" || "$proxy" == "y" ]]; then
	./initProxy.sh
fi
./config_ip.sh $1 $2
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver-options http-proxy=$http_proxy --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo cp -r ./ros /etc/
sudo sed -i -e 's/hk/cn/g' /etc/apt/sources.list
read -p "add user mdc? [y/n]:" user
if [[ "$proxy" == "Y" || "$proxy" == "y" ]]; then
	sudo adduser mdc
	sudo passwd mdc
	sudo adduser mdc sudo
fi

