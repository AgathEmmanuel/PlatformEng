
# Operators  




```
operator-sdk init --domain dev.testoperator --repo=github.com/AgathEmmanuel/test-operator



operator-sdk create api --version=v1alpha1 --kind=Test --group=test

```


    Custom Controllers: those are controllers that act upon the standard Kubernetes resources. They are used to enhance the platform and add new features.
    Operator: at their heart, they are custom controllers. However, instead of using the standard K8s resources, they act upon custom resource definitions (CRDs). Those are resources that were created specifically for the operator. Together, an operator and its CRD can handle complex business logic that a native or an extended controller cannot handle.



At the core of Kubernetes itself, there is a large set of controllers. A controller ensures that a specific resource is (and remains) at the desired state dictated by a declared definition. If a resource deviates from the desired state, the controller is triggered to do the necessary actions to get the resource state back to where it should be. But, how do controllers “know” that a change happened? For example, when you scale up a deployment, you actually send a request to the API server with the new desired configuration. The API server in return publishes the change to all its event subscribers (any component that listens for changes in the API server). Thus, the Deployment controller creates one or more Pod to conform to the new definition. A new Pod creation is, in itself, a new change that the API server also broadcasts to the event listeners. So, if there are any actions that should get triggered on new Pod creation, they kick in automatically. Notice that Kubernetes uses the declarative programming methodology, not the imperative one. This means that the API server only publishes the new definition. It does not instruct the controller or any event listener about how they should act. The implementation is left to the controller.




A Kubernetes operator is a method of packaging, deploying, and managing a Kubernetes application. A Kubernetes application is both deployed on Kubernetes and managed using the Kubernetes API (application programming interface) and kubectl tooling.

A Kubernetes operator is an application-specific controller that extends the functionality of the Kubernetes API to create, configure, and manage instances of complex applications on behalf of a Kubernetes user.

It builds upon the basic Kubernetes resource and controller concepts, but includes domain or application-specific knowledge to automate the entire life cycle of the software it manages. 

In Kubernetes, controllers of the control plane implement control loops that repeatedly compare the desired state of the cluster to its actual state. If the cluster's actual state doesn’t match the desired state, then the controller takes action to fix the problem. 

An operator is a custom Kubernetes controller that uses custom resources (CR) to manage applications and their components. High-level configuration and settings are provided by the user within a CR. The Kubernetes operator translates the high-level directives into the low level actions, based on best practices embedded within the operator’s logic.

A custom resource is the API extension mechanism in Kubernetes. A custom resource definition (CRD) defines a CR and lists out all of the configuration available to users of the operator. 

The Kubernetes operator watches a CR type and takes application-specific actions to make the current state match the desired state in that resource.

Kubernetes operators introduce new object types through custom resource definitions. Custom resource definitions can be handled by the Kubernetes API just like built-in objects, including interaction via kubectl and inclusion in role-based access control (RBAC) policies.

A Kubernetes operator continues to monitor its application as it runs, and can back up data, recover from failures, and upgrade the application over time, automatically. 

The actions a Kubernetes operator performs can include almost anything: scaling a complex app, application version upgrades, or even managing kernel modules for nodes in a computational cluster with specialized hardware.
Learn more about how Kubernetes operators work, including real examples, and how to build them with the Operator Framework and software development kit.





How operators manage Kubernetes applications

Kubernetes can manage and scale stateless applications, such as web apps, mobile backends, and API services, without requiring any additional knowledge about how these applications operate. The built-in features of Kubernetes are designed to easily handle these tasks.

However, stateful applications, like databases and monitoring systems, require additional domain-specific knowledge that Kubernetes doesn’t have. It needs this knowledge in order to scale, upgrade, and reconfigure these applications.

Kubernetes operators encode this specific domain knowledge into Kubernetes extensions so that it can manage and automate an application’s life cycle. 

By removing difficult manual application management tasks, Kubernetes operators make these processes scalable, repeatable, and standardized.

For application developers, operators make it easier to deploy and run the foundation services on which their apps depend. 

For infrastructure engineers and vendors, operators provide a consistent way to distribute software on Kubernetes clusters and reduce support burdens by identifying and correcting application problems. 

Operators allow you to write code to automate a task, beyond the basic automation features provided in Kubernetes. For teams following a DevOps or site reliability engineering (SRE) approach, operators were developed to put SRE practices into Kubernetes. 

The function of the operator pattern is to capture the intentions of how a human operator would manage a service. A human operator needs to have a complete understanding of how an app or service should work, how to deploy it, and how to fix any problems that may occur.

The site reliability engineer or operations team typically writes the software to manage an application, but an operator is designed to take human operational knowledge and encode it into software to manage and deploy Kubernetes workloads while eliminating manual tasks. 

Operators are best built by those that are experts in the business logic of installing, running, and upgrading a particular application.

The creation of an operator often starts with automating the application’s installation and self-service provisioning, and follows with more complex automation capabilities.

There is also a Kubernetes operator software development kit (SDK) that can help you develop your own operator. The SDK provides the tools to build, test, and package operators with a choice of creating operators using Helm charts, Ansible Playbooks or Golang
Operator Framework

