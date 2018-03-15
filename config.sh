#!/bin/bash


sudo cp ca_huawei.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
sudo cp interfaces_bak interfaces
sudo sed -i -e "s/NAME/$1/g" interfaces
sudo sed -i -e "s/IP/$2/g" interfaces
sudo mv interfaces /etc/network/
sudo /etc/init.d/networking restart
sudo service ssh restart

./initProxy.sh

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver-options http-proxy=$http_proxy --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo cp -r ./ros /etc/

sudo sed -i -e 's/hk/cn/g' /etc/apt/sources.list

sudo adduser mdc
sudo adduser mdc sudo

