#!/bin/bash

if [ $# -ne 5 ]
then
 echo "Usage: $0 <YYYY-MM-DD> <YYYY-MM-DD> <directory> <user> <group>"
fi

from_date=$1
to_date=$2
dir=$3
user=$4
group=$5
touch results

find $dir -type f -newermt $from_date ! -newermt $to_date -exec chown $user:$group {} \; #changing ownership of all files without changing ownership of their folder
find $dir -type f -newermt $from_date ! -newermt $to_date -exec ls -lh {} \; >> results
