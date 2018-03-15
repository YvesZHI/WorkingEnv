#!/bin/bash


sudo cp ca_huawei.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
./config_ip.sh

./initProxy.sh

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver-options http-proxy=$http_proxy --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo cp -r ./ros /etc/

sudo sed -i -e 's/hk/cn/g' /etc/apt/sources.list

sudo adduser mdc
sudo adduser mdc sudo

