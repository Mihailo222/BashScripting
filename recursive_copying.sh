#! /bin/bash

#Shell script to copy files recursively to remote hosts

#using scp - secure copying

src_dir="/mnt/c/Users/Acer/vagrant_projects_for_wsl/bash_projects/sorting" #what directory do you want to copy to a remote host
dest_dir="/home/vagrant/" #location on a remote host
remote_host_ips=(" 192.168.56.19")

i=0
for host in ${remote_host_ips[@]}
do

 scp -r $src_dir "vagrant@$host:$dest_dir" 
 (( i=i+1 ))
done

echo "Recursive copying finished!"
