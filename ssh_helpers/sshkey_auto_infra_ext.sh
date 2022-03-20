#! /bin/bash
USER=$(whoami)
DATE=$(date +'%d-%m-%Y')


ssh_user_setup () {
    read -p "What is the default user for this vm?(): " default_user
    read -p "Where is the default ssh key for this vm?(): " default_key
    read -p "Where is the new public key for this vm?(): " infra_public_key
    read -p "What is the ip address for this vm?(): " IP

    ssh -i $default_key $default_user@$IP "sudo useradd -m -s /bin/bash \"$USER\" && sudo usermod -aG sudo \"$USER\" && sudo mkdir /home/\"$USER\"/.ssh && sudo cp /home/\"$default_user\"/.ssh/authorized_keys /home/\"$USER\"/.ssh && sudo chown -R \"$USER\":\"$USER\" /home/\"$USER\""
    ssh -T -i $default_key $default_user@$IP "echo \"$USER\"  ALL=\"(\"ALL\")\" NOPASSWD:ALL | sudo tee /etc/sudoers.d/\"$USER\""
    ssh-copy-id -f -i infrakeys/$infra_public_key -o "IdentityFile \"$default_key\"" $USER@$IP
    ssh -i infrakeys/$(echo "${infra_public_key::-4}") $USER@$IP "sed -i '/$default_key/d' ~/.ssh/authorized_keys"

    sed -i '/$(echo $(echo "${infra_public_key::-4}") | cut -d'.' -f 1 | cut -d'@' -f 2)/,+5d' ~/.ssh/conf.d/infra_config
    cat << EOF >> ~/.ssh/conf.d/infra_config 
# add by ssh_user_setup function
Host $(echo $(echo "${infra_public_key::-4}") | cut -d'.' -f 1 | cut -d'@' -f 2)
     Hostname $IP
     Port 2020
     User $USER
     IdentityFile ~/.ssh/infrakeys/$(echo "${infra_public_key::-4}")
EOF


    # Verify the changes were made
    echo "Verify user is correct, the default_key was deleted from new user profile, and sudoers input"
    ssh -i infrakeys/$(echo "${infra_public_key::-4}") $USER@$IP "whoami"
    ssh -i infrakeys/$(echo "${infra_public_key::-4}") $USER@$IP "cat ~/.ssh/authorized_keys"
    ssh -i infrakeys/$(echo "${infra_public_key::-4}") $USER@$IP "sudo cat /etc/sudoers.d/\"$USER\""


    # Delete default user
    read -p "Would you like to delete default user?(yes or no): " default_user_del

    case $default_user_del in
      [yY] | [yY][Ee][Ss] )
        read -p "Verify you can still ssh to new user using the new keys and sudo without password?(y/n): " verify_funct
        case $verify_funct in
         [yY] | [yY][Ee][Ss] )
                ssh -i infrakeys/$(echo "${infra_public_key::-4}") $USER@$IP "sudo pkill -u \"$default_user\""
                ssh -i infrakeys/$(echo "${infra_public_key::-4}") $USER@$IP "sudo userdel $default_user && sudo rm -r /home/$default_user"
                ;;
              [nN] | [n|N][O|o] )
              exit 1
              ;;
            *)
                ;;
           esac
         ;;
      [nN] | [n|N][O|o] )
        exit 1
        ;;
      *)
        ;;
    esac

}


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
     Port 2020
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


while :
do
    read -p "Do you want to setup a new user to any existing VMs?(yes or no) Fully type word!: " create_new_user
    ls ~/.ssh/infrakeys/*.pub 
    if [ "$create_new_user" = "no" ]; then
        cat ~/.ssh/conf.d/infra_config
        echo "You will have to fill in the ips for the hostname in the ssh config file"
        echo "Now 'cat ssh_user_setup.sh' read the usage remarks to prvision existing structure"
        echo "script useage './ssh_user_setup <default_username> <default_key> <remote server ip> <infra key to pass to server>'"
        break
    else
        ssh_user_setup
    fi
done





