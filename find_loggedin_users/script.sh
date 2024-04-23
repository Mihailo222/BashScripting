#! /bin/bash

# Write a shell script to the list of users logged in by date and write it to an output file.

file1="logged_in_now.txt"
touch $file1
who >> $file1

file2="logged_in_recently.txt"
touch $file2
last >> $file2


#Write a shell script that checks for failed logins: grep users, ther IP addresses and how many times they tried
file3="failed_login.txt"
file4="failed_logins_statistics.txt"

users=()
i=0
cat /var/log/auth.log | grep "Failed password" | awk '{print $9, $11}' | while IFS=' ' read -r line
do
 users[i]=$line
 echo ${users[i]}
 (( i=i+1 ))
done >> $file3

awk '/times: Failed/{ip=$2; next} {count[$1, ip]++} END {for (login in count) print login, count[login]}' failed_login.txt >> $file4