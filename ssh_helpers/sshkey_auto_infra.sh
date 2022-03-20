#! /bin/bash
USER=$(whoami)
DATE=$(date +'%d-%m-%Y')

mkdir -p ~/.ssh/infrakeys

# physical servers
ssh-keygen -o -a 256 -t ed25519 -C "$USER@xcp0.vanguard.net-$DATE" -f ~/.ssh/infrakeys/"$USER@xcp0.vanguard.net-$DATE" -q -N ""
ssh-keygen -o -a 256 -t ed25519 -C "$USER@nasshop.vanguard.net-$DATE" -f ~/.ssh/infrakeys/"$USER@nasshop.vanguard.net-$DATE" -q -N ""
ssh-keygen -o -a 256 -t ed25519 -C "$USER@gw0.vanguard.net-$DATE" -f ~/.ssh/infrakeys/"$USER@gw0.vanguard.net-$DATE" -q -N ""

#common vms
ssh-keygen -o -a 256 -t ed25519 -C "$USER@internal_gw1.vanguard.net-$DATE" -f ~/.ssh/infrakeys/"$USER@internal_gw1.vanguard.net-$DATE" -q -N ""
ssh-keygen -o -a 256 -t ed25519 -C "$USER@pihole.vanguard.net-$DATE" -f ~/.ssh/infrakeys/"$USER@pihole.vanguard.net-$DATE" -q -N ""
ssh-keygen -o -a 256 -t ed25519 -C "$USER@appserver.vanguard.net-$DATE" -f ~/.ssh/infrakeys/"$USER@appserver.vanguard.net-$DATE" -q -N ""
ssh-keygen -o -a 256 -t ed25519 -C "$USER@ldap.vanguard.net-$DATE" -f ~/.ssh/infrakeys/"$USER@ldap.vanguard.net-$DATE" -q -N ""
ssh-keygen -o -a 256 -t ed25519 -C "$USER@xoa.vanguard.net-$DATE" -f ~/.ssh/infrakeys/"$USER@xoa.vanguard.net-$DATE" -q -N ""
ssh-keygen -o -a 256 -t ed25519 -C "$USER@fog.vanguard.net-$DATE" -f ~/.ssh/infrakeys/"$USER@fog.vanguard.net-$DATE" -q -N ""

# proxy servers
ssh-keygen -o -a 256 -t ed25519 -C "$USER@proxy0.vanguard.net-$DATE" -f ~/.ssh/infrakeys/"$USER@proxy0.vanguard.net-$DATE" -q -N ""
ssh-keygen -o -a 256 -t ed25519 -C "$USER@proxy1.vanguard.net-$DATE" -f ~/.ssh/infrakeys/"$USER@proxy1.vanguard.net-$DATE" -q -N ""
ssh-keygen -o -a 256 -t ed25519 -C "$USER@proxy2.vanguard.net-$DATE" -f ~/.ssh/infrakeys/"$USER@proxy2.vanguard.net-$DATE" -q -N ""

mkdir -p ~/.ssh/conf.d
touch ~/.ssh/conf.d/infra_config

sudo cat << EOF > ~/.ssh/conf.d/infra_config 
# physical servers
Host xcp0
     Hostname 
     Port 2020
     User $USER
     IdentityFile ~/.ssh/infrakeys/$USER@xcp0.vanguard.net-$DATE

Host nasshop
     Hostname 
     Port 2020
     User $USER
     IdentityFile ~/.ssh/infrakeys/$USER@nasshop.vanguard.net-$DATE

Host gw0
     Hostname 
     Port 2020
     User $USER
     IdentityFile ~/.ssh/infrakeys/$USER@gw0.vanguard.net-$DATE

# common vms
Host gw1
     Hostname 
     Port 2020
     User $USER
     IdentityFile ~/.ssh/infrakeys/$USER@gw1.vanguard.net-$DATE

Host pihole
     Hostname 
     Port 2020
     User $USER
     IdentityFile ~/.ssh/infrakeys/$USER@pihole.vanguard.net-$DATE

Host app0
     Hostname 
     Port 2020
     User $USER
     IdentityFile ~/.ssh/infrakeys/$USER@appserver.vanguard.net-$DATE

Host ldap0
     Hostname 
     Port 2020
     User $USER
     IdentityFile ~/.ssh/infrakeys/$USER@ldap.vanguard.net-$DATE

Host xoa0
     Hostname 
     Port 2020
     User $USER
     IdentityFile ~/.ssh/infrakeys/$USER@xoa.vanguard.net-$DATE

Host fog
     Hostname 
     Port 22
     User $USER
     IdentityFile ~/.ssh/infrakeys/$USER@fog.vanguard.net-$DATE

# proxy servers
Host proxy0
     Hostname 
     Port 2020
     User $USER
     IdentityFile ~/.ssh/infrakeys/$USER@proxy0.vanguard.net-$DATE

Host proxy1
     Hostname 
     Port 2020
     User $USER
     IdentityFile ~/.ssh/infrakeys/$USER@proxy1.vanguard.net-$DATE

Host proxy2
     Hostname 
     Port 2020
     User $USER
     IdentityFile ~/.ssh/infrakeys/$USER@proxy2.vanguard.net-$DATE
EOF

cat ~/.ssh/conf.d/infra_config
echo "You will have to fill in the ips for the host"
echo "Now 'cat ssh_user_setup.sh' read the usage remarks to prvision existing structure"
echo "script useage './ssh_user_setup <default_username> <default_key> <remote server ip> <infra key to pass to server>'"

