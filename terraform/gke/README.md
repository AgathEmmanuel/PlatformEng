


```


gcloud config set project <project-name>  

gcloud config set compute/zone us-central1-a  



https://cloud.google.com/binary-authorization/docs/getting-started-cli  




gcloud container clusters create test-cluster --num-nodes=1  

 Node Pools
default-pool 	
Ok 	1.21.10-gke.2000 	1 	e2-medium 	Container-Optimized OS with containerd (cos_containerd) 	Off 




Machine type 	vCPUs 	Memory 	Price (USD) 	Spot price*(USD) 	1 year commitment (USD) 	3 year commitment (USD)
e2-micro 	2 	1GB 	$0.008376 	$0.002513 	$0.00528 	$0.00377
e2-small 	2 	2GB 	$0.016751 	$0.005025 	$0.01055 	$0.00754
e2-medium 	2 	4GB 	$0.033503 	$0.010051 	$0.02111 	$0.01508




gcloud container clusters get-credentials test-cluster   		# configures kubectl to use the cluser u created  

gcloud container clusters create \
  --machine-type n1-standard-2 \
  --num-nodes 2 \
  --zone <compute zone from the list linked below> \
  --cluster-version latest \
  <CLUSTERNAME>


gcloud container clusters delete \
    --zone=us-central1-a \
    test-cluster





kubectl create deploy web-server --image=nginx  

kubectl expose deploy web-server --type LoadBalancer --port 80 --target-port 8080  

kubectl get service web-server  




```
