#Task 1: Write a python code for pulling open-source code (e.g. Kubernetes) from GitHub.
import requests

response = requests.get("https://api.github.com/repos/kubernetes/kubernetes/pulls")
#print(response.json()) 
#response = 200 OK
#response.status_code = 200

output = response.json() #lista pullova
#print(output[0])

pr_creators={} #pravim novi dictionary onih koji su pullovali dati repo-> KEY=username, VAL=number of pulls

for pull in output: #pull po pull
    
    creator = pull['user']['login'] #vadi username
   # print(creator) #vraca ti samo username!!!

    if creator in pr_creators:
       pr_creators[creator]+=1 # povecaj za 1 ako dati username je vec u listi 
      #  print(pr_creators[creator]) 
    else:
        pr_creators[creator]=1

for creator in pr_creators:
    print(creator, pr_creators[creator]) #SUPER.