
# Kubernetes 



[https://kubernetes.io/docs/tasks/administer-cluster/](https://kubernetes.io/docs/tasks/administer-cluster/)  

- Core Concepts
  - Cluster Architecture
  - API Primitives
  - Services & Other Network Primitives
- Scheduling
  - Labels & Selectors
  - Daemon Sets
  - Resource Limits
  - Multiple Schedulers
  - Manual Scheduling
  - Scheduler Events
  - Configure Kubernetes Scheduler
- Logging & Monitoring
  - Monitor Cluster Components
  - Monitor Cluster Components Logs
  - Monitor Applications
  - Application Logs
- Application Lifecycle Management
  - Rolling Updates and Rollbacks in Deployments
  - Configuring Applications
  - Scale Applications
  - Self-Healing Applications
- Cluster Maintenance
  - Cluster Upgrade Process
  - Operating System Upgrades
  - Backup and Restore Methodologies
 - Security
   - Authentication & Authorization
   - Kubernetes Security
   - Network Policies
   - TLS Certificates for Cluster Components
   - Image Security
   - Network Polices
   - Security Contexts
   - Secure Persistent Key Value Store
- Storage
  - Persistent Volumes
  - Access Modes for Volumes
  - Persistent Volume Claims
  - Kubernetes Storage Object
  - Configure Applications with Persistent Storage
- Networking
  - Network, Switching, Routing, Tools 
  - Network Namespaces
  - Networking in Docker
  - Networking Configuration on Cluster Nodes
  - Service Networking
  - POD Networking Concepts
  - Network Loadbalancer
  - Ingress
  - Cluster DNS
  - CNI
- Installation, Configuration & Validation
  - Design a Kubernetes Cluster
  - Install Kubernetes Master and Nodes
  - Secure Cluster Communication
  - HA Kubernetes Cluster
  - Kubernetes Release Binaries
  - Provision Infrastructure
  - Choose a Network Solution
  - Kubernetes Infrastructure Config
  - Run & Analyze end-to-end test
  - Node end-to-end tests
- Troubleshooting
  - Application Failure
  - Control Plane Failure
  - Worker Node Failure
  - Networking
- Additional topics
  - Auto scaling a cluster
  - Horizontal POD autoscalers
  - Stateful Sets
  - Kubernetes Federation
  - Admission Controllers


## Cluster Architecture
- [https://kubernetes.io/docs/concepts/architecture/](https://kubernetes.io/docs/concepts/architecture/)

```
 Master [manage,plan,schedule,monitor nodes]
 - ETCD cluster
 - kube-apiserver
 - kube controller manager
 - kube-scheduler

 Worker Nodes [host applications as containers]
 - kubelet
 - kuber-proxy
 - container runtime
```
- ETCD  
distributed reliable key-value store that is simple, secure and fast  
stores information regarding the cluster  


./etcd  
./etcdctl  
./etcdctl set key1 value1  
./etcdctl get key1  


k exec etcd-master -n kube-system etcdctl get / --prefix -keys-only  

ETCDCTL is the CLI tool used to interact with ETCD.

ETCDCTL can interact with ETCD Server using 2 API versions - Version 2 and Version 3.  By default its set to use Version 2. Each version has different sets of commands.

For example ETCDCTL version 2 supports the following commands:

    etcdctl backup
    etcdctl cluster-health
    etcdctl mk
    etcdctl mkdir
    etcdctl set


Whereas the commands are different in version 3

    etcdctl snapshot save 
    etcdctl endpoint health
    etcdctl get
    etcdctl put


To set the right version of API set the environment variable ETCDCTL_API command

export ETCDCTL_API=3


When API version is not set, it is assumed to be set to version 2. And version 3 commands listed above don't work. When API version is set to version 3, version 2 commands listed above don't work.


Apart from that, you must also specify path to certificate files so that ETCDCTL can authenticate to the ETCD API Server. The certificate files are available in the etcd-master at the following path. We discuss more about certificates in the security section of this course. So don't worry if this looks complex:

    --cacert /etc/kubernetes/pki/etcd/ca.crt     
    --cert /etc/kubernetes/pki/etcd/server.crt     
    --key /etc/kubernetes/pki/etcd/server.key


for the commands  you must specify the ETCDCTL API version and path to certificate files as shown: 

kubectl exec etcd-master -n kube-system -- sh -c "ETCDCTL_API=3 etcdctl get / --prefix --keys-only --limit=10 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/etcd/server.crt  --key /etc/kubernetes/pki/etcd/server.key" 



Kube-API Server  

Authenticate user  
Validate Request  
Retrieve data  
Update ETCD  
Schedular  
Kubelet  

schedular continously monitors kube api server, it identifies the new pods to be assigned and assigns it the right node and communicate it back to the kube-api server, kube-api server then updates the info in etcd cluster, api server then passes that info to kubelet in appropriate worker node, kubelet then deploys the application and instructs the container runtime to deploy application image, kubelet then pass this info to api-server and it will update data back in etcd cluster  


curl -X POST /api/v1/namespaces/default/pods ...[other]


cat /etc/kubernetes/manifests/kube-apiserver.yaml  
cat /etc/systemd/system/kube-apiserver.service  


Kube Controller Manager  

deployment controller  
namespace controller  
endpoint controller  
job controller 
etc...


Kube Schedular  

shedules pods based node ranking  
whichever node with higher cpu when a specific pod is placed on it is ranked top.

Kubelet  

register node  
create pods  
monitor nodes and pods  






## CKA Curriculum
[https://www.cncf.io/certification/training/](https://www.cncf.io/certification/training/)  
[https://github.com/cncf/curriculum](https://github.com/cncf/curriculum)  


25% - Cluster Architecture, Installation & Configuration  

• Manage role based access control (RBAC)  
• Use Kubeadm to install a basic cluster  
• Manage a highly-available Kubernetes cluster  
• Provision underlying infrastructure to deploy a Kubernetes cluster  
• Perform a version upgrade on a Kubernetes cluster using Kubeadm  
• Implement etcd backup and restore  
  
15% - Workloads & Scheduling    

• Understand deployments and how to perform rolling update and rollbacks  
• Use ConfigMaps and Secrets to configure applications  
• Know how to scale applications  
• Understand the primitives used to create robust, self-healing, application deployments  
• Understand how resource limits can affect Pod scheduling  
• Awareness of manifest management and common templating tools    
  
20% - Services & Networking  

• Understand host networking configuration on the cluster nodes  
• Understand connectivity between Pods  
• Understand ClusterIP, NodePort, LoadBalancer service types and endpoints  
• Know how to use Ingress controllers and Ingress resources  
• Know how to configure and use CoreDNS  
• Choose an appropriate container network interface plugin  
  
10% - Storage  

• Understand storage classes, persistent volumes  
• Understand volume mode, access modes and reclaim policies for volumes  
• Understand persistent volume claims primitive  
• Know how to configure applications with persistent storage  
  
30% - Troubleshooting  

• Evaluate cluster and node logging  
• Understand how to monitor applications  
• Manage container stdout & stderr logs  
• Troubleshoot application failure  
• Troubleshoot cluster component failure  
• Troubleshoot networking  


##  CKAD Curriculum

[https://training.linuxfoundation.org/ckad-program-change-2021/](https://training.linuxfoundation.org/ckad-program-change-2021/)


Application Design and Build – 20%

    Define, build and modify container images
    Understand Jobs and CronJobs
    Understand multi-container Pod design patterns (e.g. sidecar, init and others)
    Utilize persistent and ephemeral volumes

Application Environment, Configuration and Security – 25%

    Discover and use resources that extend Kubernetes (CRD)
    Understand authentication, authorization and admission control
    Understanding and defining resource requirements, limits and quotas
    Understand ConfigMaps
    Create & consume Secrets
    Understand ServiceAccounts
    Understand SecurityContexts

Application Deployment – 20% 

    Use Kubernetes primitives to implement common deployment strategies (e.g. blue/green or canary)
    Understand Deployments and how to perform rolling updates
    Use the Helm package manager to deploy existing packages

Services and Networking – 20%

    Demonstrate basic understanding of NetworkPolicies
    Provide and troubleshoot access to applications via services
    Use Ingress rules to expose applications

Application Observability and Maintenance – 15%

    Understand API deprecations
    Implement probes and health checks
    Use provided tools to monitor Kubernetes applications
    Utilize container logs
    Debugging in Kubernetes











## Notes

```

Minikube Users:

If you are using a vm driver, you will need to tell Kubernetes to use the Docker daemon running inside of the single node cluster instead of the host.

Run the following command:

eval $(minikube docker-env)

Note - This command will need to be repeated anytime you close and restart the terminal session.

Afterward, you can build your image:

docker build -t USERNAME/REPO .

Update, your pod manifest as shown above and then run:

kubectl apply -f infra/k8s/

https://minikube.sigs.k8s.io/docs/commands/docker-env/

```


## Kubernetes Essentials - Application development  

kubectl diff  
kubectl debug  
kubectl sniff  
kubectl attach  
kubectl run -it net-debug --image=nixery.dev/shell/curl/wget/htop /bin/bash  


Helm  
Kustomize  
Advice  
Skaffold  
Telepresence  


## Links

[https://www.cncf.io/certification/cka/](https://www.cncf.io/certification/cka/)  
[https://github.com/cncf/curriculum](https://github.com/cncf/curriculum)  
[https://www.cncf.io/certification/candidate-handbook](https://www.cncf.io/certification/candidate-handbook)  
[http://training.linuxfoundation.org/go//Important-Tips-CKA-CKAD](http://training.linuxfoundation.org/go//Important-Tips-CKA-CKAD)  
[https://platform9.com/blog/tutorial-dynamic-provisioning-of-persistent-storage-in-kubernetes-with-minikube/](https://platform9.com/blog/tutorial-dynamic-provisioning-of-persistent-storage-in-kubernetes-with-minikube/)  
[https://platform9.com/blog/kubernetes-storage-dynamic-volumes-and-the-container-storage-interface/](https://platform9.com/blog/kubernetes-storage-dynamic-volumes-and-the-container-storage-interface/)  
[https://vocon-it.com/2018/12/20/kubernetes-local-persistent-volumes/](https://vocon-it.com/2018/12/20/kubernetes-local-persistent-volumes/)  
[https://vocon-it.com/2018/12/10/kubernetes-4-persistent-volumes-hello-world/](https://vocon-it.com/2018/12/10/kubernetes-4-persistent-volumes-hello-world/)  
[https://platform9.com/blog/top-storage-solutions-for-kubernetes/](https://platform9.com/blog/top-storage-solutions-for-kubernetes/)  
[https://cloud.google.com/solutions/automatically-bootstrapping-gke-nodes-with-daemonsets](https://cloud.google.com/solutions/automatically-bootstrapping-gke-nodes-with-daemonsets)  
[https://www.eksworkshop.com/beginner/190_efs/](https://www.eksworkshop.com/beginner/190_efs/)  
[Deploying Couchbase on Kubernetes](https://youtu.be/bzBtR0N0QBI)  
[https://blog.couchbase.com/databases-on-kubernetes/](https://blog.couchbase.com/databases-on-kubernetes/)  
[https://medium.com/ibm-cloud/diving-into-kubernetes-mutatingadmissionwebhook-6ef3c5695f74](https://medium.com/ibm-cloud/diving-into-kubernetes-mutatingadmissionwebhook-6ef3c5695f74)
[https://blog.couchbase.com/compression-and-ipv6-in-kafka-connector-3-3/](https://blog.couchbase.com/compression-and-ipv6-in-kafka-connector-3-3/)  
[https://banzaicloud.com/blog/k8s-custom-scheduler/](https://banzaicloud.com/blog/k8s-custom-scheduler/)  
[https://aws.amazon.com/blogs/containers/amazon-eks-cluster-multi-zone-auto-scaling-groups/](https://aws.amazon.com/blogs/containers/amazon-eks-cluster-multi-zone-auto-scaling-groups/)  
[https://aws.amazon.com/blogs/containers/three-things-to-consider-when-implementing-mutual-tls-with-aws-app-mesh/](https://aws.amazon.com/blogs/containers/three-things-to-consider-when-implementing-mutual-tls-with-aws-app-mesh/)  
[https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html](https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html)  
[https://www.eksworkshop.com/beginner/190_efs/launching-efs/](https://www.eksworkshop.com/beginner/190_efs/launching-efs/)  
[https://dev.to/stack-labs/use-google-kubernetes-engine-with-a-on-premises-non-internet-facing-docker-registry-284e](https://dev.to/stack-labs/use-google-kubernetes-engine-with-a-on-premises-non-internet-facing-docker-registry-284e)  
[https://medium.com/solacedotcom/scaling-microservices-with-kubernetes-event-driven-autoscaler-keda-and-solace-pubsub-c6c2b6708275](https://medium.com/solacedotcom/scaling-microservices-with-kubernetes-event-driven-autoscaler-keda-and-solace-pubsub-c6c2b6708275)  
[https://www.containiq.com/post/kubernetes-controllers](https://www.containiq.com/post/kubernetes-controllers)  
[https://kubernetes.io/blog/2021/06/21/writing-a-controller-for-pod-labels/](https://kubernetes.io/blog/2021/06/21/writing-a-controller-for-pod-labels/)  
[https://medium.com/building-the-open-data-stack/deploying-to-multiple-kubernetes-clusters-with-the-k8ssandra-operator-f7562bee1841](https://medium.com/building-the-open-data-stack/deploying-to-multiple-kubernetes-clusters-with-the-k8ssandra-operator-f7562bee1841)  
[https://medium.com/building-the-open-data-stack/part-two-multi-cluster-cassandra-deployment-with-google-kubernetes-engine-fbc02575d296](https://medium.com/building-the-open-data-stack/part-two-multi-cluster-cassandra-deployment-with-google-kubernetes-engine-fbc02575d296)  
[https://blog.edgeless.systems/how-to-make-your-existing-microservice-architecture-end-to-end-confidential-74fe91c04fd2](https://blog.edgeless.systems/how-to-make-your-existing-microservice-architecture-end-to-end-confidential-74fe91c04fd2)  
[https://medium.com/microservices-learning/micoservices-security-pattern-implementing-a-policy-based-security-for-microservices-with-opa-f15164a79b0e](https://medium.com/microservices-learning/micoservices-security-pattern-implementing-a-policy-based-security-for-microservices-with-opa-f15164a79b0e)  
[https://aws.amazon.com/blogs/containers/secure-end-to-end-traffic-on-amazon-eks-using-tls-certificate-in-acm-alb-and-istio/](https://aws.amazon.com/blogs/containers/secure-end-to-end-traffic-on-amazon-eks-using-tls-certificate-in-acm-alb-and-istio/)  
[https://cloud.google.com/kubernetes-engine/docs/how-to/scaling-apps](https://cloud.google.com/kubernetes-engine/docs/how-to/scaling-apps)  
[https://learnk8s.io/autoscaling-apps-kubernetes](https://learnk8s.io/autoscaling-apps-kubernetes)  
[https://cloud.redhat.com/blog/kubernetes-autoscaling-3-common-methods-explained](https://cloud.redhat.com/blog/kubernetes-autoscaling-3-common-methods-explained)  
[https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)  
[https://kubernetes.github.io/ingress-nginx/deploy/](https://kubernetes.github.io/ingress-nginx/deploy/)  
[https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx](https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx)  
[https://platform9.com/blog/building-a-complete-stack-ingress-controllers/](https://platform9.com/blog/building-a-complete-stack-ingress-controllers/)  
[https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/)  
[https://www.baeldung.com/linux/mapping-hostnames-ports](https://www.baeldung.com/linux/mapping-hostnames-ports)  
[https://www.nginx.com/resources/glossary/kubernetes-ingress-controller/](https://www.nginx.com/resources/glossary/kubernetes-ingress-controller/)  
[https://www.nginx.com/blog/service-discovery-in-a-microservices-architecture/](https://www.nginx.com/blog/service-discovery-in-a-microservices-architecture/)  
[https://www.nginx.com/blog/building-microservices-using-an-api-gateway/](https://www.nginx.com/blog/building-microservices-using-an-api-gateway/)  
[https://www.nginx.com/blog/event-driven-data-management-microservices/](https://www.nginx.com/blog/event-driven-data-management-microservices/)  
[https://www.nginx.com/blog/building-microservices-inter-process-communication/](https://www.nginx.com/blog/building-microservices-inter-process-communication/)  
[https://www.nginx.com/blog/service-discovery-in-a-microservices-architecture/](https://www.nginx.com/blog/service-discovery-in-a-microservices-architecture/)  
[https://www.nginx.com/blog/microservices-at-netflix-architectural-best-practices/](https://www.nginx.com/blog/microservices-at-netflix-architectural-best-practices/)  
[https://www.nginx.com/blog/nginx-caching-guide/](https://www.nginx.com/blog/nginx-caching-guide/)  
[https://docs.microsoft.com/en-us/azure/architecture/microservices/ci-cd-kubernetes](https://docs.microsoft.com/en-us/azure/architecture/microservices/ci-cd-kubernetes)  
[https://docs.microsoft.com/en-us/azure/architecture/microservices/design/](https://docs.microsoft.com/en-us/azure/architecture/microservices/design/)  
[https://docs.microsoft.com/en-us/azure/architecture/patterns/](https://docs.microsoft.com/en-us/azure/architecture/patterns/)  
[https://docs.microsoft.com/en-us/azure/architecture/microservices/design/api-design](https://docs.microsoft.com/en-us/azure/architecture/microservices/design/api-design)  
[https://docs.microsoft.com/en-us/azure/architecture/microservices/design/gateway](https://docs.microsoft.com/en-us/azure/architecture/microservices/design/gateway)  
[https://docs.microsoft.com/en-us/azure/architecture/guide/devops/devops-start-here](https://docs.microsoft.com/en-us/azure/architecture/guide/devops/devops-start-here)  
[https://docs.microsoft.com/en-us/azure/architecture/guide/networking/networking-start-here](https://docs.microsoft.com/en-us/azure/architecture/guide/networking/networking-start-here)  
[https://docs.microsoft.com/en-us/azure/architecture/checklist/data-ops](https://docs.microsoft.com/en-us/azure/architecture/checklist/data-ops)  
[https://medium.com/beyond-coding/nats-streaming-server-in-the-node-js-world-with-kubernetes-how-to-guide-2595dd598acc](https://medium.com/beyond-coding/nats-streaming-server-in-the-node-js-world-with-kubernetes-how-to-guide-2595dd598acc)  
[https://medium.com/beyond-coding/take-advantage-of-node-js-cluster-and-child-processes-with-pm2-rabbitmq-redis-and-nginx-c83eccfb8af8](https://medium.com/beyond-coding/take-advantage-of-node-js-cluster-and-child-processes-with-pm2-rabbitmq-redis-and-nginx-c83eccfb8af8)  
[https://kubernetes.io/docs/concepts/cluster-administration/networking/](https://kubernetes.io/docs/concepts/cluster-administration/networking/)  
[https://kubernetes.io/docs/concepts/services-networking/ingress/](https://kubernetes.io/docs/concepts/services-networking/ingress/)  
[https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/)  
[https://kubernetes.github.io/ingress-nginx/deploy/](https://kubernetes.github.io/ingress-nginx/deploy/)  
[https://docs.portworx.com/key-management/kubernetes-secrets/pvc-encryption-using-storageclass/](https://docs.portworx.com/key-management/kubernetes-secrets/pvc-encryption-using-storageclass/)  
[https://docs.portworx.com/key-management/kubernetes-secrets/pvc-encryption-using-csi/](https://docs.portworx.com/key-management/kubernetes-secrets/pvc-encryption-using-csi/)  
[https://docs.portworx.com/key-management/ibm-key-protect/](https://docs.portworx.com/key-management/ibm-key-protect/)  
[https://www.katacoda.com/portworx/scenarios/px-k8s-encryption](https://www.katacoda.com/portworx/scenarios/px-k8s-encryption)  
[https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/)  
[https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/](https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/)  
[https://kubernetes.io/docs/tasks/administer-cluster/](https://kubernetes.io/docs/tasks/administer-cluster/)  
[https://www.cncf.io/wp-content/uploads/2020/08/ZettasetCNCFWebinar20200506.pdf](https://www.cncf.io/wp-content/uploads/2020/08/ZettasetCNCFWebinar20200506.pdf)  
[https://www.cncf.io/wp-content/uploads/2020/08/ZettasetCNCFWebinar20200506.pdf](https://www.cncf.io/wp-content/uploads/2020/08/ZettasetCNCFWebinar20200506.pdf)  
[https://www.cncf.io/wp-content/uploads/2020/08/ZettasetCNCFWebinar20200506.pdf](https://www.cncf.io/wp-content/uploads/2020/08/ZettasetCNCFWebinar20200506.pdf)  
[https://docs.portworx.com/reference/cli/encrypted-volumes/](https://docs.portworx.com/reference/cli/encrypted-volumes/)  
[https://docs.portworx.com/key-management/kubernetes-secrets/pvc-encryption-using-annotations/](https://docs.portworx.com/key-management/kubernetes-secrets/pvc-encryption-using-annotations/)  
[https://docs.portworx.com/key-management/kubernetes-secrets/pvc-encryption-using-csi/](https://docs.portworx.com/key-management/kubernetes-secrets/pvc-encryption-using-csi/)  
[https://docs.portworx.com/portworx-install-with-kubernetes/storage-operations/csi/](https://docs.portworx.com/portworx-install-with-kubernetes/storage-operations/csi/)  
[https://portworx.com/products/open-source/](https://portworx.com/products/open-source/)  
[https://www.strongdm.com/blog/difference-between-proxy-and-reverse-proxy](https://www.strongdm.com/blog/difference-between-proxy-and-reverse-proxy)  
[https://jaygorrell.medium.com/kubernetes-ingress-82aa960f658e](https://jaygorrell.medium.com/kubernetes-ingress-82aa960f658e)  
[https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/](https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/)  
[https://awkwardferny.medium.com/getting-started-with-kubernetes-ingress-nginx-on-minikube-d75e58f52b6c](https://awkwardferny.medium.com/getting-started-with-kubernetes-ingress-nginx-on-minikube-d75e58f52b6c)  
[https://stackoverflow.com/questions/59844622/ingress-configuration-for-k8s-in-different-namespaces](https://stackoverflow.com/questions/59844622/ingress-configuration-for-k8s-in-different-namespaces)  
[https://kubernetes.io/docs/concepts/services-networking/service/#externalname](https://kubernetes.io/docs/concepts/services-networking/service/#externalname)  
[https://github.com/nginxinc/kubernetes-ingress/tree/main/examples/externalname-services](https://github.com/nginxinc/kubernetes-ingress/tree/main/examples/externalname-services)  
[https://medium.com/beyond-coding/nats-streaming-server-in-the-node-js-world-with-kubernetes-how-to-guide-2595dd598acc](https://medium.com/beyond-coding/nats-streaming-server-in-the-node-js-world-with-kubernetes-how-to-guide-2595dd598acc)  
[https://medium.com/@niravshah2705/bind-istio-with-api-gateway-iaac-aa44e908eb4a](https://medium.com/@niravshah2705/bind-istio-with-api-gateway-iaac-aa44e908eb4a)  
[https://kubernetes.io/docs/concepts/services-networking/service/#headless-services](https://kubernetes.io/docs/concepts/services-networking/service/#headless-services)  
[https://stackoverflow.com/questions/52707840/what-is-a-headless-service-what-does-it-do-accomplish-and-what-are-some-legiti](https://stackoverflow.com/questions/52707840/what-is-a-headless-service-what-does-it-do-accomplish-and-what-are-some-legiti)  
[https://kubernetes.io/docs/concepts/extend-kubernetes/operator/](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/)  
[https://www.magalix.com/blog/extending-the-kubernetes-controller](https://www.magalix.com/blog/extending-the-kubernetes-controller)  
[https://kubernetes.io/docs/tutorials/](https://kubernetes.io/docs/tutorials/)  
[https://phoenixnap.com/kb/kubernetes-mongodb](https://phoenixnap.com/kb/kubernetes-mongodb)  
[https://developers.redhat.com/blog/2020/12/16/create-a-kubernetes-operator-in-golang-to-automatically-manage-a-simple-stateful-application](https://developers.redhat.com/blog/2020/12/16/create-a-kubernetes-operator-in-golang-to-automatically-manage-a-simple-stateful-application)  
[https://portal.gitnation.org/contents/mern-stack-application-deployment-in-kubernetes](https://portal.gitnation.org/contents/mern-stack-application-deployment-in-kubernetes)  
[https://www.ibm.com/docs/en/cloud-paks/cp-applications/4.1?topic=stacks-developing-nodejs-express-stack](https://www.ibm.com/docs/en/cloud-paks/cp-applications/4.1?topic=stacks-developing-nodejs-express-stack)  
[https://github.com/mongodb/mongodb-kubernetes-operator](https://github.com/mongodb/mongodb-kubernetes-operator)  
[https://www.linkedin.com/pulse/simplifying-mongodb-kubernetes-operator-rafael-turino](https://www.linkedin.com/pulse/simplifying-mongodb-kubernetes-operator-rafael-turino)  
[https://www.velotio.com/engineering-blog/getting-started-with-kubernetes-operators-golang-based-part-3](https://www.velotio.com/engineering-blog/getting-started-with-kubernetes-operators-golang-based-part-3)  
[https://developer.okta.com/blog/2021/11/08/k8s-api-server-oidc](https://developer.okta.com/blog/2021/11/08/k8s-api-server-oidc)  
[https://stackoverflow.com/questions/23746038/canary-release-strategy-vs-blue-green](https://stackoverflow.com/questions/23746038/canary-release-strategy-vs-blue-green)  

[https://blog.realkinetic.com/using-google-cloud-service-accounts-on-gke-e0ca4b81b9a2](https://blog.realkinetic.com/using-google-cloud-service-accounts-on-gke-e0ca4b81b9a2)  

[https://deeptiman.medium.com/mongodb-statefulset-in-kubernetes-87c2f5974821](https://deeptiman.medium.com/mongodb-statefulset-in-kubernetes-87c2f5974821)  
[https://www.mongodb.com/docs/kubernetes-operator/master/tutorial/plan-k8s-op-architecture/](https://www.mongodb.com/docs/kubernetes-operator/master/tutorial/plan-k8s-op-architecture/)  
[https://medium.com/@ronyrv13/connect-mongodb-hosted-in-kubernetes-cluster-54fc4d0bd1bf](https://medium.com/@ronyrv13/connect-mongodb-hosted-in-kubernetes-cluster-54fc4d0bd1bf)  
[https://www.mongodb.com/docs/kubernetes-operator/master/tutorial/om-arch/#meko-om-arch](https://www.mongodb.com/docs/kubernetes-operator/master/tutorial/om-arch/#meko-om-arch)  
[https://github.com/mongodb/mongodb-kubernetes-operator](https://github.com/mongodb/mongodb-kubernetes-operator)  
[https://github.com/mongodb/mongodb-kubernetes-operator/blob/master/README.md](https://github.com/mongodb/mongodb-kubernetes-operator/blob/master/README.md)  



[https://www.magalix.com/blog/kubernetes-statefulsets-101-state-of-the-pods](https://www.magalix.com/blog/kubernetes-statefulsets-101-state-of-the-pods)  

[https://platform9.com/blog/why-and-how-to-run-machine-learning-workloads-on-kubernetes/](https://platform9.com/blog/why-and-how-to-run-machine-learning-workloads-on-kubernetes/)  
[https://www.kubeflow.org/docs/started/installing-kubeflow/](https://www.kubeflow.org/docs/started/installing-kubeflow/)  



[https://naiveskill.com/jenkins-operator/](https://naiveskill.com/jenkins-operator/)  

[https://www.magalix.com/blog/kubernetes-automatic-scaling](https://www.magalix.com/blog/kubernetes-automatic-scaling)  
[https://www.magalix.com/blog/kubernetes-patterns-capacity-planning](https://www.magalix.com/blog/kubernetes-patterns-capacity-planning)  
[https://www.magalix.com/blog/integrating-open-policy-agent-opa-with-kubernetes-a-deep-dive-tutorial](https://www.magalix.com/blog/integrating-open-policy-agent-opa-with-kubernetes-a-deep-dive-tutorial)  



[https://www.magalix.com/blog/deploy-react-app-to-kubernetes-cluster](https://www.magalix.com/blog/deploy-react-app-to-kubernetes-cluster) [https://medium.com/geekculture/dockerizing-a-react-application-with-multi-stage-docker-build-4a5c6ca68166](https://medium.com/geekculture/dockerizing-a-react-application-with-multi-stage-docker-build-4a5c6ca68166)  
[https://enlear.academy/deploy-a-react-application-in-kubernetes-69bd07e375ab](https://enlear.academy/deploy-a-react-application-in-kubernetes-69bd07e375ab)  
[https://stackoverflow.com/questions/18861300/how-to-run-nginx-within-a-docker-container-without-halting](https://stackoverflow.com/questions/18861300/how-to-run-nginx-within-a-docker-container-without-halting)  
[http://nginx.org/en/docs/ngx_core_module.html](http://nginx.org/en/docs/ngx_core_module.html)  


[https://medium.com/binbash-inc/when-and-why-use-multiple-k8s-namespaces-237b632bac5](https://medium.com/binbash-inc/when-and-why-use-multiple-k8s-namespaces-237b632bac5)  



[https://cloud.redhat.com/blog/the-best-laptop-for-data-science-is-a-kubernetes-cluster](https://cloud.redhat.com/blog/the-best-laptop-for-data-science-is-a-kubernetes-cluster)  
[https://cloud.redhat.com/blog/how-to-build-a-medical-ai/ml-application-on-kubernetes](https://cloud.redhat.com/blog/how-to-build-a-medical-ai/ml-application-on-kubernetes)  


[https://docs.garden.io/guides/in-cluster-building](https://docs.garden.io/guides/in-cluster-building)  


[https://stackoverflow.com/questions/65732647/how-to-backup-pvc-regularly](https://stackoverflow.com/questions/65732647/how-to-backup-pvc-regularly)  
[https://kubernetes.io/docs/concepts/storage/persistent-volumes/](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)  
[https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/)  
[https://kubernetes.io/blog/2016/10/dynamic-provisioning-and-storage-in-kubernetes/](https://kubernetes.io/blog/2016/10/dynamic-provisioning-and-storage-in-kubernetes/)  
[https://kubernetes.io/docs/concepts/storage/storage-classes/](https://kubernetes.io/docs/concepts/storage/storage-classes/)  
[https://kubernetes.io/docs/concepts/storage/volumes/](https://kubernetes.io/docs/concepts/storage/volumes/)  
[https://kubernetes.io/docs/concepts/storage/persistent-volumes/#volume-snapshot-and-restore-volume-from-snapshot-support](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#volume-snapshot-and-restore-volume-from-snapshot-support)  
[https://kubernetes.io/docs/concepts/storage/volume-snapshots/](https://kubernetes.io/docs/concepts/storage/volume-snapshots/)  
[https://kubernetes.io/docs/concepts/storage/volume-snapshot-classes/](https://kubernetes.io/docs/concepts/storage/volume-snapshot-classes/)  
[https://kubernetes.io/docs/concepts/storage/volume-pvc-datasource/](https://kubernetes.io/docs/concepts/storage/volume-pvc-datasource/)  

[ Kube 102  Getting started with Longhorn | Cloud Native Distributed Storage for Kubernetes](https://youtu.be/SDI9Tly5YDo)  


[Disk Backup with Volume Snapshot in Kubernetes](https://youtu.be/bo21p0c7j9o)  
[Using CSI snapshots to backup and restore your data in Kubernetes](https://youtu.be/wALuRLSELRQ)  
[Backup and Restore Persistent Volumes with Google Cloud Storage](https://youtu.be/3doFk56drxw)  



[https://cloud.redhat.com/blog/how-to-backup-clone-and-migrate-persistent-volume-claims-on-openshift](https://cloud.redhat.com/blog/how-to-backup-clone-and-migrate-persistent-volume-claims-on-openshift)  

[https://content.cloud.redhat.com/blog/how-to-secure-cloud-native-applications-with-hashicorp-vault-and-cert-manager](https://content.cloud.redhat.com/blog/how-to-secure-cloud-native-applications-with-hashicorp-vault-and-cert-manager)  



[https://www.ibm.com/garage/method/practices/manage/backup-cloudnative/](https://www.ibm.com/garage/method/practices/manage/backup-cloudnative/)  
[https://www.ibm.com/cloud/learn/backup-and-restore](https://www.ibm.com/cloud/learn/backup-and-restore)  
[https://cloudian.com/guides/data-backup/data-backup-in-depth/](https://cloudian.com/guides/data-backup/data-backup-in-depth/)  
[https://blog.sepusa.com/snapshots-vs-backups](https://blog.sepusa.com/snapshots-vs-backups)  
[https://parablu.com/demystifying-data-backups-types-of-backups/](https://parablu.com/demystifying-data-backups-types-of-backups/)  


[https://devops.cisel.ch/backup-kubernetes-pv-with-velero-the-new-approach](https://devops.cisel.ch/backup-kubernetes-pv-with-velero-the-new-approach)  

[How to backup and restore data in pvc through Velero #1862](https://github.com/vmware-tanzu/velero/issues/1862)  
[https://blog.kubernauts.io/backup-and-restore-pvcs-using-velero-with-restic-and-openebs-from-baremetal-cluster-to-aws-d3ac54386109](https://blog.kubernauts.io/backup-and-restore-pvcs-using-velero-with-restic-and-openebs-from-baremetal-cluster-to-aws-d3ac54386109)  
[https://blog.kubernauts.io/backup-and-restore-of-kubernetes-applications-using-heptios-velero-with-restic-and-rook-ceph-as-2e8df15b1487](https://blog.kubernauts.io/backup-and-restore-of-kubernetes-applications-using-heptios-velero-with-restic-and-rook-ceph-as-2e8df15b1487)  
[https://medium.com/techlogs/using-velero-and-restic-to-backup-kubernetes-2f0f812da4db](https://medium.com/techlogs/using-velero-and-restic-to-backup-kubernetes-2f0f812da4db)  
[https://www.humblec.com/ceph-csi-v3-0-0-released-snapshot-clone-multi-arch-rox/](https://www.humblec.com/ceph-csi-v3-0-0-released-snapshot-clone-multi-arch-rox/)  
[https://restic.net/](https://restic.net/)  

[https://www.veeam.com/blog/how-snapshots-backups-work-together.html](https://www.veeam.com/blog/how-snapshots-backups-work-together.html)  

[https://cloud.redhat.com/blog/red-hat-releases-open-source-stackrox-to-the-community](https://cloud.redhat.com/blog/red-hat-releases-open-source-stackrox-to-the-community)  


[https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/)  
[https://portworx.com/blog/basic-guide-kubernetes-storage/](https://portworx.com/blog/basic-guide-kubernetes-storage/)  
[https://datamattsson.tumblr.com/post/182297931146/highly-available-stateful-workloads-on-kubernetes](https://datamattsson.tumblr.com/post/182297931146/highly-available-stateful-workloads-on-kubernetes)  
[https://www.ondat.io/blog/volume-replication-ha-k8s-openshift](https://www.ondat.io/blog/volume-replication-ha-k8s-openshift)  
[https://kubernetes.io/docs/tasks/run-application/run-replicated-stateful-application/](https://kubernetes.io/docs/tasks/run-application/run-replicated-stateful-application/)  


[https://github.com/csi-addons/volume-replication-operator](https://github.com/csi-addons/volume-replication-operator)  

[https://community.hitachivantara.com/blogs/jose-perez/2022/02/22/persistent-volume-replication-data-services-for-ku](https://community.hitachivantara.com/blogs/jose-perez/2022/02/22/persistent-volume-replication-data-services-for-ku)  

[https://stash.run/docs/v0.9.0-rc.4/guides/latest/workloads/statefulset/](https://stash.run/docs/v0.9.0-rc.4/guides/latest/workloads/statefulset/)  


[https://www.velotio.com/engineering-blog/exploring-upgrade-strategies-for-stateful-sets-in-kubernetes](https://www.velotio.com/engineering-blog/exploring-upgrade-strategies-for-stateful-sets-in-kubernetes)  

[https://kubernetes.io/docs/reference/using-api/api-concepts/](https://kubernetes.io/docs/reference/using-api/api-concepts/)  




[https://cloud.netapp.com/blog/cvo-blg-kubernetes-deployment-vs-statefulset-which-is-right-for-you](https://cloud.netapp.com/blog/cvo-blg-kubernetes-deployment-vs-statefulset-which-is-right-for-you)  
[https://cloud.netapp.com/blog/cvo-blg-kubernetes-statefulset-a-practical-guide](https://cloud.netapp.com/blog/cvo-blg-kubernetes-statefulset-a-practical-guide)  
[https://cloud.google.com/kubernetes-engine/docs/how-to/stateful-apps](https://cloud.google.com/kubernetes-engine/docs/how-to/stateful-apps)  
[https://platform9.com/blog/stateful-applications-with-kubernetes/](https://platform9.com/blog/stateful-applications-with-kubernetes/)  
[https://collabnix.github.io/kubelabs/StatefulSets101/](https://collabnix.github.io/kubelabs/StatefulSets101/)  
[https://docs.portworx.com/portworx-install-with-kubernetes/storage-operations/kubernetes-storage-101/applications/](https://docs.portworx.com/portworx-install-with-kubernetes/storage-operations/kubernetes-storage-101/applications/)  
[https://www.infoq.com/articles/kubernetes-stateful-applications/](https://www.infoq.com/articles/kubernetes-stateful-applications/)  
[https://www.cockroachlabs.com/product/kubernetes/](https://www.cockroachlabs.com/product/kubernetes/)  
[https://github.com/cockroachdb/cockroach-operator](https://github.com/cockroachdb/cockroach-operator)  
[https://www.ibm.com/docs/ja/cics-tx/10.1.0?topic=SSNAQ8_10.1.0/com.ibm.cics.tx.doc/tasks/t_stateful_set_deployment.html](https://www.ibm.com/docs/ja/cics-tx/10.1.0?topic=SSNAQ8_10.1.0/com.ibm.cics.tx.doc/tasks/t_stateful_set_deployment.html)  


[https://play.instruqt.com/embed/portworx/tracks/px-cassandra-2-6?token=em_jXUaiIqY-ytFcXEx](https://play.instruqt.com/embed/portworx/tracks/px-cassandra-2-6?token=em_jXUaiIqY-ytFcXEx)  
[https://play.instruqt.com/embed/portworx/tracks/px-cassandra-2-6?token=em_jXUaiIqY-ytFcXEx](https://play.instruqt.com/embed/portworx/tracks/px-cassandra-2-6?token=em_jXUaiIqY-ytFcXEx)  
[https://play.instruqt.com/embed/portworx/tracks/px-kafka?token=em_ZDwFV1S7m6sQCZ5o](https://play.instruqt.com/embed/portworx/tracks/px-kafka?token=em_ZDwFV1S7m6sQCZ5o)  
[https://play.instruqt.com/embed/portworx/tracks/px-helm-mongo?token=em_mQ7CBQc0ZgRZ0wNE](https://play.instruqt.com/embed/portworx/tracks/px-helm-mongo?token=em_mQ7CBQc0ZgRZ0wNE)  

[https://cloud.google.com/kubernetes-engine/docs/how-to/managed-certs](https://cloud.google.com/kubernetes-engine/docs/how-to/managed-certs)  
[https://cloud.google.com/kubernetes-engine/docs/concepts/secret](https://cloud.google.com/kubernetes-engine/docs/concepts/secret)  
[https://dzone.com/articles/aws-eks-cluster-and-providing-access-to-developer](https://dzone.com/articles/aws-eks-cluster-and-providing-access-to-developer)  
[https://aws.amazon.com/premiumsupport/knowledge-center/amazon-eks-cluster-access/](https://aws.amazon.com/premiumsupport/knowledge-center/amazon-eks-cluster-access/)  
[https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html](https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html)  
[https://medium.com/intelligentmachines/istio-part-2-traffic-management-consistent-hashing-canary-dark-releases-38ee0334321a](https://medium.com/intelligentmachines/istio-part-2-traffic-management-consistent-hashing-canary-dark-releases-38ee0334321a)  
[https://blog.getambassador.io/load-balancing-strategies-in-kubernetes-l4-round-robin-l7-round-robin-ring-hash-and-more-6a5b81595d6c](https://blog.getambassador.io/load-balancing-strategies-in-kubernetes-l4-round-robin-l7-round-robin-ring-hash-and-more-6a5b81595d6c)  
[https://medium.com/@asad_5112/kubernetes-day-2-operations-part-iii-network-traffic-management-auto-scaling-associating-fec6a4d366ff](https://medium.com/@asad_5112/kubernetes-day-2-operations-part-iii-network-traffic-management-auto-scaling-associating-fec6a4d366ff)  
[https://techbeacon.com/enterprise-it/5-ways-lose-data-kubernetes-how-avoid-them](https://techbeacon.com/enterprise-it/5-ways-lose-data-kubernetes-how-avoid-them)  
[https://www.gridgain.com/sites/default/files/technical-presentations/best_practices_for_kubernetes_deployment.pdf](https://www.gridgain.com/sites/default/files/technical-presentations/best_practices_for_kubernetes_deployment.pdf)  
[https://www.detech.ai/blog/performance-monitoring-with-prometheus](https://www.detech.ai/blog/performance-monitoring-with-prometheus)  
[https://www.detech.ai/blog/in-depth-sre-guide](https://www.detech.ai/blog/in-depth-sre-guide)  
[https://medium.com/adeo-tech/how-to-build-a-zero-downtime-application-on-kubernetes-9f509fac3eb8](https://medium.com/adeo-tech/how-to-build-a-zero-downtime-application-on-kubernetes-9f509fac3eb8)  
[https://cloud.google.com/blog/products/containers-kubernetes/kubernetes-best-practices-terminating-with-grace](https://cloud.google.com/blog/products/containers-kubernetes/kubernetes-best-practices-terminating-with-grace)  
[https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/](https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/)  
[https://kubernetes.io/docs/concepts/workloads/pods/disruptions/](https://kubernetes.io/docs/concepts/workloads/pods/disruptions/)  
[https://kubernetes.io/docs/tasks/run-application/configure-pdb/](https://kubernetes.io/docs/tasks/run-application/configure-pdb/)  
[https://kubernetes.io/docs/tasks/run-application/run-replicated-stateful-application/](https://kubernetes.io/docs/tasks/run-application/run-replicated-stateful-application/)  
[https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/](https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/)  
[https://www.bluematador.com/blog/kubernetes-deployments-rolling-update-configuration](https://www.bluematador.com/blog/kubernetes-deployments-rolling-update-configuration)  
[https://medium.com/@gabytal333/kubernetes-powerful-liveness-probe-with-python-b6dd43adcf9b](https://medium.com/@gabytal333/kubernetes-powerful-liveness-probe-with-python-b6dd43adcf9b)  
[https://itnext.io/resizing-statefulset-persistent-volumes-with-zero-downtime-916ebc65b1d4](https://itnext.io/resizing-statefulset-persistent-volumes-with-zero-downtime-916ebc65b1d4)  
[https://www.giffgaff.io/tech/resizing-statefulset-persistent-volumes-with-zero-downtime](https://www.giffgaff.io/tech/resizing-statefulset-persistent-volumes-with-zero-downtime)  
[https://zhimin-wen.medium.com/persistent-volume-claim-for-statefulset-8050e396cc51](https://zhimin-wen.medium.com/persistent-volume-claim-for-statefulset-8050e396cc51)  
[https://thechief.io/c/editorial/k3d-vs-k3s-vs-kind-vs-microk8s-vs-minikube/](https://thechief.io/c/editorial/k3d-vs-k3s-vs-kind-vs-microk8s-vs-minikube/)  
[https://medium.com/@serveradmns.seo/how-to-implement-load-balancing-in-database-servers-7ad2b35cc943](https://medium.com/@serveradmns.seo/how-to-implement-load-balancing-in-database-servers-7ad2b35cc943)  
[https://severalnines.com/blog/how-does-database-load-balancer-work/](https://severalnines.com/blog/how-does-database-load-balancer-work/)  
[https://kubernetes.io/docs/concepts/services-networking/print/](https://kubernetes.io/docs/concepts/services-networking/_print/)  
[https://learnk8s.io/kubernetes-long-lived-connections](https://learnk8s.io/kubernetes-long-lived-connections)  
[Using Curl telnet to test port connectivity](https://kb.vmware.com/s/article/2097039)  
[https://medium.com/swlh/understanding-socket-connections-in-computer-networking-bac304812b5c](https://medium.com/swlh/understanding-socket-connections-in-computer-networking-bac304812b5c)  
[https://www.xenonstack.com/insights/container-design-patterns-for-kubernetes](https://www.xenonstack.com/insights/container-design-patterns-for-kubernetes)  









[https://www.linkedin.com/pulse/20-tools-manage-kubernetes-manifests-curtis-collicutt](https://www.linkedin.com/pulse/20-tools-manage-kubernetes-manifests-curtis-collicutt)  

[https://www.aquasec.com/cloud-native-academy/kubernetes-101/kubernetes-devops/](https://www.aquasec.com/cloud-native-academy/kubernetes-101/kubernetes-devops/)  

[Why use Jsonnet](https://youtu.be/W8kFrUOpO7s)  
[Using Jsonnet to Package Together Dashboards, Alerts and Exporters - Tom Wilkie](https://youtu.be/b7-DtFfsL6E)
