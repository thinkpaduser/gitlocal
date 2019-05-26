#!/bin/sh
id=$(id -u)
key='your id_rsa.pub contents'
if [ $id -ne 0 ]; then
       	echo "This script requires root privileges! Exiting... "
       	exit 1
fi
echo "Your id is $id"
echo;
echo "Installing required packages:"
pkg_add git
echo "Adding a group git if not exists"
[ $(getent group git) ] || groupadd git
echo "Adding a user git if not exists"
[ $(getent passwd git) ] || useradd git -g git
mkdir -p /home/git/test-repo.git 2> /dev/null
echo $key > /home/git/.ssh/authorized_keys
chown git:git /home/git/test-repo.git
cd /home/git/test-repo.git
git init --bare
echo "Done."
