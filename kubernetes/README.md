
# Kubernetes CKA


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




## Links

Certified Kubernetes Administrator: [https://www.cncf.io/certification/cka/](https://www.cncf.io/certification/cka/)  
Exam Curriculum (Topics): [https://github.com/cncf/curriculum](https://github.com/cncf/curriculum)  
Candidate Handbook: [https://www.cncf.io/certification/candidate-handbook](https://www.cncf.io/certification/candidate-handbook)  
Exam Tips: [http://training.linuxfoundation.org/go//Important-Tips-CKA-CKAD](http://training.linuxfoundation.org/go//Important-Tips-CKA-CKAD)  