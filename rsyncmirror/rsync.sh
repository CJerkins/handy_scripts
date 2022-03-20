#! /bin/bash

# usage run command with ./rsync.sh <number of vms>
# rsync bash script syncs ansible scripts to adminhost

rsync -avzhe ssh --delete --progress ansible.cfg admin@172.16.10.25:~/ansible/
rsync -avzhe ssh --delete --progress inventory/hosts admin@172.16.10.25:~/ansible/inventory/
rsync -avzhe ssh --delete --progress inventory/group_vars/ admin@172.16.10.25:~/ansible/inventory/group_vars/
rsync -avzhe ssh --delete --progress inventory/host_vars/ admin@172.16.10.25:~/ansible/inventory/host_vars/
rsync -avzhe ssh --delete --progress playbooks/drokdev/ admin@172.16.10.25:~/ansible/playbooks/drokdev/
rsync -avzhe ssh --delete --progress roles/apache/ admin@172.16.10.25:~/ansible/roles/apache/
rsync -avzhe ssh --delete --progress roles/docker/ admin@172.16.10.25:~/ansible/roles/docker/
rsync -avzhe ssh --delete --progress roles/firewall/ admin@172.16.10.25:~/ansible/roles/firewall/
rsync -avzhe ssh --delete --progress roles/freeipa/ admin@172.16.10.25:~/ansible/roles/freeipa/
rsync -avzhe ssh --delete --progress roles/init_setups/ admin@172.16.10.25:~/ansible/roles/init_setups/
rsync -avzhe ssh --delete --progress roles/install-freeipa/ admin@172.16.10.25:~/ansible/roles/install-freeipa/
rsync -avzhe ssh --delete --progress roles/nginx/ admin@172.16.10.25:~/ansible/roles/nginx/
rsync -avzhe ssh --delete --progress roles/openvpn/ admin@172.16.10.25:~/ansible/roles/openvpn/
rsync -avzhe ssh --delete --progress roles/podman/ admin@172.16.10.25:~/ansible/roles/podman/
rsync -avzhe ssh --delete --progress roles/repo/ admin@172.16.10.25:~/ansible/roles/repo/
rsync -avzhe ssh --delete --progress roles/sftp/ admin@172.16.10.25:~/ansible/roles/sftp/
rsync -avzhe ssh --delete --progress roles/takserver/ admin@172.16.10.25:~/ansible/roles/takserver/
rsync -avzhe ssh --delete --progress roles/wireguard/ admin@172.16.10.25:~/ansible/roles/wireguard/

