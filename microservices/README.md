

# Microservices  

    Authentication: Refers to verify who you are, so you need to use username and password for authentication.

    Authorization: Refers to what you can do, for example access, edit or delete permissions to some documents, and this happens after verification passes.



Microservices authentication and authorization problems






## Atuthentication  
authentication and authorization logic needs to be handled in each microservice, and this part of the global logic needs to be implemented repeatedly in each microservice. Although we can use the code base to reuse part of the code, this will in turn cause all micro services to have a dependency on a particular code base and its version, affecting the flexibility of the microservice language/framework selection.
    Microservices should follow the principle of single responsibility. A microservice only handles a single business logic. The global logic of authentication and authorization should not be placed in the microservice implementation.
    HTTP is a stateless protocol. For the server, each time the user’s HTTP request is independent. Stateless means that the server can send client requests to any node in the cluster as needed. The stateless design of HTTP has obvious benefits for load balancing. Because there is no state, user requests can be distributed to any server. For services that do not require authentication, such as browsing news pages, there is no problem. However, many services, such as online shopping and enterprise management systems, need to authenticate the user’s identity. Therefore, it is necessary to save the user’s login status in a manner based on the HTTP protocol so as to prevent the user from needing to perform verification for each request. The traditional way is to use a session on the server side to save the user state. Because the server is stateful, it affects the horizontal expansion of the server.
    The authentication and authorization in the microservices architecture involves scenarios that are more complex, involving users accessing microservice applications, third-party applications accessing microservice applications, and multiple microservice applications accessing each other, and in each scenario, The following authentication and authorization schemes need to be considered to ensure the security of the application.




Microservices authentication and authorization technical solutions
















Edge-Level Authorization

In a simple scenario, authorization only occurs at the edge, typically using an API Gateway. You can use an API Gateway to centralize authentication and authorization for all downstream microservices. The gateway enforces authentication and access control for each microservice. In this case, NIST recommends implementing mitigation controls such as mutual authentication between microservices to prevent direct anonymous connections to internal services.

This strategy has the following disadvantages:

    Less secure—if an attacker gets past the gateway, they can freely access any microservice. An API Gateway as a single access point violates the “defense in depth” principle.
    More difficult to manage—if the system is complex with many roles and access control rules, pushing all authorization decisions to an API gateway can become unmanageable.
    Limited access to development teams—typically, operations and maintenance teams set up API gateways, so the development team cannot change permissions directly. This disconnect can lead to communication and process overhead.




Service-Level Authorization

This strategy enables direct authentication and authorization for each microservice. The advantage is that each microservice has more control to enforce its access control policies. A service-level authorization architecture includes the following:

    Policy Administration Point—lets administrators create, manage, and test access rules.
    Policy Decision Point—checks which access control policy applies to the current request and evaluates whether to grant or deny the request.
    Policy Enforcement Point—provides access decisions, enforcing the access policy for specific requests. 
    Policy Information Point—allows elements in the system to retrieve data about policies or receive account attributes to make policy decisions.



External Entity Identity Propagation

This strategy can make authorization decisions while taking into account user context. For example, it can change the authorization decision based on user ID, user roles or groups, user location, time, or other parameters.

To perform authentication based on entity context, you must receive information about the end-user and propagate it to downstream microservices. A simple way to achieve this is to take an Access Token received at the edge and transfer it to individual microservices. This strategy provides the most granular control over microservice authentication. However, it has two main drawbacks:

    Not secure—the content of the token is shared with all microservices, and as a result, attackers can compromise it. A possible solution is to sign tokens via a trusted issuer.
    It requires internal microservices to support multiple authentication techniques, such as JWT, OIDC, or cookies.




Single Sign-On (SSO)

SSO allows a user or entity to log in once and gain access to multiple systems. In the context of a microservices architecture, SSO can have two meanings:

Authentication of end-users  – It’s very convenient for end-users to have one central login, preferably using existing credentials, instead of requiring new credentials to log into your app. You can use identity and access management (IAM) solutions to set up a user database and define permissions for your user-facing microservices.

