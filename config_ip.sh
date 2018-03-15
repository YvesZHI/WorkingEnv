#!/bin/bash


sudo cp interfaces_bak interfaces
sudo sed -i -e "s/NAME/$1/g" interfaces
sudo sed -i -e "s/IP/$2/g" interfaces
sudo mv interfaces /etc/network/
sudo /etc/init.d/networking restart
sudo service ssh restart

