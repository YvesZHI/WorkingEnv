#!/bin/bash

echo "Please input your account and password:"
read -p "account:" username
read -p "password:" -s password
echo
echo "Please choose a proxy server, eg: openproxy.huawei.com:"
read -p "proxy server[proxy]:" proxy
escape_pass=`echo -ne $password|xxd -plain|tr -d '\n'|sed 's/\(..\)/%\1/g'`
http_proxy=http://$username:$escape_pass@${proxy:-proxy}:8080/
echo "http_proxy=$http_proxy"
https_proxy=${http_proxy/http/https}
ftp_proxy=${http_proxy/http/ftp}
touch ~/.wgetrc
sed -i '/http_proxy/c\' ~/.bashrc ~/.wgetrc
sed -i '/https_proxy/c\' ~/.bashrc ~/.wgetrc
sed -i '/ftp_proxy/c\' ~/.bashrc ~/.wgetrc
sudo sed -i '/http_proxy/c\' /etc/profile /etc/wgetrc
sudo sed -i '/https_proxy/c\' /etc/profile /etc/wgetrc
sudo sed -i '/ftp_proxy/c\' /etc/profile /etc/wgetrc
echo "export http_proxy=\"$http_proxy\"" | tee -a ~/.bashrc > /dev/null
echo "export https_proxy=$https_proxy" | tee -a ~/.bashrc > /dev/null
echo "export ftp_proxy=$ftp_proxy" | tee -a ~/.bashrc > /dev/null
echo "http_proxy=$http_proxy" | tee -a ~/.wgetrc > /dev/null
echo "https_proxy=$https_proxy" | tee -a ~/.wgetrc > /dev/null
echo "ftp_proxy=$ftp_proxy" | tee -a ~/.wgetrc > /dev/null
echo "export http_proxy=\"$http_proxy\"" | sudo tee -a /etc/profile > /dev/null
echo "export https_proxy=$https_proxy" | sudo tee -a /etc/profile > /dev/null
echo "export ftp_proxy=$ftp_proxy" | sudo tee -a /etc/profile > /dev/null
echo "http_proxy=$http_proxy" | sudo tee -a /etc/wgetrc > /dev/null
echo "https_proxy=$https_proxy" | sudo tee -a /etc/wgetrc > /dev/null
echo "ftp_proxy=$ftp_proxy" | sudo tee -a /etc/wgetrc > /dev/null
echo "Acquire::http::proxy \"$http_proxy\";" | sudo tee /etc/apt/apt.conf > /dev/null
echo "Acquire::https::proxy \"$https_proxy\";" | sudo tee -a /etc/apt/apt.conf > /dev/null
echo "Acquire::ftp::proxy \"$ftp_proxy\";" | sudo tee -a /etc/apt/apt.conf > /dev/null
echo "Acquire::http::Pipeline-Depth 0;" | sudo tee -a /etc/apt/apt.conf > /dev/null
echo "Acquire::https::Pipeline-Depth 0;" | sudo tee -a /etc/apt/apt.conf > /dev/null
echo "Acquire::http::No-Cache true;" | sudo tee -a /etc/apt/apt.conf > /dev/null
echo "Acquire::https::No-Cache true;" | sudo tee -a /etc/apt/apt.conf > /dev/null
echo "Acquire::BrokenProxy true;" | sudo tee -a /etc/apt/apt.conf > /dev/null
my_ips=`ip -f inet addr|grep global | awk '{print $2}'|awk -F/ '{print $1}'|tr '\n' ','`
host_names=`hostname -a | tr ' ' ','`
export no_proxy=127.0.0.1,.huawei.com,localhost,local,.local,$my_ips,$host_names
git config --global http.proxy $http_proxy
git config --global https.proxy $https_proxy
exec bash  # source ~/.bashrc
