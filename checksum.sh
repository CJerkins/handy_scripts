#! /bin/bash


# run checksum script in the directory of file

echo "This script is to make your checksum matching fun and easy, to use type ./checksum 'filename' 'algo' 'hash'"

filename=$1
hash=$2

echo '$hash *$filename' | shasum -c


# algo=$2
# if [ "$(shasum -a $algo $filename) | awk '{print $4}')" != "$hash" ]; then
# 	echo "File does not match checksum"
# else
# 	echo "File matches checksum"
# fi


