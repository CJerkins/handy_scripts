#!/bin/bash


#usage: sudo ./monLOL.sh <adapter>

#bring down <adapter>
sudo ip link set ${1} down
sleep 2

#spoof <adapter> to a random MAC with a listed OUI
sudo iw ${1} set monitor none
sleep 1

#bring up <adapter>
sudo ip link set ${1} up


#check work
iwconfig ${1}
