
# Operators  



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
[https://www.giantswarm.io/blog/vertical-autoscaling-in-kubernetes](https://www.giantswarm.io/blog/vertical-autoscaling-in-kubernetes)  
[https://cloud.google.com/kubernetes-engine/docs/concepts/verticalpodautoscaler](https://cloud.google.com/kubernetes-engine/docs/concepts/verticalpodautoscaler)  
[https://spot.io/resources/kubernetes-autoscaling-3-methods-and-how-to-make-them-great/](https://spot.io/resources/kubernetes-autoscaling-3-methods-and-how-to-make-them-great/)  
