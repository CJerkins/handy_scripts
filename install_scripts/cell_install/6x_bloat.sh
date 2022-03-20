#!/bin/sh
# Before running the script make sure to have the apks are in the correct folders. 
# Any vpn config files place in the vpn_configs folder.
# Also in sure you have set the environment for fastboot and adb. Use this line as an example:
# export PATH="/Users/username/platform-tools:$PATH"

654196eb4b727ecbc296a8055a9e4c96c77b1ab631a60e88503ec04b0340d265

while true; do
    read -p "Do you have the apks in the correct folders?(y/n)" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "!!!!"; echo "Read top of this script for directions. HINT: 'cat 6x_bloat.sh' and checkout the app_pile folder for ideas."; echo "!!!!"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


if ! [ $($(which fastboot) --version | grep "version" | cut -c18-23 | sed 's/\.//g' ) -ge 2802 ]; then
  echo "fastboot too old; please download the latest version at https://developer.android.com/studio/releases/platform-tools.html"
  exit 1
fi

echo "Installing Secure Chat apps"
for file in 6x_chat_apps/*.apk
do
  adb install $file 
done
echo " You will need to download and install CELLCRYPT at the playstore"

echo "Installing VPN client apps"
for file in vpn_bloat/*.apk
do
  adb install $file 
done

echo "Installing safe traveler fluff"
for file in 6x_bloat/*.apk
do
  adb install $file 
done

read -p "Do you have any vpn configs to upload?(y/n)" answer
case $answer in
  y)
    echo "Uploading VPN configs. You will find them in the Downloads folder"
    adb push vpn_configs/* /sdcard/Download/
    echo "!!!"
    echo "Uploaded to device download folder"
    echo "!!!"
    ;;
  n)
    continue
    ;;
  *)
    ;;
esac


read -p "Do you want additional privacy apps?(y/n)" answer
case $answer in
  y)
    echo "Installing the next level shit"
    for file in defcon4_apps/*.apk
	do
	  adb install $file 
	done
    ;;
  n)
    continue
    ;;
  *)
    ;;
esac
echo " You will need to download and install TAILSCALE at the playstore"


echo "6x bloatware installed"