The Operator Framework is an open source project that provides developer and runtime Kubernetes tools, enabling you to accelerate the development of an operator.

The Operator Framework includes:

    Operator SDK: Enables developers to build operators based on their expertise without requiring knowledge of Kubernetes API complexities.
    Operator Lifecycle Management: Oversees installation, updates, and management of the lifecycle of all of the operators running across a Kubernetes cluster.
    Operator Metering: Enables usage reporting for operators that provide specialized services.







An example Operator

Some of the things that you can use an operator to automate include:

    deploying an application on demand
    taking and restoring backups of that application's state
    handling upgrades of the application code alongside related changes such as database schemas or extra configuration settings
    publishing a Service to applications that don't support Kubernetes APIs to discover them
    simulating failure in all or part of your cluster to test its resilience
    choosing a leader for a distributed application without an internal member election process

What might an Operator look like in more detail? Here's an example:

    A custom resource named SampleDB, that you can configure into the cluster.
    A Deployment that makes sure a Pod is running that contains the controller part of the operator.
    A container image of the operator code.
    Controller code that queries the control plane to find out what SampleDB resources are configured.
    The core of the Operator is code to tell the API server how to make reality match the configured resources.
        If you add a new SampleDB, the operator sets up PersistentVolumeClaims to provide durable database storage, a StatefulSet to run SampleDB and a Job to handle initial configuration.
        If you delete it, the Operator takes a snapshot, then makes sure that the StatefulSet and Volumes are also removed.
    The operator also manages regular database backups. For each SampleDB resource, the operator determines when to create a Pod that can connect to the database and take backups. These Pods would rely on a ConfigMap and / or a Secret that has database connection details and credentials.
    Because the Operator aims to provide robust automation for the resource it manages, there would be additional supporting code. For this example, code checks to see if the database is running an old version and, if so, creates Job objects that upgrade it for you






A Site Reliability Engineer (SRE) is a person that operates an application by writing software. They are an engineer, a developer, who knows how to develop software specifically for a particular application domain. The resulting piece of software has an application's operational domain knowledge programmed into it.


We call this new class of software Operators. An Operator is an application-specific controller that extends the Kubernetes API to create, configure, and manage instances of complex stateful applications on behalf of a Kubernetes user. It builds upon the basic Kubernetes resource and controller concepts but includes domain or application-specific knowledge to automate common tasks.


A larger challenge is managing stateful applications, like databases, caches, and monitoring systems. These systems require application domain knowledge to correctly scale, upgrade, and reconfigure while protecting against data loss or unavailability. We want this application-specific operational knowledge encoded into software that leverages the powerful Kubernetes abstractions to run and manage the application correctly.







Ten years ago, creating an automated management system for databases required a lot of effort, as it had to be built from scratch. This naturally caused the emergence of managed database-as-a-service (DBaaS) solutions. AWS was the first big company to create such a service with their DynamoDB launching in 2012. Following its success, other big players rushed to the new market as well. Using a generic DBaaS, however, has its problems (e.g. vendor lock-in, usage requirements for specific versions, minimal customization for specialized workloads, etc.).  

Employing elements of control theory, Operators work as Kubernetes extensions/plugins and use custom resource definitions (CRDs) to define and control the state of your services. Building your database environment with declarative CRDs is fairly easy: What you type is literally what you get. The operator reads your CRDs of the desired state of the system and not only creates it for you but also monitors the environment using internal events and ensures that the system is always close to the desired state. No more complicated setup scripts — your whole database system is standardized, described in a declarative language (YAML) and is self-explanatory.  









StatefulSets are great for certain use cases, but they don’t work that well for running complex software like databases because they focus on creating and managing pods, not on managing the software running on them. So if you wanted a four-node cluster and deployed Couchbase using StatefulSets, you would get four uninitialized Couchbase pods that don’t know about each other. It would then be up to you to join the nodes together into a cluster, and that means extra operational tasks.  



By deploying Couchbase Autonomous Operator with a unique custom Couchbase controller, Kubernetes gets Couchbase-specific knowledge so that whenever a Couchbase pod is deployed, it can properly configure and join it with other Couchbase pods in the cluster.

Cluster provisioning, node failure, ad-hoc scaling, and many other management tasks also require Couchbase-specific knowledge within Kubernetes in order to be properly automated. Therefore, a Kubernetes operator is the best way to make the database a prime choice for cloud-native development on Kubernetes. However, when trying to find out which database is truly cloud-native and best fits your organization’s goals, you should consider multiple factors.  




## What is an Operator  
- software that run within kubernetes  
- interacts with the kubernetes API to create/manage objects  
- works on the model of eventual consistency  

Workflow  

user -> creates an object (custom resource) -> k8s API 
k8s API -> k8s notifies operator about object creation -> operator  
operator -> runs a reconcile loop -> operator  
operator -> creates new object in k8s -> k8s API  


When to use an Operator  
- Applications have a more complicated state model (over and beyond a health check)  
- multiple copies of the application is to be deployed  
- time available to continously upgrade the operator through k8s releases  


