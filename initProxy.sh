#!/bin/bash

echo "Please input your account and password:"
read -p "account:" username
read -p "password:" -s password
echo
echo "Please choose a proxy server, eg: openproxy.huawei.com:"
read -p "proxy server[proxy]:" proxy
escape_pass=`echo -ne $password|xxd -plain|tr -d '\n'|sed 's/\(..\)/%\1/g'`
export http_proxy=http://$username:$escape_pass@${proxy:-proxy}:8080/
export https_proxy=$http_proxy
echo "http_proxy=$http_proxy"
my_ips=`ip -f inet addr|grep global | awk '{print $2}'|awk -F/ '{print $1}'|tr '\n' ','`
host_names=`hostname -a | tr ' ' ','`
export no_proxy=127.0.0.1,.huawei.com,localhost,local,.local,$my_ips,$host_names
