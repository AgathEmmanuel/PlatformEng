

# istio  




## Why service mesh  




Each pod runs a microservice that plays a different but vital role in fulfilling that request. Let us call this role played by each pod or container as a business logic. Each Microservice has to communicate with another MS depending on the type of request.



Reason 1 :

These clusters of pods are managed by Kubernetes and are protected by an external firewall. See picture above. The overall application is protected by a firewall and all requests from the World wide web are encrypted. But inside the kubernetes cluster, the system without a service mesh  will communicate with each other in simple plain text.




The communications inside the cluster are insecure. This poses a very serious threat to the overall security of the application. Once an attacker is inside the cluster, he will have complete freedom with no hurdles to do anything he wants. Developers can solve this by integrating additional authentication protocols known as security logics. The added security layer needs to be integrated with the business logic making the overall code complex.





Reason 2 :

Inside a Kubernetes cluster, these pods can communicate with any other pod inside the cluster. But to ensure fast communications, we need to define communication logic. An additional logic integration further complicates the code.  Developers need to manage their core business logic and on top of additional security and communication logic.
Reason 3

Running a monitoring service is essential, as we need to monitor logs and performance. This is done by implementing monitoring agents or monitoring logic.
Reason 4

Think of the developer’s plight when he must add each type of logic into each of these containers /pods. This is a very wasteful practice, and developers end up spending more time on writing these logics than on writing the core business logic of the application. Besides taking time, it aggravates the complexity of these microservices. This goes against the vision of a microservice that is simple and lightweight.






# How does A Service Mesh Solve this problem?

The solution was pretty simple. Automate all repetitive and static logic tasks. Service mesh groups these tasks into a sidecar application called a sidecar proxy. With the help of a control plane, service mesh can automatically configure and inject these proxies into each pod so that developers can focus on only building business logic. Now the pods can communicate with each other securely through the sidecar proxy injected into each pod.



# What more can Service Mesh do for me?

Service mesh can act as a brilliant load balancer and is also one of the core features. It can be easily configured to split traffic. Let us take an example to understand how. Consider you are running an application on multiple clusters. One of your developers has added a new feature to the core application and wants to test it out on production with live traffic. The easiest deployment strategy that he can test out his latest feature is by pushing it into a container or pod inside the cluster and then diverting a portion of the over traffic to collect essential logs and metrics. 

The service mesh sidecar is also designed to collect APM and logs that he can use for performing his analysis on the canary instance. These logs and metrics are collected using a tool like Splunk or Datadog. But With the help of OpsMx Autopilot, one can automate the whole process of testing out a deployment using a canary analysis and perform automatic rollbacks whenever necessary.




Istio’s powerful features provide a uniform and more efficient way to secure, connect, and monitor services. Istio is the path to load balancing, service-to-service authentication, and monitoring–with few or no service code changes. Its powerful control plane brings vital features, including features like Dynamic service discovery, Load balancing, TLS termination, HTTP/2 and proxies, Circuit breakers, Health checks, Staged rollouts with%-based traffic split, Fault injection and Rich metrics.




The benefits of putting everything into a daemon i.e. Istiod

    Easy Installation: Fewer configurations enable developers to kick-start istio control plane with all features, even for a single pod.
    Easy Configuration: in the 1.5 version, we needed multiple configurations to orchestrate a control plane which is now redundant. 
    Easy Maintenance: Installing, upgrading, and removing Istio no longer requires a complicated process of version dependencies and startup orders. For example: To upgrade, you only need to start a new istiod version alongside your existing control plane, canary it, and then move all traffic over to it.
    Scalability 
    Faster Troubleshooting: Fewer components allow for fast environmental debugging.
    Quick Startup time: Components no longer need to wait for each other to start in a defined order.
    Reduced Resource usage and improved responsiveness: Communication between components becomes guaranteed. Caches can be shared safely, which decreases the resource footprint.

# components

Mixer : Mixer is a platform independent component that enforces access control and policies across the service mesh and collects metrics and logs to be used by other analysis tools like Splunk and DataDog. Read more on how integrating Autopilot with Splunk and Datadog can unlock multiple benefits for your pipeline.

Pilot : Pilot provides service discovery for the Envoy sidecars, traffic management capabilities for intelligent routing (e.g., A/B tests, canary rollouts, etc.), and resiliency (timeouts, retries, circuit breakers, etc.).

