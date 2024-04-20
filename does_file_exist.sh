#! /bin/bash

usage() {
echo "You need to provide an argument to a function: "
echo "usage: $0 file_name"
}

does_file_exist() {
local file="$1"
[[ -f file ]] && return 0 || return 1
}



#execution

#if number og args=0, execute usage function
[[ $# -eq 0 ]] && usage

if ( does_file_exist "$1" )
then
 echo "File found"
else
 echo "File not found"
fi