#bin/bash

PKG_STORAGE_PATH="/tank2/pkg_mirror_tank"
ISO_STORAGE_PATH="/tank2/iso_farm"

# rsync -a --bwlimit=128 --recursive --links --perms --times --compress --progress --delete rsync://archive.ubuntu.com/ubuntu/dists/focal/main $STORAGE_PATH/apt/mirror/us.archive.ubuntu.com/ubuntu/dists/focal
# rsync -a --bwlimit=128 --recursive --links --perms --times --compress --progress --delete rsync://archive.ubuntu.com/ubuntu/dists/focal-updates/main $STORAGE_PATH/apt/mirror/us.archive.ubuntu.com/ubuntu/dists/focal-updates
# rsync -a --bwlimit=128 --recursive --links --perms --times --compress --progress --delete rsync://archive.ubuntu.com/ubuntu/dists/focal-proposed/main $STORAGE_PATH/apt/mirror/us.archive.ubuntu.com/ubuntu/dists/focal-proposed
# rsync -a --bwlimit=128 --recursive --links --perms --times --compress --progress --delete rsync://archive.ubuntu.com/ubuntu/dists/focal-security/main $STORAGE_PATH/apt/mirror/us.archive.ubuntu.com/ubuntu/dists/focal-security

# rsync -a --bwlimit=128 --recursive --links --perms --times --compress --progress --delete rsync://archive.ubuntu.com/ubuntu/dists/bionic/main $STORAGE_PATH/apt/mirror/us.archive.ubuntu.com/ubuntu/dists/bionic
# rsync -a --bwlimit=128 --recursive --links --perms --times --compress --progress --delete rsync://archive.ubuntu.com/ubuntu/dists/bionic-updates/main $STORAGE_PATH/apt/mirror/us.archive.ubuntu.com/ubuntu/dists/bionic-updates
# rsync -a --bwlimit=128 --recursive --links --perms --times --compress --progress --delete rsync://archive.ubuntu.com/ubuntu/dists/bionic-proposed/main $STORAGE_PATH/apt/mirror/us.archive.ubuntu.com/ubuntu/dists/bionic-proposed
# rsync -a --bwlimit=128 --recursive --links --perms --times --compress --progress --delete rsync://archive.ubuntu.com/ubuntu/dists/bionic-security/main $STORAGE_PATH/apt/mirror/us.archive.ubuntu.com/ubuntu/dists/bionic-security

# ubuntu pkg sync
rsync -a --bwlimit=128 --recursive --links --perms --times --compress --progress --delete --include=focal rsync://archive.ubuntu.com/ubuntu $PKG_STORAGE_PATH/apt/mirror/us.archive.ubuntu.com/ubuntu
rsync -a --bwlimit=128 --recursive --links --perms --times --compress --progress --delete --include=bionic rsync://archive.ubuntu.com/ubuntu $PKG_STORAGE_PATH/apt/mirror/us.archive.ubuntu.com/ubuntu
# ubuntu iso sync
zsync http://cdimage.ubuntu.com/ubuntu-server/focal/daily-live/current/focal-live-server-amd64.iso.zsync /$ISO_STORAGE_PATH
zsync https://cdimage.ubuntu.com/ubuntu-server/bionic/daily-live/current/bionic-live-server-amd64.iso.zsync /$ISO_STORAGE_PATH
# linux mint 
wget https://mirrors.seas.harvard.edu/linuxmint/stable/20/sha256sum.txt -o /$ISO_STORAGE_PATH/sha256sum_mint20.txt
rsync -a --bwlimit=128 --recursive --links --perms --times --compress --progress --delete --include=20 rsync://pub.linuxmint.com/pub /$ISO_STORAGE_PATH
rsync -a --bwlimit=128 --recursive --links --perms --times --compress --progress --delete --include=20 rsync://rsync-packages.linuxmint.com /$PKG_STORAGE_PATH/mint

# centos pkg sync
#rsync -avrt --bwlimit=128 --delete --exclude=isos --include=7 --copy-links rsync://packages.oit.ncsu.edu/centos $PKG_STORAGE_PATH/centos
#rsync -avrt --bwlimit=128 --delete --exclude=isos --include=8 --copy-links rsync://packages.oit.ncsu.edu/centos $PKG_STORAGE_PATH/centos

# centos iso sync
wget https://packages.oit.ncsu.edu/centos/7.9.2009/isos/x86_64/sha256sum.txt -o /$ISO_STORAGE_PATH/sha256sum_centos7.txt
wget https://packages.oit.ncsu.edu/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-Minimal-2009.iso /$ISO_STORAGE_PATH
wget http://mirror.keystealth.org/centos/8.3.2011/isos/x86_64/CHECKSUM -o /$ISO_STORAGE_PATH/sha256sum_centos8.txt
wget http://mirror.keystealth.org/centos/8.3.2011/isos/x86_64/CentOS-8.3.2011-x86_64-boot.iso /$ISO_STORAGE_PATH
wget https://packages.oit.ncsu.edu/centos/8-stream/isos/x86_64/CHECKSUM -o /$ISO_STORAGE_PATH/sha256sum_centosstream.txt
wget https://packages.oit.ncsu.edu/centos/8-stream/isos/x86_64/CentOS-Stream-8-x86_64-20201211-boot.iso /$ISO_STORAGE_PATH

