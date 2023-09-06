#!/bin/bash

#Usage: Obtain a VPS (vultr, linode, digitalocean, etc.), collect required information (Ports, IP addresses, usernames, etc.), and run the ./RevSSH.sh on the leave-behind host while it is connected to the the Internet. 

read -p "Pi SSH Port: " piPort
read -p "Pi Reverse Port: " piRevPort
read -p "VPS IPv4 Address: " vpsIP
read -p "VPS SSH Port: " vpsPort
read -p "VPS Username: " vpsUser
echo ""
#Confirmation of input
echo "Pi SSH Port:  $piPort" 
echo "Pi Reverse Port:  $piRevPort"
echo "VPS IPv4 Address: $vpsIP"
echo "VPS SSH Port:  $vpsPort"
echo "VPS Username:  $vpsUser"
echo ""
read -n 1 -r -s -p $'Press enter to continue if the values above are correct. Otherwise "Ctrl + c" to reenter...\n'


#cleanup
rm $HOME/jumpbox.sh 2> /dev/null
rm $HOME/.ssh/pi2$vpsIP 2> /dev/null
rm $HOME/.ssh/pi2$vpsIP.pub 2> /dev/null

#Keygen and distro
ssh-keygen -t ecdsa -b 384 -f $HOME/.ssh/pi2$vpsIP -q -N ""
ssh-copy-id -i $HOME/.ssh/pi2$vpsIP.pub -p $vpsPort $vpsUser@$vpsIP
# Will be prompted for VPS authentication 

sleep 2

#Create startup script with RevSSH vars
echo "sleep 60" > $HOME/jumpbox.sh 
echo "ssh -fN -R $piRevPort:localhost:$piPort $vpsUser@$vpsIP -p $vpsPort -i $HOME/.ssh/pi2$vpsIP">> $HOME/jumpbox.sh
chmod +x $HOME/jumpbox.sh



#Ensure new key works and provides remote access
echo "########################Check your work########################"
echo "[1] Test VPS private key: ssh $vpsUser@$vpsIP -p $vpsPort -i $HOME/.ssh/pi2$vpsIP"
echo "[2] Copy '@reboot sleep 60 && bash ~/jumpbox.sh' to a new line: crontab -e"
echo "[3] Reboot pi: sudo reboot"
echo "[4] From non-pi workstation, login to VPS and confirm reverese tunnel was created: ssh $USER@localhost -p $piRevPort' #Use pi_user password."
