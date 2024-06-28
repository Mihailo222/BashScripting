#!/bin/bash

#Write a shell script to automate the process of creating new user accounts on a Linux server.
if [ $(id -u) -ne 0 ] 
then 
 echo "This is not a root user. Only root can add new users and set their premissions." 1>&2 
 exit 1 
fi

if [ $# -ne 2 ] 
then
 echo "Usage: $0 <username> <ssh_group_name>" 1>&2 
 exit 1
fi


username=$1 
groupname=$2 
ssh_file="/etc/ssh/sshd_config"


#add new  group
if [ $(cat /etc/group | grep $2 |wc -l) -eq 0 ]
then
 echo "Creating group......"
 groupadd $groupname 
 gpasswd $groupname  
 echo "Group's password successfully changed!"
fi




#adding user
if [ $(cat /etc/passwd | grep $1 |wc -l) -eq 0 ]
then
 echo "Creating user....."
 useradd -m $username 
 passwd $username 
 echo "User $username successfully added . Here is it's home directory: /home/$username"
else
 echo "User already exists. Change it's username" 1>&2
 exit 1
fi

#user and group association
usermod -aG $groupname $username 
echo "User $username added to a group $groupname successfully!"

#CHECKS....
echo "New user info......."
groups $username
echo "/etc/passwd check: "
cat /etc/passwd | grep $username
echo "/etc/group check: "
cat /etc/group | grep $groupname  

