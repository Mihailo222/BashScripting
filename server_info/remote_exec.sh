user= "ubuntu"

for server in  $( cat hosts.txt ) #assigning each line to a variable server
do
 echo "${server}"
 ssh user@${server} 'bash -s' < ./server_info.sh
 #ssh into machine and start new shell instance; read commands from stding (bash -s) and execute script I gave you as stdin 
done