Citadel : Citadel enables strong service-to-service and end-user authentication with built-in identity and credential management. 

Galley : Galley is Istio’s configuration validation, ingestion, processing and distribution component. It is responsible for insulating the rest of the Istio components from the details of obtaining user configuration from the underlying platform (e.g. Kubernetes).


# Benefits of using Istio with Kubernetes

    Secure cloud-native apps : Focus on security at the application level with strong identity-based authentication, authorization, and encryption.
    Manage traffic effectively: Get fine-grained control of traffic behavior with rich routing rules, retries, failovers, and fault injection. In post production testing chaos monkey integration allows SRE’s to inject delays, faults to improve the robustness . 
    Monitor service mesh : Itsio provides a service level visibility that allows for tracing and monitoring. This improves troubleshooting. A bottleneck issue without granular level details will take a lot of time to fish out. With service mesh, you can easily break the circuit to failed services to disable non-functioning replicas and keep the API responsive.
    Easily deploy with Kubernetes and virtual machines : Istio provides visibility and network controls for both traditional and modern workloads including containers and virtual machines. 
    Simplify load balancing with advanced features : Use automated load balancing for all of your traffic, along with advanced features like client-based routing and canary rollouts. 
    Enforce policies : Enforce policies with a pluggable policy layer and configuration API that supports access controls, rate limits, and quotas.



Simplify observability, traffic management, security, and policy with the leading service mesh.  


- traffic Management
- ingress gateways  
- virtual services  
- destination rule (map configurign rules to link specific labels in k8s model to subsets in istio model )  
- advanced route rules (route to specific versions based on requests )
- istio load-balancing ratios  
- routing for canary deployment  
- testing a new release with canary  
- MTLS credentials  ( mutual TLS endpoint )  
- OpenTracing  
- Jaeger UI  
- request latencies  
- multi-service path  
- Policy Enforcement
- injecting faults in service response (to see how system interacts with faults)   
- add force aborts in needed applications (when service request comes its aborted )   
- mirroring connections (2 subset,1 for main traffic and 1 for mirrored trafic)  
- ciruit breaker test with timeouts (virtuaservice edited to add delay to requests) 
- observability




while [ 1 ];do curl http://$(minikube ip):31575/version/ ;done  
watch curl   



Traffic Management in Istio

The following CRDs are defined in Istio to help users with traffic management.

    Gateway:

Gateway describes a load balancer that runs at the edge of the network and is used to receive incoming or outgoing HTTP/TCP connections.

    VirtualService:

 VirtualService actually connects the Kubernetes service to the Istio Gateway. It can also perform additional operations, such as defining a set of traffic routing rules to be applied when a host is addressed.

    DestinationRule:

 The policy defined by the DestinationRule determines the access policy for the traffic after it has been routed. Simply put, it defines how traffic is routed. Among others, these policies can be defined as load balancing configurations, connection pool sizes, and external detection (for identifying and expelling unhealthy hosts in the load balancing pool) configurations.

    EnvoyFilter:

 The EnvoyFilter object describes filters for proxy services that can customize the proxy configuration generated by Istio Pilot. This configuration is generally rarely used by primary users.

    ServiceEntry:

 By default, services in the Istio service mesh are unable to discover services outside of the Mesh. ServiceEntry enables additional entries to be added to the service registry inside Istio, thus allowing automatically discovered services in the mesh to access and route to these manually added services.





## Service Discovery  


changes require code updates  
dynamic URLs in the cloud  
load balancing  
multiple environments  

kubernetes solves service discovery not istio  
Kubernetes is essentially about application lifecycle management through declarative configuration,
while a service mesh is essentially about providing inter-application traffic, security management and observability.
If you have already built a stable application platform using Kubernetes, 
how do you set up load balancing and traffic control for calls between services? This is where a service mesh comes into the picture.

A service mesh is based on transparent proxies that intercept traffic between services through sidecar proxies, and then manage the behavior of them through control plane configuration.
A service mesh decouples traffic management from Kubernetes, eliminating the need for a kube-proxy component to support traffic within service mesh; and managing inter-service traffic, security and observability by providing an abstraction closer to the microservice application layer.
xDS is one of the protocol standards for service mesh configuration.
A service mesh is a higher-level abstraction of service in Kubernetes.


## Why use Istio? 

