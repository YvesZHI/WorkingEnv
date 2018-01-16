#!/bin/sh
#author:dongjinguang@huawei.com

echo "================Update apt-get================="
sudo apt-get update
sudo apt-get install -y build-essential libcurl4-openssl-dev libexpat1-dev gettext libz-dev libssl-dev autoconf

echo "==============Download git v2.13.0=============="
wget https://github.com/git/git/archive/v2.13.0.tar.gz -O git.tar.gz --no-check-certificate
tar -zxf git.tar.gz
cd git-*

echo "==============Make git configure==============="
make configure
./configure --prefix=/usr

echo "==============Install git and deps============="
sudo make install
echo "==============Install successfully============="