Microservices can redirect users to the IAM system for authentication, receive an encrypted SSO token, and then use it to log in users on subsequent attempts. Microservices can also use the IAM system for authorization, and the SSO token can specify which resources the user is permitted to access.

Authentication of microservices – You can also enable SSO for microservices that need to connect to other microservices, or to external services requesting access via API. Here you need to authorize a software entity or service account, not human users.  You can use the same IAM solution. When a software entity requires access, it can be redirected to the IAM, and the IAM system provides an SSO token they can use in future API calls.



JSON Web Tokens

JSON Web Token (JWT) provides a mechanism for sharing a set of claims or properties from a client to a microservices application in an encrypted and secure way. JWTs can also secure communication between services or pass end-user context and data between microservices.

For example, you can use a JWT token to pass the ID of the calling microservice, the ID of the client, or the system that initiated the request. You can also store authorization and authentication properties in a JWT token and share them between multiple clients and servers. 


OAuth API Authentication

OAuth 2.0 provides an industry-standard protocol for authorizing users in distributed systems. In the context of microservices, the OAuth 2.0 client credential flow supports secure server-to-server communication between API clients and API servers. The OAuth framework reduces the burden on developers, eliminating the need to build their own authentication mechanism in each microservice.

OpenID Connect (OIDC) extends OAuth to add federated identities, making it possible to set up delegated authorization. Together, these two layers allow developers to build systems that interact with multiple identity providers. With OIDC and OAuth 2.0, it’s also possible to retrieve a user ID by sending an access token to the user information endpoint. The path to this endpoint can be determined using an OIDC lookup. 








What is the difference between OpenID and OAuth?

 

The main difference between OpenID and OAuth is that OpenID is an authentication protocol while OAuth is an authorization framework. OpenID and OAuth are both open standards that complement each other, but OpenID allows users to be authenticated by relying parties. An OIDC relying party is an OAuth 2.0 Client application that requires user authentication and claims from an OIDC provider. OAuth allows access tokens to be issued to third-party clients by an authorization server. OpenID Connect is built on a profile of OAuth and provides additional capabilities in conveying the identity of the user using the application. Clients use OAuth to request access to an API on a user’s behalf, but nothing in the OAuth protocol tells the client user information. OpenID Connect enables a client to access additional information about a user, such as the user's real name, email address, birthdate or other profile information.



How does OpenID Connect work?

 

The application starts with an OAuth flow that asks the user to authorize a request. As part of that flow, the client will include the OpenID Connect scope along with scopes for any additional information it wants about the user.

 

After the request is processed, the client will receive an access token as well as an ID token issued by the authorization server that contains claims that carry information about the user. The user’s SSO experience is made possible by the delivery of the ID token from the authorization server to the client. The client can then contact a special endpoint on the authorization server known as the UserInfo endpoint to receive the remaining claims about the user.

 

OpenID Connect also defines mechanisms for discovery and session management beyond OAuth.









# Links  