Istio enables organizations to secure, connect, and monitor microservices, 
so they can modernize their enterprise apps more swiftly and securely.

Istio’s traffic routing rules let you easily control the flow of traffic and API calls between services. 
Istio simplifies configuration of service-level properties like circuit breakers, timeouts, and retries, 
and makes it easy to set up important tasks like A/B testing, canary rollouts, and staged rollouts with percentage-based traffic splits. 
It also provides out-of-box reliability features that help make your application more resilient against failures of dependent services or the network.

Istio’s traffic management model relies on the Envoy proxies that are deployed along with your services. 
All traffic that your mesh services send and receive (data plane traffic) is proxied through Envoy, 
making it easy to direct and control traffic around your mesh without making any changes to your services.


How do I expose services in the Istio service mesh?  

Approach 			Controller 				Features  
NodePort/LoadBalancer 		Kubernetes 		Load balancing  
Kubernetes Ingress 		Ingress controller 	Load balancing, TLS, virtual host, traffic routing  
Istio Gateway 			Istio  			Load balancing, TLS, virtual host, advanced traffic routing,   
							other advanced Istio features  
API Gateway 			API Gateway 		Load balancing, TLS, virtual host, advanced traffic routing, API  
							lifecycle management, billing, rate limiting, policy enforcement, data aggregation  


Summary  

In the Istio service mesh, you can use a variety of Kubernetes Ingress Controllers to act as entry gateways, but of course, you can also use Istio’s built-in Istio Gateway directly, for policy control, traffic management, and usage monitoring. The advantage of this is that the gateway can be managed directly through Istio’s control plane, without the need for additional tools. But for functions such as API statement cycle management, complex billing, protocol conversion, and authentication, a traditional API gateway may be a better fit for you. So, you can choose according to your needs, or you can use a combination.  

Some traditional reverse proxies are also moving towards service mesh, such as Nginx with Nginx Service Mesh and Traefik with Traefik Mesh, and some API gateway products are also moving towards service mesh, such as Kong with Kuma, and in the future, we will see more convergence of API gateways, reverse proxies, and service meshes.  



There isn’t a lot of agreement in the industry about what capabilities are “must haves” for a tool to serve as an API gateway. We typically see customers requiring the following abilities (grouped by use case):
Resilience Use Cases

    A/B testing, canary deployments, and blue‑green deployments
    Protocol transformation (between JSON and XML, for example)
    Rate limiting
    Service discovery

Traffic Management Use Cases

    Method‑based routing and matching
    Request/response header and body manipulation
    Request routing at Layer 7

Security Use Cases

    API schema enforcement
    Client authentication and authorization
    Custom responses
    Fine‑grained access control
    TLS termination


Ingress controllers have the potential to enable many API gateway use cases. In addition to the ones outlined in Definitions, we find organizations most value an Ingress controller that can implement:

    Offload of authentication and authorization
    Authorization‑based routing
    Layer 7 level routing and matching (HTTP, HTTP/S, headers, cookies, methods)
    Protocol compatibility (HTTP, HTTP/2, WebSocket, gRPC)
    Rate limiting




## Links  

