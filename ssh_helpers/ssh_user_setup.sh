#! /bin/bash
# useage ./ssh_user_setup <default_username> <default_key> <remote server ip> <infra key to pass to server>
default_user=$1
default_key=$2
IP=$3
infra_public_key=$4
infra_key=$(echo "${infra_public_key::-4}")
infra_ser=$(echo $infra_key | cut -d'.' -f 1 | cut -d'@' -f 2)
USER=$(whoami)

ssh -i $default_key $default_user@$IP "sudo useradd -m -s /bin/bash \"$USER\" && sudo usermod -aG sudo \"$USER\" && sudo mkdir /home/\"$USER\"/.ssh && sudo cp /home/\"$default_user\"/.ssh/authorized_keys /home/\"$USER\"/.ssh && sudo chown -R \"$USER\":\"$USER\" /home/\"$USER\""
ssh -T -i $default_key $default_user@$IP "echo \"$USER\"  ALL=\"(\"ALL\")\" NOPASSWD:ALL | sudo tee /etc/sudoers.d/\"$USER\""
ssh-copy-id -f -i infrakeys/$infra_public_key -o "IdentityFile \"$default_key\"" $USER@$IP
ssh -i infrakeys/$infra_key $USER@$IP "sed -i '/$default_key/d' ~/.ssh/authorized_keys"

sed -i '/$infra_ser/,+5d' ~/.ssh/conf.d/infra_config
cat << EOF >> ~/.ssh/conf.d/infra_config 
# add by ssh_user_setup function
Host $infra_ser
     Hostname &IP
     Port 2020
     User $USER
     IdentityFile ~/.ssh/infrakeys/$infra_key
EOF


# Verify the changes were made
echo "Verify user is correct, the default_key was deleted from new user profile, and sudoers input"
ssh -i infrakeys/$infra_key $USER@$IP "whoami"
ssh -i infrakeys/$infra_key $USER@$IP "cat ~/.ssh/authorized_keys"
ssh -i infrakeys/$infra_key $USER@$IP "sudo cat /etc/sudoers.d/\"$USER\""

# Delete default user
read -p "Would you like to delete default user?(yes or no): " default_user_del

case $default_user_del in
  [yY] | [yY][Ee][Ss] )
    read -p "Verify you can still ssh to new user using new keys and sudo with new user?(y/n): " verify_funct
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
done
