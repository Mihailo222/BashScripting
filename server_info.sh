#! /bin/bash

#hostname


function host_name() {
server_name=$(hostname) #1. interpreting command, 2. assigning it to a variable = $( 
echo HOSTNAME: $server_name
echo "*********************************************************************************"
}

#memory
function memory_check() {
echo "MEMORY: The current memmory usage on ${server_name}" 
free -m #in megabytes; total=total amaunt of physical RAM on this host; used = Free+Buffers+Cache subtracted from the total amount; free = unused; shared = amount of memory used by tmpfs file system; buff/cache = the total amount of mem used by buffer and cache;available = available for services and applications on system  
echo "*********************************************************************************"
}

#current Disk usage
function disk_space() {
echo "The amount of disk space used and available on ${server_name} is:"
df
echo "*********************************************************************************"
}


#current CPU usage

function cpu_check(){
echo "Current CPU usage on ${server_name} is: "
echo "How long the system is up/number of users/load average: $(uptime)" 
echo "System is up since (starting time): $(uptime -s)"
echo Version information $(uptime --version):
echo "*********************************************************************************"
}

#tcp check
function tcp_check(){
echo "TCP connection on ${server_name} is: "
cat /proc/net/tcp | wc -l
echo "*********************************************************************************"
}

#kernel version
function kernel_check() {

echo "Kernel version on ${server_name} is:"
uname -r
echo "*********************************************************************************"
}

function all_checks(){
	host_name
	memory_check
	disk_space
	cpu_check
	tcp_check
	kernel_check
	
}

all_checks

