#! /bin/bash
#Write a shell script to automate the process of updating a list of servers with the latest security patches. 

servers=("192.168.56.19") #here are the IP addresses of my ubuntu machines data center

i=0
for server in "${servers[@]}"
do
 echo "Updating $server..."
 ssh vagrant@$server "sudo apt-get update && sudo apt-get upgrade -y" #every machine's username - vagrant
 echo "$server updated successfully!"
 (( i=i+1 ))
done