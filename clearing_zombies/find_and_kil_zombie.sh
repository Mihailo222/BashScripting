#! /bin/bash

pids=()
i=0
ps aux | awk '$8 == "Z+" {print $2}' | while IFS='\n' read -r line
do
 pids[i]=$line
 echo ${pids[i]}
 
 parent_pid=$( ps -o ppid= -p "${pids[i]}" )  
 sudo kill -9 $parent_pid
 echo $parent_pid
 
 (( i=i+1 ))
done


