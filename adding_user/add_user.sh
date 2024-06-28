#Write a shell script to automate the process of creating new user accounts on a Linux server and setting up their permissions and SSH access.

#! /bin/bash

if [ "$(id -u)" -ne 0 ]
then
 echo "This script must be run as root" 1>&2
 exit 1
fi

#inut parameter is username
if [ $# -ne 2 ]
then
 echo "Usage: $0 <username> <ssh_group_name>" 1>&2
 exit 1
fi

username=$1
groupname=$2
ssh_file="/etc/ssh/sshd_config"

#adding ssh group
groupadd $groupname
gpasswd $groupname
echo "Group's password successfully changed!"

#adding user
echo "Let's enter user's password:"
useradd -m $username
passwd $username

echo "User $username sucessfully added. $username's home directory is under /home/$username"

sudo usermod -aG $groupname $username

echo "New user $username successfully added to a $groupname group. These are the groups of new user $mika : $( groups $username )"

echo "AllowGroups $groupname">>$ssh_file
service ssh resatart


#echo "$username can connect remotely via SSH to a server automatically as all the users without defining Allow-Groups/Allow-Users definition in sshd_config file."
#echo "If you want to restrict SSH access to only defined users, you can make a group for ssh access and reconfigure /etc/ssh/sshd_config file."
