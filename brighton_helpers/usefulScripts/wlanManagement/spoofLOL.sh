#!/bin/bash

#purpose: set <adapter> to a random iphone mac address
#usage: sudo ./spoof.sh <adapter> <xx:yy:zz>

#bring down <adapter>
sudo ip link set ${1} down
sleep 2

#spoof <adapter> to a random MAC with a listed OUI
sudo ip link set ${1} address 18:f1:d8:${2}
sleep 1

#bring up <adapter>
sudo ip link set ${1} up


#check work
ip a | grep -A 1 ${1}
