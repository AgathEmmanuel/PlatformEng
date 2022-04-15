


# Minikube  



kubectl port-forward service/hello-minikube 7080:8080

Tada! Your application is now available at http://localhost:7080/.


thisisunsafe




# steps  

Start a cluster using the virtualbox driver:  
```
minikube start --driver=virtualbox  
```

To make virtualbox the default driver:  
```
minikube config set driver virtualbox  
```



minikube dashboard  





Install  
  
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64  
sudo install minikube-linux-amd64 /usr/local/bin/minikube  
```  
  
Start your cluster  
```  
  
From a terminal with administrator access (but not logged in as root), run:  
  
minikube start  
  
```  
Interact with your cluster  
```  
  
If you already have kubectl installed, you can now use it to access your shiny new cluster:  
  
kubectl get po -A  
  
Alternatively, minikube can download the appropriate version of kubectl and you should be able to use it like this:  
  
minikube kubectl -- get po -A  
  
You can also make your life easier by adding the following to your shell config:  
  
alias kubectl="minikube kubectl --"  
  
Initially, some services such as the storage-provisioner, may not yet be in a Running state. This is a normal condition during cluster bring-up, and will resolve itself momentarily. For additional insight into your cluster state, minikube bundles the Kubernetes Dashboard, allowing you to get easily acclimated to your new environment:  
  
minikube dashboard  
```  
  
  
Deploy applications  
  
```  
  
Create a sample deployment and expose it on port 8080:  
  
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4  
kubectl expose deployment hello-minikube --type=NodePort --port=8080  
  
It may take a moment, but your deployment will soon show up when you run:  
  
kubectl get services hello-minikube  
  
The easiest way to access this service is to let minikube launch a web browser for you:  
  
minikube service hello-minikube  
  
Alternatively, use kubectl to forward the port:  
  
kubectl port-forward service/hello-minikube 7080:8080  
  
Tada! Your application is now available at http://localhost:7080/.  
  
  
  
```  
  
  
LoadBalancer deployments  
```  
  
To access a LoadBalancer deployment, use the “minikube tunnel” command. Here is an example deployment:  
  
kubectl create deployment balanced --image=k8s.gcr.io/echoserver:1.4    
kubectl expose deployment balanced --type=LoadBalancer --port=8080  
  
In another window, start the tunnel to create a routable IP for the ‘balanced’ deployment:  
  
minikube tunnel  
  
To find the routable IP, run this command and examine the EXTERNAL-IP column:  
  
kubectl get services balanced  
  
Your deployment is now available at <EXTERNAL-IP>:8080  
  
```  
  
Manage your cluster  
  
```  
  
Pause Kubernetes without impacting deployed applications:  
  
minikube pause  
  
Unpause a paused instance:  
  
minikube unpause  
  
Halt the cluster:  
  
minikube stop  
  
Increase the default memory limit (requires a restart):  
  
minikube config set memory 16384  
  
Browse the catalog of easily installed Kubernetes services:  
  
minikube addons list  
  
Create a second cluster running an older Kubernetes release:  
  
minikube start -p aged --kubernetes-version=v1.16.1  
  
Delete all of the minikube clusters:  
  
minikube delete --all  
```  
  
 

Tutorial

```
   Start a cluster with 2 nodes in the driver of your choice:

minikube start --nodes 2 -p multinode-demo
```
 

How to use local docker images with Minikube?
```
As the README describes, you can reuse the Docker daemon from Minikube with eval $(minikube docker-env).

So to use an image without uploading it, you can follow these steps:

    Set the environment variables with eval $(minikube docker-env)
    Build the image with the Docker daemon of Minikube (eg docker build -t my-image .)
    Set the image in the pod spec like the build tag (eg my-image)
    Set the imagePullPolicy to Never, otherwise Kubernetes will try to download the image.

  
  
# Links    
[https://minikube.sigs.k8s.io/docs/](https://minikube.sigs.k8s.io/docs/)    
[https://minikube.sigs.k8s.io/docs/drivers/](https://minikube.sigs.k8s.io/docs/drivers/)    
[https://minikube.sigs.k8s.io/docs/drivers/virtualbox/](https://minikube.sigs.k8s.io/docs/drivers/virtualbox/) [https://minikube.sigs.k8s.io/docs/handbook/](https://minikube.sigs.k8s.io/docs/handbook/)    
[https://stackoverflow.com/questions/42564058/how-to-use-local-docker-images-with-minikube](https://stackoverflow.com/questions/42564058/how-to-use-local-docker-images-with-minikube)  
[https://github.com/kubernetes/minikube/blob/0c616a6b42b28a1aab8397f5a9061f8ebbd9f3d9/README.md#reusing-the-docker-daemon](https://github.com/kubernetes/minikube/blob/0c616a6b42b28a1aab8397f5a9061f8ebbd9f3d9/README.md#reusing-the-docker-daemon)  
[https://minikube.sigs.k8s.io/docs/tutorials/multi_node/](https://minikube.sigs.k8s.io/docs/tutorials/multi_node/)     
[https://github.com/kubernetes/minikube/issues/10812](https://github.com/kubernetes/minikube/issues/10812)   
[https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/](https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/)  
[https://awkwardferny.medium.com/getting-started-with-kubernetes-ingress-nginx-on-minikube-d75e58f52b6c](https://awkwardferny.medium.com/getting-started-with-kubernetes-ingress-nginx-on-minikube-d75e58f52b6c)  
[https://github.com/nginxinc/kubernetes-ingress/tree/main/examples/externalname-services](https://github.com/nginxinc/kubernetes-ingress/tree/main/examples/externalname-services)  
[https://kubernetes.io/docs/concepts/services-networking/service/#externalname](https://kubernetes.io/docs/concepts/services-networking/service/#externalname)  
[https://stackoverflow.com/questions/51878195/kubernetes-cross-namespace-ingress-network/51899301#51899301](https://stackoverflow.com/questions/51878195/kubernetes-cross-namespace-ingress-network/51899301#51899301)  
[https://jaygorrell.medium.com/kubernetes-ingress-82aa960f658e](https://jaygorrell.medium.com/kubernetes-ingress-82aa960f658e)  
[https://stackoverflow.com/questions/59844622/ingress-configuration-for-k8s-in-different-namespaces](https://stackoverflow.com/questions/59844622/ingress-configuration-for-k8s-in-different-namespaces)  
[https://awkwardferny.medium.com/getting-started-with-kubernetes-ingress-nginx-on-minikube-d75e58f52b6c](https://awkwardferny.medium.com/getting-started-with-kubernetes-ingress-nginx-on-minikube-d75e58f52b6c)  
[https://minikube.sigs.k8s.io/docs/handbook/accessing/](https://minikube.sigs.k8s.io/docs/handbook/accessing/) [https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/)  


