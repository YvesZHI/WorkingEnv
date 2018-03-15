#!/bin/bash



arr=($(ls /sys/class/net/))
#unset 'arr[${#arr[@]}-1]'
dello=('lo')
arr=( "${arr[@]/$dello}" )

for i in "${arr[@]}"; do
	./config_ip.sh "$i" $1
	if [ $? -eq 0 ]; then
		exit 0
	fi
done
echo "None of configuration of network interfaces succeeded."