[https://istio.io/](https://istio.io/)
[https://istio.io/latest/docs/examples/microservices-istio/](https://istio.io/latest/docs/examples/microservices-istio/)  
[https://istio.io/latest/docs/ops/deployment/architecture/](https://istio.io/latest/docs/ops/deployment/architecture/)  
[https://istio.io/latest/docs/concepts/traffic-management/](https://istio.io/latest/docs/concepts/traffic-management/)  
[https://thenewstack.io/why-do-you-need-istio-when-you-already-have-kubernetes/](https://thenewstack.io/why-do-you-need-istio-when-you-already-have-kubernetes/)  
[https://www.ibm.com/docs/en/cloud-private/3.2.0?topic=discovery-enabling-istio-service](https://www.ibm.com/docs/en/cloud-private/3.2.0?topic=discovery-enabling-istio-service)  
[https://istio.io/latest/docs/ops/configuration/traffic-management/protocol-selection/](https://istio.io/latest/docs/ops/configuration/traffic-management/protocol-selection/)  
[https://cloud.google.com/learn/what-is-istio](https://cloud.google.com/learn/what-is-istio)  
[https://cloud.google.com/blog/products/devops-sre/the-service-mesh-era-using-istio-and-stackdriver-to-build-an-sre-service](https://cloud.google.com/blog/products/devops-sre/the-service-mesh-era-using-istio-and-stackdriver-to-build-an-sre-service)  
[https://cloud.google.com/migrate/compute-engine/docs/4.8/how-to/monitoring/using-stackdriver-monitoring](https://cloud.google.com/migrate/compute-engine/docs/4.8/how-to/monitoring/using-stackdriver-monitoring)  
[https://medium.com/avmconsulting-blog/service-discovery-for-microservices-with-kubernetes-bf4353953553](https://medium.com/avmconsulting-blog/service-discovery-for-microservices-with-kubernetes-bf4353953553)  
[https://github.com/GoogleCloudPlatform/istio-samples/tree/master/istio-stackdriver](https://github.com/GoogleCloudPlatform/istio-samples/tree/master/istio-stackdriver)  
[https://docs.eupraxia.io/docs/how-to-guides/deploy-nginx-webserver-to-istio/](https://docs.eupraxia.io/docs/how-to-guides/deploy-nginx-webserver-to-istio/)  
[https://medium.com/@niravshah2705/bind-istio-with-api-gateway-iaac-aa44e908eb4a](https://medium.com/@niravshah2705/bind-istio-with-api-gateway-iaac-aa44e908eb4a)  
[https://aspenmesh.io/api-gateway-vs-service-mesh/](https://aspenmesh.io/api-gateway-vs-service-mesh/)  
[https://medium.com/microservices-in-practice/service-mesh-vs-api-gateway-a6d814b9bf56](https://medium.com/microservices-in-practice/service-mesh-vs-api-gateway-a6d814b9bf56)  
[https://blog.christianposta.com/microservices/do-i-need-an-api-gateway-if-i-have-a-service-mesh/](https://blog.christianposta.com/microservices/do-i-need-an-api-gateway-if-i-have-a-service-mesh/)  
[https://blog.getambassador.io/api-gateway-vs-service-mesh-104c01fa4784](https://blog.getambassador.io/api-gateway-vs-service-mesh-104c01fa4784)  
[https://community.ibm.com/community/user/integration/blogs/kim-clark1/2018/11/13/comparing-a-service-mesh-with-api-management-in-a-microservice-architecture](https://community.ibm.com/community/user/integration/blogs/kim-clark1/2018/11/13/comparing-a-service-mesh-with-api-management-in-a-microservice-architecture)  
[Istio as an API Gateway](https://youtu.be/NRh0waZAmeQ)  
[https://www.openpolicyagent.org/docs/latest/envoy-tutorial-istio/](https://www.openpolicyagent.org/docs/latest/envoy-tutorial-istio/)  
[https://www.tetrate.io/blog/istio-service-mesh-api-gateway/](https://www.tetrate.io/blog/istio-service-mesh-api-gateway/)  
[https://banzaicloud.com/blog/backyards-api-gateway/](https://banzaicloud.com/blog/backyards-api-gateway/)  
[https://www.nginx.com/blog/how-do-i-choose-api-gateway-vs-ingress-controller-vs-service-mesh/](https://www.nginx.com/blog/how-do-i-choose-api-gateway-vs-ingress-controller-vs-service-mesh/)  
[https://www.nginx.com/blog/deploying-nginx-plus-as-an-api-gateway-part-1/](https://www.nginx.com/blog/deploying-nginx-plus-as-an-api-gateway-part-1/)  
[https://github.com/istio/istio/tree/master/samples/bookinfo/networking](https://github.com/istio/istio/tree/master/samples/bookinfo/networking)  
[https://istio.io/latest/docs/examples/bookinfo/](https://istio.io/latest/docs/examples/bookinfo/)  

[https://www.mirantis.com/blog/your-app-deserves-more-than-kubernetes-ingress-kubernetes-ingress-vs-istio-gateway-webinar/](https://www.mirantis.com/blog/your-app-deserves-more-than-kubernetes-ingress-kubernetes-ingress-vs-istio-gateway-webinar/)  


[https://www.istioworkshop.io/09-traffic-management/01-ingress-gateway/](https://www.istioworkshop.io/09-traffic-management/01-ingress-gateway/)  
[https://www.istioworkshop.io/09-traffic-management/03-traffic-splitting/](https://www.istioworkshop.io/09-traffic-management/03-traffic-splitting/)  
[https://www.istioworkshop.io/09-traffic-management/04-canary-deployment/](https://www.istioworkshop.io/09-traffic-management/04-canary-deployment/)  
[https://www.istioworkshop.io/09-traffic-management/05-fault-injection/](https://www.istioworkshop.io/09-traffic-management/05-fault-injection/)  
[https://www.istioworkshop.io/09-traffic-management/06-circuit-breaker/](https://www.istioworkshop.io/09-traffic-management/06-circuit-breaker/)  
[https://www.istioworkshop.io/09-traffic-management/07-retry-strategy/](https://www.istioworkshop.io/09-traffic-management/07-retry-strategy/)  
[https://www.istioworkshop.io/09-traffic-management/08-egress-gateway/](https://www.istioworkshop.io/09-traffic-management/08-egress-gateway/)  



[https://medium.com/google-cloud/back-to-microservices-with-istio-p1-827c872daa53](https://medium.com/google-cloud/back-to-microservices-with-istio-p1-827c872daa53) 





[https://istio.io/v0.7/docs/setup/kubernetes/quick-start-gke-dm.html](https://istio.io/v0.7/docs/setup/kubernetes/quick-start-gke-dm.html)  
[https://kublr.com/blog/hands-on-canary-deployments-with-istio-and-kubernetes/](https://kublr.com/blog/hands-on-canary-deployments-with-istio-and-kubernetes/)  
[https://stackoverflow.com/questions/63102235/url-regex-match-for-istio-virtualservice-throwing-404](https://stackoverflow.com/questions/63102235/url-regex-match-for-istio-virtualservice-throwing-404)  
[https://istio.tetratelabs.io/blog/istio-traffic-management-walkthrough-p2/](https://istio.tetratelabs.io/blog/istio-traffic-management-walkthrough-p2/)  

[https://discuss.istio.io/t/upstream-connect-error-or-disconnect-reset-before-headers-reset-reason-connection-termination/4434/4](https://discuss.istio.io/t/upstream-connect-error-or-disconnect-reset-before-headers-reset-reason-connection-termination/4434/4)  
[https://istio.io/latest/docs/ops/best-practices/traffic-management/](https://istio.io/latest/docs/ops/best-practices/traffic-management/)  
[https://stackoverflow.com/questions/45300681/cant-access-mongo-from-node-container-running-in-istio](https://stackoverflow.com/questions/45300681/cant-access-mongo-from-node-container-running-in-istio)  
[https://github.com/istio/old_pilot_repo/pull/896](https://github.com/istio/old_pilot_repo/pull/896)  
[https://github.com/istio/istio/issues/28623](https://github.com/istio/istio/issues/28623)  

[https://istio.io/v1.0/docs/tasks/traffic-management/secure-ingress/](https://istio.io/v1.0/docs/tasks/traffic-management/secure-ingress/)  
[https://github.com/istio/old_issues_repo/issues/46](https://github.com/istio/old_issues_repo/issues/46)  
[https://discuss.istio.io/t/set-cookie-on-successful-client-response-from-external-authorization-headers-to-downstream-on-allow/12038](https://discuss.istio.io/t/set-cookie-on-successful-client-response-from-external-authorization-headers-to-downstream-on-allow/12038)  
[https://medium.com/intelligentmachines/istio-jwt-step-by-step-guide-for-micro-services-authentication-690b170348fc](https://medium.com/intelligentmachines/istio-jwt-step-by-step-guide-for-micro-services-authentication-690b170348fc)  
[https://istio.io/latest/docs/tasks/security/authentication/authn-policy/#end-user-authentication](https://istio.io/latest/docs/tasks/security/authentication/authn-policy/#end-user-authentication)  
[https://github.com/istio/istio/issues/15570](https://github.com/istio/istio/issues/15570)  

[https://developer.ibm.com/articles/using-istio-for-advanced-microservices-deployments/](https://developer.ibm.com/articles/using-istio-for-advanced-microservices-deployments/)  
[https://istio.io/latest/docs/tasks/traffic-management/ingress/secure-ingress/](https://istio.io/latest/docs/tasks/traffic-management/ingress/secure-ingress/)  
[https://medium.com/intelligentmachines/istio-part-2-traffic-management-consistent-hashing-canary-dark-releases-38ee0334321a](https://medium.com/intelligentmachines/istio-part-2-traffic-management-consistent-hashing-canary-dark-releases-38ee0334321a)  
