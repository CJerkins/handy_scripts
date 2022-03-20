infra_key=$(echo "${infra_public_key::-4}")
USER=$(whoami)

ssh_user_setup () {
	while:
	do
		read -p "What is the default user for this vm?(): " default_user
		read -p "Where is the default ssh key for this vm? Include full location.(): " default_key
		read -p "Where is the new public key for this vm? Include full location.(): " infra_public_key
		read -p "What is the ip address for this vm?(): " IP

		ssh -i $default_key $default_user@$IP "sudo useradd -m -s /bin/bash \"$USER\" && sudo usermod -aG sudo \"$USER\" && sudo mkdir /home/\"$USER\"/.ssh && sudo cp /home/\"$default_user\"/.ssh/authorized_keys /home/\"$USER\"/.ssh && sudo chown -R \"$USER\":\"$USER\" /home/\"$USER\""
		ssh -T -i $default_key $default_user@$IP "echo \"$USER\"  ALL=\"(\"ALL\")\" NOPASSWD:ALL | sudo tee /etc/sudoers.d/\"$USER\""
		ssh-copy-id -f -i infrakeys/$infra_public_key -o "IdentityFile \"$default_key\"" $USER@$IP
		ssh -i infrakeys/$infra_key $USER@$IP "sed -i '/$default_key/d' ~/.ssh/authorized_keys"

		# Verify the changes were made
		echo "Verify the default_key was deleted from new user profile"
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
				  ssh -i infrakeys/$infra_key $USER@$IP "sudo pkill -u \"$default_user\""
				  ssh -i infrakeys/$infra_key $USER@$IP "sudo userdel $default_user && sudo rm -r /home/$default_user"
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
	done
}
