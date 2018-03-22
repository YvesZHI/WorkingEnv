#!/bin/bash


sudo tar -cvpzf $1.tar.gz --exclude=/home --one-file-system /
sudo mv $1.tar.gz /home/snapshot/
