#/bin/bash
osascript -e 'tell app "Terminal" to do script "mullvad disconnect && docker stop $(docker ps -q) && docker rm pihole && rm -rf ~/.Trash/*"'
osascript -e 'quit app "Firefox"'
osascript -e 'quit app "Google Chrome"'
sudo networksetup -setdnsservers Wi-Fi 1.1.1.1
