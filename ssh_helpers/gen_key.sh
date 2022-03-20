# /bin/bash
# example ./key_gen.sh (student #) (prefix #) (# of clients, disreguard if only one)
STUDENT=$1
PREFIX=$2
CLIENTS=$3

sudo apt update
sudo apt install git
sudo git clone https://github.com/OpenVPN/easy-rsa.git
sudo chown student$STUDENT:student$STUDENT easy-rsa -R

cd easy-rsa/easyrsa3/
./easyrsa init-pki

./easyrsa build-ca

# sleep 3

cat easy-rsa/easyrsa3/pki/ca.crt

# build server key pair
./easyrsa build-server-full $PREFIX-server nopass inline
# build client key pair
if [ "$CLIENTS" -lt 1 ]
then
        ./easyrsa build-client-full $PREFIX-client nopass inline
        ./easyrsa build-server-full $PREFIX-server nopass inline
        exit
fi      
for i in $(seq 1 $CLIENTS)
        do
                ./easyrsa build-client-full $PREFIX-client$i nopass inline
        done

./easyrsa gen-crl 



# file management
cd ../../

if [ "$CLIENTS" -lt 1 ]
then

		cp easy-rsa/easyrsa3/pki/$PREFIX-client.creds /tmp/
		exit
fi

for i in $(seq 1 $CLIENTS)
        do
                cp easy-rsa/easyrsa3/pki/$PREFIX-client$i.creds /tmp/
        done

cp easy-rsa/easyrsa3/pki/$PREFIX-server.creds /tmp/
cp easy-rsa/easyrsa3/pki/crl.pem /tmp/$PREFIX-crl.pem

ls -lh {/tmp/$PREFIX-server.creds,/tmp/$PREFIX-client*.creds}
