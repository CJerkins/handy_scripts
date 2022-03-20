#/bin/bash

NAME=$1

sudo chgrp multipass_users /var/run/multipass_socket
rm ~/.ssh/known_hosts

echo "
#cloud-config
users:
  - default
  - name: drok
    groups: admin
    shell: /bin/bash
    lock_passwd: true
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh_authorized_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAzBbPDTD4HG9XkuSPiJ9ow8+XtDrQZ68MYAUMoezWHz drok@local.drokdev.pro

# add each entry to ~/.ssh/authorized_keys for the configured user or the
# first user defined in the user definition directive.
# ssh_authorized_keys:
#   - ssh-rsa ()

# Update apt database on first boot (run 'apt-get update').
# Note, if packages are given, or package_upgrade is true, then
# update will be done independent of this setting.
#
# Default: false
# Aliases: apt_update
package_update: true
package_upgrade: true

# Install additional packages on first boot
#
# Default: none
#
# if packages are specified, this apt_update will be set to true
#
# packages may be supplied as a single package name or as a list
# with the format [<package>, <version>] wherein the specifc
# package version will be installed.
packages:
 - vim
 - curl
 - wget
 - git
 - openssl
 - openvpn 
#  - apt-transport-https 
#  - ca-certificates 
#  - software-properties-common
#  - ansible
#  - ansible-lint
#  - pip
#  - yamllint
#  - terraform

# runcmd:
#  - curl -fsSL https://get.docker.com -o get-docker.sh
#  - sudo sh get-docker.sh
#  - sudo usermod -aG docker drok


final_message: \"The system is finally up, after $UPTIME seconds\"\
" > cloud-config.yml

multipass launch -n $NAME --cloud-init cloud-config.yml && multipass mount ~/Documents/1.\ Active_Projects/1.\ fresh_projects $NAME

rm cloud-config.yml

SSH_IP=$(multipass info $NAME | grep IPv4 | awk '{print $2}' )
ssh $SSH_IP

#read -p "Press enter to exit and delete instance"

#multipass stop $NAME && multipass delete -p $NAME
