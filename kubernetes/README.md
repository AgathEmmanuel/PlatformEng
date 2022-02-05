
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

Certified Kubernetes Administrator: [https://www.cncf.io/certification/cka/](https://www.cncf.io/certification/cka/)  
Exam Curriculum (Topics): [https://github.com/cncf/curriculum](https://github.com/cncf/curriculum)  
Candidate Handbook: [https://www.cncf.io/certification/candidate-handbook](https://www.cncf.io/certification/candidate-handbook)  
Exam Tips: [http://training.linuxfoundation.org/go//Important-Tips-CKA-CKAD](http://training.linuxfoundation.org/go//Important-Tips-CKA-CKAD)  