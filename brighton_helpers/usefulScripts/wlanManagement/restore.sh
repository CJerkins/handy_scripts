#!/bin/bash


#purpose: set adapter to monitor mode and disable NetworkManger
#usage: sudo ./monLOL.sh <adapter>


#bring down <adapter>
sudo ip link set ${1} down
sleep 2

#set <adapter> to monitor mode
sudo iw ${1} set type managed
sleep 1

#kill services
sudo systemctl start NetworkManager.service
sleep 1
sudo systemctl start wpa_supplicant.service

#bring up <adapter>
sudo ip link set ${1} up


#check work
iwconfig ${1}


# revert to managed mode
