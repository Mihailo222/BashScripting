#! /bin/bash

#user input: FROM date - TO date
#find files made by users on operating system between FROM date and TO date and write them to a file.

if [ $# -ne 2 ]
then
 echo "Usage: $0 <YYYY-MM-DD> <YYYY-MM-DD>"
 exit 1
fi

from_date=$1
to_date=$2

file_created="FILE WHERE YOU WANT TO STORE FILTERED FILE NAMES AND INFOS IN"
dir_searched="DIRECTORY YOU WANT TO SEARCH FILES IN"
touch $file_created

i=0
files=()
find $dir_searched -type f -newermt $from_date ! -newermt $to_date -exec ls -lh {} \; >> $file_created