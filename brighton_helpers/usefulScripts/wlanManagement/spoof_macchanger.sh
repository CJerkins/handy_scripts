#!/bin/bash


#usage: sudo ./spoof_macchanger.sh <adapter>

#bring down <adapter>
sudo ip link set ${1} down
sleep 2

#spoof <adapter> to a random MAC with a listed OUI
sudo macchanger -A ${1}
sleep 1

#bring up <adapter>
sudo ip link set ${1} up


#check work
ip a | grep -A 1 ${1}
