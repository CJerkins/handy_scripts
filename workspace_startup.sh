#/bin/bash

sudo chgrp multipass_users /var/run/multipass_socket

osascript -e 'tell app "Terminal" to do script "sh ~/docker/pihole/docker_run.sh"' -e 'quit app "Terminal"'
osascript -e 'tell app "Terminal" to do script "cd ~/Desktop/ && ls -ahl ~/Desktop/"'
osascript -e 'tell app "Terminal" to do script "cd ~/Documents/1.\ Active_Projects/1.\ fresh_projects/ && ls -ahl"'
osascript -e 'tell app "Terminal" to do script "cd ~/Documents/1.\ Active_Projects/1.\ fresh_projects/ && ls -ahl"'
osascript -e 'tell app "Terminal" to do script "cd ~/Desktop/ && sudo multipass list && curl ifconfig.io/ip && curl ifconfig.io/country_code"'
osascript -e 'tell app "Terminal" to do script "mullvad account get && mullvad relay set location us atl us167-wireguard && mullvad connect && sleep 5 && mullvad status && curl ifconfig.io/ip && curl ifconfig.io/country_code"'

open -a "Signal"
open -a "Slack"
open -a "Yubico Authenticator"
open -a "Joplin"
open -a "KeePassXC"
open -a "Visual Studio Code"

open -a "Google Chrome" "https://ifconfig.io"
open -a "Google Chrome" "https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox"
open -a "Google Chrome" "https://gitlab.com"

open -a "Firefox" "https://us-east-2.signin.aws.amazon.com"
open -a "Firefox" "https://portal.azure.com"
open -a "Firefox" "https://github.com/CJerkins"
open -a "Firefox" "https://www.terraform.io/docs/index.html"
open -a "Firefox" "https://docs.ansible.com/ansible/latest/index.html"
open -a "Firefox" "http://localhost/admin"

sudo networksetup -setdnsservers Wi-Fi 127.0.0.1