How do Civo use Operators  
- Manage the state of customer instanceses ( ip address, networking, virtual machines, cluster)  
- Operation on Customer environments ( reboots, rebuilds )  

Demo Goals  
- scaffolding using kubebuilder  
- creating a custom resource  
- running operator in a cluster  
- creating native resources related to Custom resource  




Operator Capability Level  
- basic install (automated application provisioning and configuration management)  
- seamless upgrades (patch and minor version upgrades supported)   
- full lifescycle (backup, failure, recovery)  
- deep insights (metrics, alerts, processing, workload analysis)  
- auto pilot ( horizontal/vertical scaling, auto config tuning, abnormal detection, scheduled tuning)  



[https://book.kubebuilder.io/](https://book.kubebuilder.io/)  
```
to develop their own Kubernetes APIs and the principles from which the core Kubernetes APIs are designed.

Including:

    The structure of Kubernetes APIs and Resources
    API versioning semantics
    Self-healing
    Garbage Collection and Finalizers
    Declarative vs Imperative APIs
    Level-Based vs Edge-Base APIs
    Resources vs Subresources


Kubernetes API extension developers

API extension developers will learn the principles and concepts behind implementing canonical Kubernetes APIs, as well as simple tools and libraries for rapid execution. This book covers pitfalls and misconceptions that extension developers commonly encounter.

Including:

    How to batch multiple events into a single reconciliation call
    How to configure periodic reconciliation
    Forthcoming
        When to use the lister cache vs live lookups
        Garbage Collection vs Finalizers
        How to use Declarative vs Webhook Validation
        How to implement API versioning


https://go.dev/blog/using-go-modules


go mod init example.com/hello

go test  

go list -m all

go get rsc.io/quote

go mod tidy


```




## Extending Kubernetes with Operator Pattern  

Automate Repeatable Operations in kubernetes  
Kubernetes Operator Pattern  
Kubernetes Control loop  
Custom Resource Definitions  
Declarative API vs Imperative API  

Operations  
- Humana tasks that are repeatable  
- Management of deployments  
- Configuring  
- Scaling  
- Upgrading  
- Backups and Restore  
- Controlling flow  
- Extending functionality  
- Remediations  
- Changing  
- Deployments  
- Bring services to applications  
- Chaos  




software extensions of kubernetes  
make use of custom resources  
used to manage applications and components  
relies on k8s principles, especially control loop  

.

Control Loop  
- infinite loop  
- regulates the system  
- maintain desired state  
- respond to current state to converge  

Controllers  
- responsible for maintaining the control loop  
- track atleast one resource type  
- spec field of resource definition defines desired state  
- can act on own or leverage kubernetes api  


Custom Resource Definitions  
- Resources are endpoints in kubernetes API  
- Resources Contain a collection of object  
- custom resources can exist without controllers to store data  


Operator usually includes both custom resources and controllers to act upon them.  


Declarative API  
- API consist of relatively small no of relatively samll objects  
- objects define configuration of applications or infrastructure  
- objects are updated relatively frequently  
- humans often need to read and write the objects  
- main operations on the objects are CRUD-y  
- API represents a desired state not an exact state  


Kubebuilder  

groups: logical grouping, related functionality, versioned functionality  

kinds: API types within a group, must remain passvie but can change  
resource: is a use of a kind  
kind can be returned by many resources  
a kind may be subkinds of others  
refer kubebuilder api documentations  



Example Project: an Operater that provisions S3 bucket for our application on deployment  
- Every application in a namespace require an S3  
- Our operator is going to be an API gateway for S3  
- an api gateway gateway for the creation and management of the bucket not the objects in them  





Operator Similarities  

step 1: Implement the operator  
step 2: Dockerize your operator  
step 3: Create CRD ( Custom Resource Definition )  
step 4: Create RBAC ( Role and Role Binding )  
step 5: Deploy the operator  
step 6: Create you custom resource  


Helm: Generate Operator  

operator-sdk init --plugins=helm  
operator-sdk create api --group=<group-name> --version=v1 --helm-chart=./chart  

Common Operator Steps: build, install, and use  

docker build -t <user>/<operator-name> .  
docker push <user>/<operator-name>  
make install  
make deploy IMG=<user>/<operator-name>  
kubectl apply -f config/samples/operator-name_v1_operator-name.yml  


[https://github.com/leszko/build-your-operator/tree/main/operator-sdk-go](https://github.com/leszko/build-your-operator/tree/main/operator-sdk-go)  







Conclusion  

Both kubebuilder and operator-sdk are good tools to start writing k8s controllers, they are well documented, having good communities and provide helper commands to start a new project or adding new controller. The operator-sdk has better integration with helm, and having better integration with the operator-framework ecosystem, while the kuebuilder integrates with existing kubernetes-sigs projects naturally. This post goes through background , installing and development process for both tools, and I think the kuebuilder could provides better management over codes, so I would suggest to use kuebuilder to start a new projects.  



# Links  
[https://kubernetes.io/docs/concepts/extend-kubernetes/operator/](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/)  
[https://www.magalix.com/blog/extending-the-kubernetes-controller](https://www.magalix.com/blog/extending-the-kubernetes-controller)  
[https://www.redhat.com/en/topics/containers/what-is-a-kubernetes-operator](https://www.redhat.com/en/topics/containers/what-is-a-kubernetes-operator)  
[https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/)  
[https://operatorhub.io/](https://operatorhub.io/)  
[https://web.archive.org/web/20170129131616/https://coreos.com/blog/introducing-operators.html](https://web.archive.org/web/20170129131616/https://coreos.com/blog/introducing-operators.html)  
[https://web.archive.org/web/20170206093826/https://kubernetes.io/docs/user-guide/thirdpartyresources/](https://web.archive.org/web/20170206093826/https://kubernetes.io/docs/user-guide/thirdpartyresources/)  
[https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/](https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/)  
[https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/](https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/)  
[https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/device-plugins/](https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/device-plugins/)  
[https://kubernetes.io/docs/concepts/extend-kubernetes/operator/](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/)  
[https://www.replex.io/blog/10-kubernetes-operators-every-devops-needs-to-know-about](https://www.replex.io/blog/10-kubernetes-operators-every-devops-needs-to-know-about)  
[https://github.com/operator-framework/awesome-operators](https://github.com/operator-framework/awesome-operators)  
[https://www.infoq.com/articles/kubernetes-operators-in-depth/](https://www.infoq.com/articles/kubernetes-operators-in-depth/)  
[https://github.com/nolar/kopf](https://github.com/nolar/kopf)  
[https://book.kubebuilder.io/](https://book.kubebuilder.io/)  
[https://buehler.github.io/dotnet-operator-sdk/](https://buehler.github.io/dotnet-operator-sdk/)  
[https://kudo.dev/](https://kudo.dev/)  
[https://metacontroller.github.io/metacontroller/intro.html](https://metacontroller.github.io/metacontroller/intro.html)  
[https://operatorframework.io/](https://operatorframework.io/)  
[https://github.com/flant/shell-operator](https://github.com/flant/shell-operator)  
[https://www.magalix.com/blog/extending-the-kubernetes-controller](https://www.magalix.com/blog/extending-the-kubernetes-controller)  

[https://developers.redhat.com/blog/2020/12/16/create-a-kubernetes-operator-in-golang-to-automatically-manage-a-simple-stateful-application](https://developers.redhat.com/blog/2020/12/16/create-a-kubernetes-operator-in-golang-to-automatically-manage-a-simple-stateful-application)  
[https://portal.gitnation.org/contents/mern-stack-application-deployment-in-kubernetes](https://portal.gitnation.org/contents/mern-stack-application-deployment-in-kubernetes)  
[https://www.ibm.com/docs/en/cloud-paks/cp-applications/4.1?topic=stacks-developing-nodejs-express-stack](https://www.ibm.com/docs/en/cloud-paks/cp-applications/4.1?topic=stacks-developing-nodejs-express-stack)  
[https://github.com/mongodb/mongodb-kubernetes-operator](https://github.com/mongodb/mongodb-kubernetes-operator)  
[https://www.linkedin.com/pulse/simplifying-mongodb-kubernetes-operator-rafael-turino](https://www.linkedin.com/pulse/simplifying-mongodb-kubernetes-operator-rafael-turino)  
[https://www.velotio.com/engineering-blog/getting-started-with-kubernetes-operators-golang-based-part-3](https://www.velotio.com/engineering-blog/getting-started-with-kubernetes-operators-golang-based-part-3)  
[https://www.velotio.com/engineering-blog/getting-started-with-kubernetes-operators-helm-based-part-1](https://www.velotio.com/engineering-blog/getting-started-with-kubernetes-operators-helm-based-part-1)  
[https://www.velotio.com/engineering-blog/exploring-upgrade-strategies-for-stateful-sets-in-kubernetes](https://www.velotio.com/engineering-blog/exploring-upgrade-strategies-for-stateful-sets-in-kubernetes)  
[https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set/#updating-statefulsets](https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set/#updating-statefulsets)  

[https://www.giantswarm.io/blog/vertical-autoscaling-in-kubernetes](https://www.giantswarm.io/blog/vertical-autoscaling-in-kubernetes)  
[https://cloud.google.com/kubernetes-engine/docs/concepts/verticalpodautoscaler](https://cloud.google.com/kubernetes-engine/docs/concepts/verticalpodautoscaler)  
[https://spot.io/resources/kubernetes-autoscaling-3-methods-and-how-to-make-them-great/](https://spot.io/resources/kubernetes-autoscaling-3-methods-and-how-to-make-them-great/)  



[https://www.magalix.com/blog/kubernetes-statefulsets-101-state-of-the-pods](https://www.magalix.com/blog/kubernetes-statefulsets-101-state-of-the-pods)  
[https://deeptiman.medium.com/mongodb-statefulset-in-kubernetes-87c2f5974821](https://deeptiman.medium.com/mongodb-statefulset-in-kubernetes-87c2f5974821)  
[https://www.mongodb.com/docs/kubernetes-operator/master/tutorial/plan-k8s-op-architecture/](https://www.mongodb.com/docs/kubernetes-operator/master/tutorial/plan-k8s-op-architecture/)  
[https://www.mongodb.com/docs/kubernetes-operator/master/tutorial/om-arch/#meko-om-arch](https://www.mongodb.com/docs/kubernetes-operator/master/tutorial/om-arch/#meko-om-arch)  
[https://github.com/mongodb/mongodb-kubernetes-operator](https://github.com/mongodb/mongodb-kubernetes-operator)  
[https://github.com/mongodb/mongodb-kubernetes-operator/blob/master/README.md](https://github.com/mongodb/mongodb-kubernetes-operator/blob/master/README.md)  


[https://www.magalix.com/blog/creating-custom-kubernetes-operators](https://www.magalix.com/blog/creating-custom-kubernetes-operators)  

[https://www.ibm.com/docs/en/filenet-p8-platform/5.5.x?topic=deployments-preparing-deployment-operator](https://www.ibm.com/docs/en/filenet-p8-platform/5.5.x?topic=deployments-preparing-deployment-operator)  
[CODE4104: Let's build a Kubernetes Operator in Go! with Michael Gasch & Rafael Brito](https://youtu.be/8Ex7ybi273g)  


[https://thenewstack.io/why-kubernetes-operators-will-unleash-your-developers-by-reducing-complexity/](https://thenewstack.io/why-kubernetes-operators-will-unleash-your-developers-by-reducing-complexity/)  

[https://github.com/mongodb/helm-charts/tree/main/charts/community-operator](https://github.com/mongodb/helm-charts/tree/main/charts/community-operator)  
[https://github.com/mongodb/mongodb-kubernetes-operator](https://github.com/mongodb/mongodb-kubernetes-operator)  


[https://www.percona.com/blog/2020/07/20/backup-and-restore-of-mongodb-deployment-on-kubernetes/](https://www.percona.com/blog/2020/07/20/backup-and-restore-of-mongodb-deployment-on-kubernetes/)  
[https://www.percona.com/software/percona-kubernetes-operators](https://www.percona.com/software/percona-kubernetes-operators)  
[https://github.com/percona/percona-xtradb-cluster-operator](https://github.com/percona/percona-xtradb-cluster-operator)  
[https://github.com/percona/percona-server-mongodb-operator/](https://github.com/percona/percona-server-mongodb-operator/)  
[https://github.com/percona/percona-postgresql-operator](https://github.com/percona/percona-postgresql-operator)  
[https://github.com/jenkinsci/kubernetes-operator/blob/master/website/content/en/docs/Getting%20Started/latest/custom-backup-and-restore.md](https://github.com/jenkinsci/kubernetes-operator/blob/master/website/content/en/docs/Getting%20Started/latest/custom-backup-and-restore.md)  
[https://backup.docs.portworx.com/use-px-backup/backup-stateful-applications/jenkins/](https://backup.docs.portworx.com/use-px-backup/backup-stateful-applications/jenkins/)  
[https://www.jenkins.io/doc/book/system-administration/backing-up/](https://www.jenkins.io/doc/book/system-administration/backing-up/)  
[https://waveywaves.medium.com/managing-jenkins-with-the-jenkins-operator-0-7-0-on-openshift-4-1c6fe4434667](https://waveywaves.medium.com/managing-jenkins-with-the-jenkins-operator-0-7-0-on-openshift-4-1c6fe4434667)  
[https://github.com/redhat-developer/jenkins-operator/blob/main/docs/backupandrestore.adoc](https://github.com/redhat-developer/jenkins-operator/blob/main/docs/backupandrestore.adoc)  


[https://www.mongodb.com/docs/kubernetes-operator/master/tutorial/plan-om-resource/](https://www.mongodb.com/docs/kubernetes-operator/master/tutorial/plan-om-resource/)  
[https://www.mongodb.com/docs/ops-manager/current/core/backup-overview/](https://www.mongodb.com/docs/ops-manager/current/core/backup-overview/)  


[https://book.kubebuilder.io/reference/controller-gen.html](https://book.kubebuilder.io/reference/controller-gen.html)  
[https://medium.com/ibm-data-ai/when-and-why-create-a-kubernetes-operator-7a87f912a5bc](https://medium.com/ibm-data-ai/when-and-why-create-a-kubernetes-operator-7a87f912a5bc)  



[https://developers.redhat.com/articles/2021/09/07/build-kubernetes-operator-six-steps#](https://developers.redhat.com/articles/2021/09/07/build-kubernetes-operator-six-steps#)  
[https://developers.redhat.com/blog/2020/08/21/hello-world-tutorial-with-kubernetes-operators#test_the_service](https://developers.redhat.com/blog/2020/08/21/hello-world-tutorial-with-kubernetes-operators#test_the_service)  
[https://developers.redhat.com/articles/2021/06/11/kubernetes-operators-101-part-1-overview-and-key-features#](https://developers.redhat.com/articles/2021/06/11/kubernetes-operators-101-part-1-overview-and-key-features#)  


[https://book-v1.book.kubebuilder.io/getting_started/installation_and_setup.html#](https://book-v1.book.kubebuilder.io/getting_started/installation_and_setup.html#)  


[Get on board with Kubernetes Operators!](https://youtu.be/JNDjE9-2Bg4)  
[Kubernetes operator GAME?! - yes, I made three silly operators including a game!](https://youtu.be/WIfk7jiMFMI)  
[Writing your own Operator from scratch  Part 1 ](https://youtu.be/08O9eLJGQRM)  
[Kubernetes CRDs (Custom Resource Definitions) and CRs (Custom Resources) explained, with examples](https://youtu.be/notRETiHQew)  
[Writing Custom K8S Controller](https://youtube.com/playlist?list=PLh4KH3LtJvRQ43JAwwjvTnsVOMp0WKnJO)  
[client-go Kubernetes](https://youtube.com/playlist?list=PLh4KH3LtJvRTb_J-8T--wZeOBV3l3uQhc)  
[Generating ClientSet/Informers/Lister and CRD for Custom Resources | Writing K8S Operator - Part 1](https://youtu.be/89PdRvRUcPU)  

[https://book.kubebuilder.io/cronjob-tutorial/controller-implementation.html](https://book.kubebuilder.io/cronjob-tutorial/controller-implementation.html)  
[https://book.kubebuilder.io/architecture.html](https://book.kubebuilder.io/architecture.html)  

[https://go.dev/blog/using-go-modules](https://go.dev/blog/using-go-modules)  





[https://access.redhat.com/documentation/en-us/openshift_container_platform/4.7/html-single/operators/index#osdk-golang-tutorial](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.7/html-single/operators/index#osdk-golang-tutorial)  

[https://tiewei.github.io/posts/kubebuilder-vs-operator-sdk](https://tiewei.github.io/posts/kubebuilder-vs-operator-sdk)  
[https://www.nearform.com/blog/an-easy-approach-to-building-kubernetes-operators/](https://www.nearform.com/blog/an-easy-approach-to-building-kubernetes-operators/)  
[https://github.com/operator-framework/operator-sdk/issues/1758](https://github.com/operator-framework/operator-sdk/issues/1758)  



[https://sdk.operatorframework.io/docs/building-operators/golang/advanced-topics/](https://sdk.operatorframework.io/docs/building-operators/golang/advanced-topics/)  


[https://banzaicloud.com/blog/operator-sdk/](https://banzaicloud.com/blog/operator-sdk/)  



[https://www.ibm.com/cloud/blog/resource-group-support-in-ibm-cloud-kubernetes-service](https://www.ibm.com/cloud/blog/resource-group-support-in-ibm-cloud-kubernetes-service)  


[https://medium.com/velotio-perspectives/extending-kubernetes-apis-with-custom-resource-definitions-crds-139c99ed3477](https://medium.com/velotio-perspectives/extending-kubernetes-apis-with-custom-resource-definitions-crds-139c99ed3477)  



[https://v1-20-x.sdk.operatorframework.io/build/](https://v1-20-x.sdk.operatorframework.io/build/)  
[https://v1-20-x.sdk.operatorframework.io/docs/building-operators/golang/quickstart/](https://v1-20-x.sdk.operatorframework.io/docs/building-operators/golang/quickstart/)  
[https://v1-20-x.sdk.operatorframework.io/docs/building-operators/golang/tutorial/](https://v1-20-x.sdk.operatorframework.io/docs/building-operators/golang/tutorial/)  

[https://v1-20-x.sdk.operatorframework.io/docs/building-operators/helm/quickstart/](https://v1-20-x.sdk.operatorframework.io/docs/building-operators/helm/quickstart/)  
[https://v1-20-x.sdk.operatorframework.io/docs/building-operators/helm/tutorial/](https://v1-20-x.sdk.operatorframework.io/docs/building-operators/helm/tutorial/)  
[https://v1-20-x.sdk.operatorframework.io/docs/olm-integration/tutorial-bundle/#enabling-olm](https://v1-20-x.sdk.operatorframework.io/docs/olm-integration/tutorial-bundle/#enabling-olm)  
[https://olm.operatorframework.io/](https://olm.operatorframework.io/)  


[https://medium.com/ibm-data-ai/when-and-why-create-a-kubernetes-operator-7a87f912a5bc](https://medium.com/ibm-data-ai/when-and-why-create-a-kubernetes-operator-7a87f912a5bc)  


[Demo: Creating Golang-based Operators using Operator SDK 1.2.0](https://youtu.be/9QR3sRp-6Xk)  
[Cross region replication in Percona Kubernetes Operators // DoK Talks #107](https://youtu.be/3aMTd2zEuao)  
[Julian Fischer @ DoK Day Talk - Principles For Building Operators PART 1](https://youtu.be/RnzDCzr-_sc)  
[A chat around kubernetes operators - #6 Dok community](https://youtu.be/j60Ge1RijMA)  
[What is an operator? Karuna Tata in DoK Students Day 2021](https://youtu.be/YERy7Uqt_J4)  
[Kanister: Application Level Data Operations on Kubernetes - Pavan Navarathna](https://youtu.be/ooJFt0bid1I)  
[Databases Operations and the Cloud - DoK Talks #129](https://youtu.be/75AnPvwGWs4)  
[Hyperledger Fabric on Kubernetes using HLF Operator](https://youtu.be/ygQmjpqKkTo)  
[OCB: Operator-SDK Update/Road Map - Varsha Prasad Narsing, Rashmi Gottipati, Joe Lanford (Red Hat)](https://youtu.be/4y6RoCCLSDw)  




[https://faun.pub/writing-kubernetes-operator-using-operator-sdk-c2e7f845163a](https://faun.pub/writing-kubernetes-operator-using-operator-sdk-c2e7f845163a)  
[https://github.com/operator-framework/awesome-operators](https://github.com/operator-framework/awesome-operators)  
[https://github.com/shubhomoy/loggingoperator](https://github.com/shubhomoy/loggingoperator)  
[https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/)  

[https://github.com/instaclustr/cassandra-operator](https://github.com/instaclustr/cassandra-operator)  
[https://github.com/GoogleCloudPlatform/spark-on-k8s-operator](https://github.com/GoogleCloudPlatform/spark-on-k8s-operator)  

[https://docs.okd.io/3.11/admin_guide/custom_resource_definitions.html](https://docs.okd.io/3.11/admin_guide/custom_resource_definitions.html)  





[https://developer.ibm.com/articles/introduction-to-kubernetes-operators/](https://developer.ibm.com/articles/introduction-to-kubernetes-operators/)  
[https://operatorframework.io/operator-capabilities/](https://operatorframework.io/operator-capabilities/)  
[https://olm.operatorframework.io/](https://olm.operatorframework.io/)  
[https://cloud.redhat.com/blog/build-your-kubernetes-operator-with-the-right-tool](https://cloud.redhat.com/blog/build-your-kubernetes-operator-with-the-right-tool)  
[https://developer.ibm.com/learningpaths/kubernetes-operators/operators-extend-kubernetes/](https://developer.ibm.com/learningpaths/kubernetes-operators/operators-extend-kubernetes/)  
[https://kubernetes.io/docs/concepts/architecture/controller/](https://kubernetes.io/docs/concepts/architecture/controller/)  
[https://developer.ibm.com/learningpaths/kubernetes-operators/develop-deploy-simple-operator/installation/](https://developer.ibm.com/learningpaths/kubernetes-operators/develop-deploy-simple-operator/installation/)  
[https://developer.ibm.com/learningpaths/kubernetes-operators/](https://developer.ibm.com/learningpaths/kubernetes-operators/)  
[https://www.ibm.com/docs/en/cloud-paks/cp-biz-automation/19.0.x?topic=installing-containers-kubernetes-operators](https://www.ibm.com/docs/en/cloud-paks/cp-biz-automation/19.0.x?topic=installing-containers-kubernetes-operators)  
[https://www.ibm.com/docs/en/eam/4.1?topic=clusters-developing-kubernetes-operator](https://www.ibm.com/docs/en/eam/4.1?topic=clusters-developing-kubernetes-operator)  
[https://developer.ibm.com/learningpaths/why-when-kubernetes-operators/](https://developer.ibm.com/learningpaths/why-when-kubernetes-operators/)  
[https://developer.ibm.com/learningpaths/why-when-kubernetes-operators/operator-introduction/](https://developer.ibm.com/learningpaths/why-when-kubernetes-operators/operator-introduction/)  
[https://developer.ibm.com/conferences/oscc_become_a_kubernetes_contributor/kubernetes_operators_and_operatorsdk/](https://developer.ibm.com/conferences/oscc_become_a_kubernetes_contributor/kubernetes_operators_and_operatorsdk/)  

[https://developer.ibm.com/learningpaths/kubernetes-operators/develop-deploy-advanced-operator-janusgraph/how-to-make-an-operator/](https://developer.ibm.com/learningpaths/kubernetes-operators/develop-deploy-advanced-operator-janusgraph/how-to-make-an-operator/)  
[https://github.com/IBM/create-and-deploy-memcached-operator-using-go/blob/main/artifacts/memcached_controller.go](https://github.com/IBM/create-and-deploy-memcached-operator-using-go/blob/main/artifacts/memcached_controller.go)  
[https://developer.ibm.com/learningpaths/kubernetes-operators/develop-deploy-simple-operator/deep-dive-memcached-operator-code/](https://developer.ibm.com/learningpaths/kubernetes-operators/develop-deploy-simple-operator/deep-dive-memcached-operator-code/)  
[https://developer.ibm.com/learningpaths/kubernetes-operators/develop-deploy-advanced-operator-janusgraph/how-to-make-an-operator/](https://developer.ibm.com/learningpaths/kubernetes-operators/develop-deploy-advanced-operator-janusgraph/how-to-make-an-operator/)  
[https://developer.ibm.com/learningpaths/why-when-kubernetes-operators/operator-introduction/](https://developer.ibm.com/learningpaths/why-when-kubernetes-operators/operator-introduction/)  
[https://developer.ibm.com/learningpaths/why-when-kubernetes-operators/operator-example/](https://developer.ibm.com/learningpaths/why-when-kubernetes-operators/operator-example/)  
[https://developer.ibm.com/learningpaths/why-when-kubernetes-operators/custom-controller-code/](https://developer.ibm.com/learningpaths/why-when-kubernetes-operators/custom-controller-code/)  
[https://developer.ibm.com/learningpaths/why-when-kubernetes-operators/why-operator-tutorial/](https://developer.ibm.com/learningpaths/why-when-kubernetes-operators/why-operator-tutorial/)  
[https://blog.harbur.io/kubernetes-crd-and-controllers-to-manage-google-cloud-sql-dbs-91b7c1250a64](https://blog.harbur.io/kubernetes-crd-and-controllers-to-manage-google-cloud-sql-dbs-91b7c1250a64)  
[https://blog.harbur.io/leverage-k8s-crd-and-kubebuilder-to-create-a-telegram-message-resource-8ce8ac329d89](https://blog.harbur.io/leverage-k8s-crd-and-kubebuilder-to-create-a-telegram-message-resource-8ce8ac329d89)  
[https://www.aquasec.com/aqua-cloud-native-security-platform/](https://www.aquasec.com/aqua-cloud-native-security-platform/)  
[https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/)  
[https://kubernetes.io/docs/tasks/extend-kubernetes/configure-aggregation-layer/](https://kubernetes.io/docs/tasks/extend-kubernetes/configure-aggregation-layer/)  

[https://itnext.io/under-the-hood-of-kubebuilder-framework-ff6b38c10796?gi=aef1a4787d16](https://itnext.io/under-the-hood-of-kubebuilder-framework-ff6b38c10796?gi=aef1a4787d16)  
[https://itnext.io/under-the-hood-of-the-operator-sdk-eebc8fdeebbf](https://itnext.io/under-the-hood-of-the-operator-sdk-eebc8fdeebbf)  

[https://didil.medium.com/autobucket-operator-7e77eca95fcc](https://didil.medium.com/autobucket-operator-7e77eca95fcc)  
[https://github.com/didil/autobucket-operator/blob/master/controllers/bucket_controller.go](https://github.com/didil/autobucket-operator/blob/master/controllers/bucket_controller.go)  



[https://www.infracloud.io/blogs/prometheus-operator-helm-guide/](https://www.infracloud.io/blogs/prometheus-operator-helm-guide/)  
[Setup Prometheus Monitoring on Kubernetes using Helm and Prometheus Operator | Part 1](https://youtu.be/QoDqxm7ybLc)  
[Introduction to the Prometheus Operator on Kubernetes](https://youtu.be/LQpmeb7idt8)  
[https://github.com/marcel-dempers/docker-development-youtube-series](https://github.com/marcel-dempers/docker-development-youtube-series)  
[How Prometheus Monitoring works | Prometheus Architecture explained](https://youtu.be/h4Sl21AKiDg)  





[An Introduction to Kubernetes Operators](https://youtu.be/5TPVHndMX8w)  


[https://developer.redis.com/create/kubernetes/kubernetes-operator/](https://developer.redis.com/create/kubernetes/kubernetes-operator/)  

[Writing a Kubernetes Operator from Scratch Using Kubebuilder - Dinesh Majrekar](https://youtu.be/LLVoyXjYlYM)   




[https://atlassian.github.io/data-center-helm-charts/userguide/PREREQUISITES/](https://atlassian.github.io/data-center-helm-charts/userguide/PREREQUISITES/)  
[https://github.com/atlassian/data-center-helm-charts/](https://github.com/atlassian/data-center-helm-charts/)  



[https://blog.couchbase.com/couchbase-autonomous-operator-for-kubernetes-vs-mongodb-enterprise-kubernetes-operator/](https://blog.couchbase.com/couchbase-autonomous-operator-for-kubernetes-vs-mongodb-enterprise-kubernetes-operator/)  
[https://www.couchbase.com/products/cloud/kubernetes?ref=blog](https://www.couchbase.com/products/cloud/kubernetes?ref=blog)  


[Build Your Kubernetes Operator with the Right Tool! // DoK Talks #90](https://youtu.be/2b_W_gb6O30)  
[https://github.com/leszko/build-your-operator](https://github.com/leszko/build-your-operator)  



[https://book.kubebuilder.io/](https://book.kubebuilder.io/)  
[https://book.kubebuilder.io/reference/markers.html](https://book.kubebuilder.io/reference/markers.html)  
[https://book.kubebuilder.io/architecture.html](https://book.kubebuilder.io/architecture.html)  
[https://book.kubebuilder.io/cronjob-tutorial/cronjob-tutorial.html](https://book.kubebuilder.io/cronjob-tutorial/cronjob-tutorial.html)  



[https://vmblog.com/archive/2019/11/04/operators-a-journey-from-helm-to-golang-to-deliver-on-cloud-native-applications-day-2-operations.aspx#.YpBcjTlBxH4](https://vmblog.com/archive/2019/11/04/operators-a-journey-from-helm-to-golang-to-deliver-on-cloud-native-applications-day-2-operations.aspx#.YpBcjTlBxH4)  

