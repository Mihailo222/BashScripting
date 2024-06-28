devs=("dev1" "dev2")
testers=("tester1" "tester2")
devops=("devops1" "devops2")
groups=("devs" "test" "devops")

function1() {
local -n users_ref=$1 
group=$2

for i in ${users_ref[@]}
do
 ./script1.sh $i $group
done
}


function1 devs ${groups[0]} 
function1 testers ${groups[1]}
function1 devops ${groups[2]}
