
# Kubernetes 


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


