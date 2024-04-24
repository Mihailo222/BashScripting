#! /bin/bash

#Write a shell script to automate the process of rotating log files and compressing old files to save disk space.

log_dir="/var/log/apache2"
backup_dir="/var/log/apache2/backup"
rotate_treshold="100M"
compress_threshold=30
compression_level=9



#make a backup directory
if [ ! -d $backup_dir ]
then
 mkdir $backup_dir
fi

#rotate log files if they exceed a treshold size
for logfile in $log_dir/*
do
 if [ ! -d $logfile ] #we have only one backup directory in /var/log/apache2 directory
 then
  size=$( du  -BM  $logfile  | awk '{print $1}' ) #how much of a disk space the log file takes; -BM=block size in MBs
  if [ "${size%M}" -gt "${rotate_treshold%M}" ] #show me just a number of MBs (e.g. 1M -> 1 )
  then
   echo "${size%M}" #help line
   #touch $backup_dir/$(basename "$logfile").$( date "+%Y-%m-%d" )
   mv "$logfile" $backup_dir/$(basename "$logfile").$( date "+%Y-%m-%d" )
   touch "$logfile"
  fi

 fi
done

#compress backup directory
find "$backup_dir" -type f -name "*.log.*" -mtime +"$compress_threshold" -exec gzip -"$compression_level" {} \;

echo "Log rotation and compression completed."