[https://frontegg.com/blog/authentication-in-microservices](https://frontegg.com/blog/authentication-in-microservices)  
[https://medium.com/tech-tajawal/microservice-authentication-and-authorization-solutions-e0e5e74b248a](https://medium.com/tech-tajawal/microservice-authentication-and-authorization-solutions-e0e5e74b248a)  
[https://medium.com/@adrianmihaila/single-sign-on-across-multiple-applications-part-ii-a8a48e4a7c11](https://medium.com/@adrianmihaila/single-sign-on-across-multiple-applications-part-ii-a8a48e4a7c11)  
[https://medium.com/@adrianmihaila/single-sign-on-across-multiple-applications-part-i-93fb0616ddc8](https://medium.com/@adrianmihaila/single-sign-on-across-multiple-applications-part-i-93fb0616ddc8)  
[https://medium.com/tech-tajawal/microservice-authentication-and-authorization-solutions-e0e5e74b248a](https://medium.com/tech-tajawal/microservice-authentication-and-authorization-solutions-e0e5e74b248a)  
[https://curity.io/resources/learn/curity-opa-kong-api/](https://curity.io/resources/learn/curity-opa-kong-api/)  
[https://www.infoworld.com/article/3586149/using-opa-for-cloud-native-app-authorization.html](https://www.infoworld.com/article/3586149/using-opa-for-cloud-native-app-authorization.html)  
[How Netflix Is Solving Authorization Across Their Cloud I - Manish Mehta & Torin Sandall, Netflix](https://youtu.be/R6tUNpRpdnY)  
[Using Curity, OPA and Kong for end-to-end API authentication and authorizatio](https://youtu.be/D_STqxrJu4k)  
[https://openid.net/connect/](https://openid.net/connect/)  
[https://openid.net/what-is-openid/](https://openid.net/what-is-openid/)  
[An Illustrated Guide to OAuth and OpenID Connect](https://youtu.be/t18YB3xDfXI)  
[https://curity.io/resources/learn/integration-kong-open-source/](https://curity.io/resources/learn/integration-kong-open-source/)  
[https://www.nginx.com/resources/glossary/layer-7-load-balancing/](https://www.nginx.com/resources/glossary/layer-7-load-balancing/)  
[https://www.infoq.com/presentations/netflix-user-identity/](https://www.infoq.com/presentations/netflix-user-identity/)  
[User & Device Identity for Microservices @ Netflix Scale](https://youtu.be/eEZHZ806d6o)  
[Microservice Authorization with Open Policy Agent and Kuma](https://youtu.be/wH1JxyrWzBk)  
[https://www.openpolicyagent.org/docs/latest/envoy-tutorial-istio/](https://www.openpolicyagent.org/docs/latest/envoy-tutorial-istio/)  
[https://medium.com/swlh/securing-dockerized-microservices-with-open-policy-agent-and-envoy-c128dfc764fe](https://medium.com/swlh/securing-dockerized-microservices-with-open-policy-agent-and-envoy-c128dfc764fe)  
[https://medium.com/@shane.soh/securing-aws-apis-with-an-on-premise-identity-provider-in-a-hybrid-cloud-6ae746d4f81e](https://medium.com/@shane.soh/securing-aws-apis-with-an-on-premise-identity-provider-in-a-hybrid-cloud-6ae746d4f81e)  
[https://www.envoyproxy.io/docs/envoy/latest/start/sandboxes/ext_authz#](https://www.envoyproxy.io/docs/envoy/latest/start/sandboxes/ext_authz#)  
[https://github.com/GoogleCloudPlatform/microservices-demo](https://github.com/GoogleCloudPlatform/microservices-demo)  
[https://github.com/Netflix/msl](https://github.com/Netflix/msl)  
[https://stackoverflow.com/questions/50288599/how-to-redirect-user-to-another-page-after-login-that-base-on-jwt-token](https://stackoverflow.com/questions/50288599/how-to-redirect-user-to-another-page-after-login-that-base-on-jwt-token)  
[https://cloud.google.com/iap/docs/enabling-kubernetes-howto](https://cloud.google.com/iap/docs/enabling-kubernetes-howto)  
[https://kubernetes.io/docs/concepts/overview/kubernetes-api/](https://kubernetes.io/docs/concepts/overview/kubernetes-api/)  
[https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/)  
[https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/)  
[https://www.magalix.com/blog/extending-the-kubernetes-controller](https://www.magalix.com/blog/extending-the-kubernetes-controller)  
[Authentication as a Microservice](https://youtu.be/SLc3cTlypwM)  
[What is API gateway really all about? Java Brains - Brain Bytes](https://youtu.be/1vjOv_f9L8I)  
[https://medium.com/geekculture/zuul-api-gateway-2bcdf4dd33e6](https://medium.com/geekculture/zuul-api-gateway-2bcdf4dd33e6)  
[https://github.com/Netflix/zuul](https://github.com/Netflix/zuul)  
[What is JWT authorization really about - Java Brains](https://youtu.be/soGRyl9ztjI)  
[What is service discovery really all about? - Microservices Basics Tutorial](https://youtu.be/GboiMJm6WlA)  
[Forward proxy vs reverse proxy difference explained - Brain Bytes (Java Brains)](https://youtu.be/AuINJdBPf8I)  
[What is OAuth really all about - OAuth tutorial - Java Brains](https://youtu.be/t4-416mg6iU)  
[https://niravshah2705.medium.com/bind-istio-with-api-gateway-iaac-aa44e908eb4a](https://niravshah2705.medium.com/bind-istio-with-api-gateway-iaac-aa44e908eb4a)  
[https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment)  
[https://www.pingidentity.com/en/resources/content-library/articles/openid-connect.html](https://www.pingidentity.com/en/resources/content-library/articles/openid-connect.html)  
[https://konghq.com/blog/authorize-api-opa-kuma](https://konghq.com/blog/authorize-api-opa-kuma)  
[https://medium.com/@philipfeng/modern-open-source-messaging-apache-kafka-rabbitmq-nats-pulsar-and-nsq-ca3bf7422db5](https://medium.com/@philipfeng/modern-open-source-messaging-apache-kafka-rabbitmq-nats-pulsar-and-nsq-ca3bf7422db5)  
[https://itnext.io/contrasting-nats-with-apache-kafka-1d3bdb9aa767](https://itnext.io/contrasting-nats-with-apache-kafka-1d3bdb9aa767)  
[https://cloud.google.com/kubernetes-engine/docs/how-to/node-auto-provisioning](https://cloud.google.com/kubernetes-engine/docs/how-to/node-auto-provisioning)  
[https://docs.microsoft.com/en-us/dotnet/architecture/microservices/multi-container-microservice-net-applications/data-driven-crud-microservice](https://docs.microsoft.com/en-us/dotnet/architecture/microservices/multi-container-microservice-net-applications/data-driven-crud-microservice)  

[https://blog.stackpath.com/microservice-video-streaming/](https://blog.stackpath.com/microservice-video-streaming/)  

[https://docs.confluent.io/platform/current/tutorials/examples/microservices-orders/docs/index.html](https://docs.confluent.io/platform/current/tutorials/examples/microservices-orders/docs/index.html)  
[https://eyevinntechnology.medium.com/example-of-microservices-for-a-streaming-service-e2b2c556442e](https://eyevinntechnology.medium.com/example-of-microservices-for-a-streaming-service-e2b2c556442e)  

[Using Skaffold and GitHub Actions for Deployments to Amazon EKS](https://youtu.be/NPUBIkQayRw)  
[https://github.com/LukeMwila/nodejs-skaffold-app](https://github.com/LukeMwila/nodejs-skaffold-app)  


[https://threedots.tech/post/running-integration-tests-on-google-cloud-build/](https://threedots.tech/post/running-integration-tests-on-google-cloud-build/)  
[https://threedots.tech/series/modern-business-software-in-go/?utm_source=about-wild-workouts](https://threedots.tech/series/modern-business-software-in-go/?utm_source=about-wild-workouts)  

[GitHub Actions Bash Shell Commands](https://youtu.be/FsOtTYJ8KhQ)  


[https://wso2.com/library/articles/api-management-in-istio-microservices-using-the-kubernetes-api-operator/](https://wso2.com/library/articles/api-management-in-istio-microservices-using-the-kubernetes-api-operator/)  

[https://learnk8s.io/kubernetes-ingress-api-gateway](https://learnk8s.io/kubernetes-ingress-api-gateway)  


[https://itnext.io/github-actions-ship-code-to-gcp-cloud-run-8d607f34e1cd](https://itnext.io/github-actions-ship-code-to-gcp-cloud-run-8d607f34e1cd)  
[https://github.com/efiShtain/github-action-cloud-run/blob/master/.github/workflows/cloud-run.yml](https://github.com/efiShtain/github-action-cloud-run/blob/master/.github/workflows/cloud-run.yml)  

[https://blog.dreamfactory.com/restful-api-and-microservices-the-differences-and-how-they-work-together/](https://blog.dreamfactory.com/restful-api-and-microservices-the-differences-and-how-they-work-together/)  
