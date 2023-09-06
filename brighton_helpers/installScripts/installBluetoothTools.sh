#!/bin/bash

#Usage: create a directory on Desktop called bluetooth (mkdir ~/Desktop/bluetooh) and change directory to that folder (cd ~/Desktop/bluetooth), then run this script (sudo ./installBluetoothTools.sh). Finally, cd into blue_hydra and run "bundle install"

#Install depends
sudo apt update
sudo apt install bluez bluez-test-scripts python3-bluez python3-dbus libsqlite3-dev ubertooth ruby-dev bundler

sleep 1

#clone blue hydra repo
git clone https://github.com/ZeroChaos-/blue_hydra.git



#clone blue sonar repo

git clone https://github.com/ZeroChaos-/blue_sonar.git


