#!/bin/bash
# Run just outside the directory you want to encrypt 

# To run example ./encdir.sh "/PATH/TO/DIR" "Password" 

DIR=$1
PASS=$2
ARCHIVE=archived-$DIR-$(date +"%T-%m-%d-%Y")

#zip -er archived-$DIR-$(date +"%T-%m-%d-%Y").zip $DIR
7z a -rmhe=on $ARCHIVE.7z $DIR -p$PASS

read -p "Do you want to secure delete the original directory $DIR?(y/n): " ans_del

case $ans_del in
  y)
    echo "Deleting $DIR..."
    #find $DIR -type f -exec shred -uvz {} \;
    ;;
  n)
    echo "Encypting archive"  
    openssl enc -aes-256-cbc -in $ARCHIVE.7z -out locked-$ARCHIVE
    ;;
  *)
    ;;
esac





