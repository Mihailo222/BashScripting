#! /bin/bash

#What if user does not have 2 params while calling script
if [ $# -ne 2 ]
then
 echo "Usage ./backup_script.sh <source_directory> <target_directory>"
 echo "Please try again"
 exit 1
fi

#What if output of rsync is error - no rsync installed
if ! command -v rsync > /dev/null 2>&1
then
 echo "This scrypt requires rsync to be installed."
 echo "Please use your distributin's packet manager to install and try again. "
 exit 2
fi


#capture a current date and store it in the format YYYY-MM-DD
current_date=$(date +%Y-%m-%d)
rsync_options="-avb --backup-dir $2/current_date --delete --dry-run"

#execute command rsync
$( which rsync ) $rsync_options $1 $2/current >> backup_$current_date.log




