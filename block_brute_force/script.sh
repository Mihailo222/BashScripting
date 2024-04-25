#! /bin/bash

app_log_file="/var/log/auth.log"
users=()
i=0

#user = username+ip address
cat $app_log_file | grep "Failed password" | awk '{print $9,$11}'| while IFS=' ' read -r line
do
 users[i]=$line
 echo ${users[i]};
 (( i=i+1 ))
done > users.txt

#how many failed tries did every user+ip had
cat users.txt | uniq -c > statistics.txt

cat statistics.txt | while IFS=' ' read -r line
do
 echo $line | awk '{print $1}'
 #proveravajmo da li je $1 npr. vise od 30 konekcija i ako jeste, salji tu ip adresu na block listu
done