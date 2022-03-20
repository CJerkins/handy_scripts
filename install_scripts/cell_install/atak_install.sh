#!/bin/sh
# Before running the script make sure to have the atak apk and pluggin apks in the atak_apks folder. 
# Any data packages or preference file, they go in the atak_prefs folder.
# Also in sure you have set the environment for fastboot and adb. Use this line as an example:
# export PATH="/Users/username/platform-tools:$PATH"


while true; do
    read -p "Do you have the apks, vpn, prefs, and datapackage files in the correct folders?(y/n)" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "!!!!"; echo "Read top of this script for directions. HINT: 'cat atak_install.sh'."; echo "!!!!"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


if ! [ $($(which fastboot) --version | grep "version" | cut -c18-23 | sed 's/\.//g' ) -ge 2802 ]; then
  echo "fastboot too old; please download the latest version at https://developer.android.com/studio/releases/platform-tools.html"
  exit 1
fi

# Install atak and plugins
echo "Installing ATAK and Plugins"
adb install atak_apks/ATAK-4*.apk
for file in atak_apks/ATAK-Plugin-*.apk
do
  adb install $file 
done

# Load vpn config
adb push atak_apks/atak_vpn/* /sdcard/Download/

# Load prefs files and datapackages
read -p "Do you have prefs.xml file?(y/n)" answer
case $answer in
  y)
    echo "Loading pref.xml file"
    adb push atak_apks/atak_prefs/*.xml /sdcard/atak/config/prefs/
    ;;
  n)
    continue
    ;;
  *)
    ;;
esac
# Load datapackages
read -p "Do you have datapackages you like uploaded?(y/n)" answer
case $answer in
  y)
    echo "Loading datapachage"
    adb push atak_apks/atak_prefs/*.zip /sdcard/atak/tools/datapackage/
    ;;
  n)
    continue
    ;;
  *)
    ;;
esac

echo "Install complete"