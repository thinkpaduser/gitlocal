#!/bin/sh
id=$(id -u)
key='your id_rsa.pub contents'
if [ $id -ne 0 ]; then
        echo "This script requires root privileges! Exiting... "
        exit 1
fi
echo;
echo "Installing required packages:"
pkg_add git
echo "Adding a group git if not exists"
[ $(getent group git) ] || groupadd git
echo "Adding a user git if not exists"
[ $(getent passwd git) ] || useradd -G git git
mkdir -p /home/git/test-repo.git
mkdir -p /home/git/.ssh/
echo $key >> /home/git/.ssh/authorized_keys
chown git:git /home/git/test-repo.git

