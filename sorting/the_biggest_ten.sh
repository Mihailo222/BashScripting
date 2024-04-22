#! /bin/bash


folder=/home/ubuntu/vagrant_projects_for_wsl/ #enter a directory for file sorting
file=/mnt/c/Users/Acer/vagrant_projects_for_wsl/bash_projects/sorting/file.txt #enter a file location where you want top 10 the biggest files
touch $file
lines=() #list of all files and their size 
i=0
find $folder -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n 10 | while IFS= read -r line

do
 lines[i]=$line
 echo ${lines[i]}>>$file
 (( i=i+1 ))
done
