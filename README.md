# Assignment - Kubernetes
Assignemnt given by Baskpace.

Part 1 & 2 :

I have downloaded the tomcat sample.war and renamed it to ROOT.war as it's fefault recognized name and runs without furthur CMD[] entry point

I installed coker and created docker file withing directory and to build I used commans 
"docker build -t my-tomcat-app ."

<<----Tested docker run locally & working---->>

Although kubemini is light, I eneabled Kubernetes withinn docker Desktop edition

I created deployment_01.yaml and service.yaml files separately here in the root directory
( in service, i created 2 services Nodeport - For internal communication & Locad balancer for hosting) (kubectl apply deployment & services.yaml files)

# Note : With only NODEPORT setvice, it is possible to use PORT FORWORD command for enabling local host  pushing the serice into it . It can be running as service in background hidden  {Start-Process kubectl -ArgumentList "port-forward service/my-task-app-service 8080:8080" -WindowStyle Hidden}


Using Ingress : I created an ingress.yaml toredirect traffic, However DNS is Required to access.

So instead of using portforwordings/ local DNs tsble or reverse proxy, I am using the Ngrok service to do this

Method:
Install Ngrok tool in wondows an addto path. 
cmd :  ngrok http 8080
cmd ngrok http 8080 -host-header="localhost:8080" (add firewall settings to ngrok.exe)

Now the site can be accessable to public


Part 3 :

To make this Robust, i altered basic deployment file to deployment_02.yaml  added 3 Replicas , set CPU & ram limits ( 64 - 256mb), added readiness probe & livness probe. 

Besides i have added autosacle.yaml for autoscaling with max 10 replicas & cpu at 60%


BONUS TASK : ( without add original credntials) 
login to aws from local machine 
from Aws portal get a keypair - to ocnnect to Ec2

subtasks :  ( refer main.tf, provider.tf, variable.tf)
    Creating a Aws Ec3 with Cent os as master image
    In terrafrom i have attached main.tf file 
    cretaed New VPC (task_vpc)and allow outbound traffic
    created a new Instance under same VPC
    It can be launched with command line to curl google.com form cnet os

connect to Ec2 using the keypair location

