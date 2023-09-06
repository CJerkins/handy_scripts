#!/bin/bash

#purpose: set adapter to monitor mode and disable NetworkManger
#usage: sudo ./monLOL.sh <adapter>


#bring down <adapter>
sudo ip link set ${1} down
sleep 2

#set <adapter> to monitor mode
sudo iw ${1} set monitor none
sleep 1

#kill services
sudo systemctl stop NetworkManager.service
sudo systemctl stop wpa_supplicant.service

#bring up <adapter>
sudo ip link set ${1} up

#test
while true; do
        if iwconfig ${1} | grep -i -q  "Mode:Monitor"; then
zenity --info --text "WNIC ${1} set to monitor mode"
    break
  fi
  sleep 1
done
#check work
#iwconfig ${1}

