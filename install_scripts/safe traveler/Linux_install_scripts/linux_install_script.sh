#! /bin/bash
# paste folder in the user Desktop. linux_install_script. sudo ./linux_insttall_script

user=$(logname)
install_dir=$(/home/$user/Desktop)
PROFILE_FIREFOX=$(find /home/$user/.mozilla/firefox/*.default-release | grep /home/$user/.mozilla/firefox/*.default-release | cut -d'/' -f6- | cut -d/ -f1 | sort | uniq)
PATH_FIREFOX="/home/$user/.mozilla/firefox/$PROFILE_FIREFOX"

### install apt-get ###
rm -rf /etc/apt/preferences.d/nosnap.pref
apt-get update -y
apt-get install unzip wget vim snapd neofetch -y

### INSTALL VERACRYPT ###
wget -O /opt/veracrypt-1.24-Update4-setup.tar.bz2 https://launchpad.net/veracrypt/trunk/1.24-update4/+download/veracrypt-1.24-Update4-setup.tar.bz2
tar -C /opt/ -xjf /opt/veracrypt*.tar.bz2
sh /opt/veracrypt-*-setup-gui-x64
rm -rf /opt/veracrypt-1.24-Update4-setup.tar.bz2

### launch neofetch when openterminal ##
echo 'neofetch' >> /home/$user/.bashrc

### install snap apps ###
snap install vlc wickrpro vlc joplin-james-carroll keepassxc
echo 'export PATH=$PATH:/snap/bin' >> /home/$user/.bashrc

cp desktop_cuts/*.desktop ../
chown -R $user:$user ../*.desktop

### install tor ###
wget -O /$install_dir/tor-browser-linux64-9.5.4_en-US.tar.xz https://www.torproject.org/dist/torbrowser/9.5.4/tor-browser-linux64-9.5.4_en-US.tar.xz
tar -C /$install_dir/ -xvf  /$install_dir/tor-browser-linux64-9.5.4_en-US.tar.xz
rm -rf /home/$user/Desktop/tor-browser-linux64-*.tar.xz
chown -R $user:$user /home/$user/Desktop/tor-browser_en-US

### install apt apps ###
apt-get install wireguard -y

### harden firefox ###
echo "Installing user.js file to harden firefox, TO THE MAX"
sleep 5
echo "You will need to install your own extensions"                                                  
cp user.js $PATH_FIREFOX

history -c
echo "rebooting in 10 secs..."
sleep 10
reboot





### install joplin ###
# wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash

### download appimages and install ###
#mkdir -p /home/$user/Desktop/AppImages/
#cd /home/$user/Desktop/AppImages/
# wget https://github.com/keepassxreboot/keepassxc/releases/download/2.6.1/KeePassXC-2.6.1-x86_64.AppImage
#cd
