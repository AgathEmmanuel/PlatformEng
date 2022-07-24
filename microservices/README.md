

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


[https://medium.com/swlh/fastapi-microservice-patterns-application-monitoring-49fcb7341d9a](https://medium.com/swlh/fastapi-microservice-patterns-application-monitoring-49fcb7341d9a)  

[https://microservices.io/patterns/microservices.html](https://microservices.io/patterns/microservices.html)  
[https://microservices.io/patterns/observability/application-metrics.html](https://microservices.io/patterns/observability/application-metrics.html)  

[https://florian-kromer.medium.com/fastapi-microservice-patterns-local-development-environment-12182e786f1c](https://florian-kromer.medium.com/fastapi-microservice-patterns-local-development-environment-12182e786f1c)  

[https://florian-kromer.medium.com/fastapi-microservice-patterns-3052c1241019](https://florian-kromer.medium.com/fastapi-microservice-patterns-3052c1241019)  
[https://florian-kromer.medium.com/fastapi-microservice-patterns-service-discovery-in-container-orchestration-platforms-290c00d1ad8](https://florian-kromer.medium.com/fastapi-microservice-patterns-service-discovery-in-container-orchestration-platforms-290c00d1ad8)  
[https://florian-kromer.medium.com/fastapi-microservice-patterns-asynchronous-communication-45a3b68f8bb8](https://florian-kromer.medium.com/fastapi-microservice-patterns-asynchronous-communication-45a3b68f8bb8)  
[https://stackoverflow.com/questions/49005651/how-does-asyncio-actually-work/51116910#51116910](https://stackoverflow.com/questions/49005651/how-does-asyncio-actually-work/51116910#51116910)  
[https://florian-kromer.medium.com/fastapi-microservice-patterns-application-monitoring-49fcb7341d9a](https://florian-kromer.medium.com/fastapi-microservice-patterns-application-monitoring-49fcb7341d9a)  
[https://florian-kromer.medium.com/fastapi-microservice-serverless-deployment-41a6d21e5cb3](https://florian-kromer.medium.com/fastapi-microservice-serverless-deployment-41a6d21e5cb3)  
[https://florian-kromer.medium.com/fastapi-microservice-patterns-externalized-configuration-8c527e0c70a](https://florian-kromer.medium.com/fastapi-microservice-patterns-externalized-configuration-8c527e0c70a)  
[https://florian-kromer.medium.com/fastapi-microservice-patterns-graphql-api-b09ccb1de37f](https://florian-kromer.medium.com/fastapi-microservice-patterns-graphql-api-b09ccb1de37f)  
[https://github.com/fkromer/fastapi-microservice-patterns](https://github.com/fkromer/fastapi-microservice-patterns)  
[https://blog.devgenius.io/getting-started-with-fastapi-framework-60a045a44e7b](https://blog.devgenius.io/getting-started-with-fastapi-framework-60a045a44e7b)  
[https://dassum.medium.com/building-rest-apis-using-fastapi-sqlalchemy-uvicorn-8a163ccf3aa1](https://dassum.medium.com/building-rest-apis-using-fastapi-sqlalchemy-uvicorn-8a163ccf3aa1)  
[https://nabajyotiborah.medium.com/fastapi-scalable-project-structure-with-docker-compose-45dc3a9fb4c6](https://nabajyotiborah.medium.com/fastapi-scalable-project-structure-with-docker-compose-45dc3a9fb4c6)  
[https://medium.com/cuddle-ai/concurrency-with-fastapi-1bd809916130](https://medium.com/cuddle-ai/concurrency-with-fastapi-1bd809916130)  
[https://medium.com/@codelancer/banking-app-with-fastapi-and-tkinter-7e366cac9772](https://medium.com/@codelancer/banking-app-with-fastapi-and-tkinter-7e366cac9772)  
[https://medium.com/@mremreozan/deploy-a-fullstack-app-fastapi-mongo-react-in-kubernetes-on-ubuntu-wsl2-on-windows-8b66c8e1c0ed](https://medium.com/@mremreozan/deploy-a-fullstack-app-fastapi-mongo-react-in-kubernetes-on-ubuntu-wsl2-on-windows-8b66c8e1c0ed)  
[https://blog.devgenius.io/deploying-a-scalable-sql-cluster-on-kubernetes-d7907cb1605e](https://blog.devgenius.io/deploying-a-scalable-sql-cluster-on-kubernetes-d7907cb1605e)  
[https://medium.com/@rakhirekha91/learn-to-deploy-postgres-ha-on-kubernetes-in-60-minutes-bb003b49305f](https://medium.com/@rakhirekha91/learn-to-deploy-postgres-ha-on-kubernetes-in-60-minutes-bb003b49305f)  
[learn-to-deploy-postgres-ha-on-kubernetes-in-60-minutes](https://youtu.be/aIec-qhQOnw)  
[https://blog.devgenius.io/how-to-use-redis-pub-sub-in-your-python-application-b6d5e11fc8de](https://blog.devgenius.io/how-to-use-redis-pub-sub-in-your-python-application-b6d5e11fc8de)  
[https://lcalcagni.medium.com/deploy-your-fastapi-to-aws-ec2-using-nginx-aa8aa0d85ec7](https://lcalcagni.medium.com/deploy-your-fastapi-to-aws-ec2-using-nginx-aa8aa0d85ec7)  


[https://fastapi.tiangolo.com/tutorial/middleware/](https://fastapi.tiangolo.com/tutorial/middleware/)  

[https://medium.com/swlh/fastapi-microservice-patterns-application-monitoring-49fcb7341d9a](https://medium.com/swlh/fastapi-microservice-patterns-application-monitoring-49fcb7341d9a)  
[https://microservices.io/patterns/observability/distributed-tracing.html](https://microservices.io/patterns/observability/distributed-tracing.html)  
[https://microservices.io/patterns/observability/application-logging.html](https://microservices.io/patterns/observability/application-logging.html)  
[https://microservices.io/patterns/observability/exception-tracking.html](https://microservices.io/patterns/observability/exception-tracking.html)  
[https://microservices.io/patterns/observability/application-metrics.html](https://microservices.io/patterns/observability/application-metrics.html)  


[https://docs.microsoft.com/en-us/azure/architecture/microservices/](https://docs.microsoft.com/en-us/azure/architecture/microservices/)  
[https://docs.microsoft.com/en-us/azure/architecture/hybrid/hybrid-start-here](https://docs.microsoft.com/en-us/azure/architecture/hybrid/hybrid-start-here)  
[https://docs.microsoft.com/en-us/azure/media-services/latest/architecture-concept](https://docs.microsoft.com/en-us/azure/media-services/latest/architecture-concept)  
[https://docs.microsoft.com/en-us/azure/media-services/latest/concept-availability-zones](https://docs.microsoft.com/en-us/azure/media-services/latest/concept-availability-zones)  
[https://docs.microsoft.com/en-us/security/benchmark/azure/baselines/media-services-security-baseline](https://docs.microsoft.com/en-us/security/benchmark/azure/baselines/media-services-security-baseline)  
[https://docs.microsoft.com/en-us/azure/architecture/hybrid/azure-functions-hybrid](https://docs.microsoft.com/en-us/azure/architecture/hybrid/azure-functions-hybrid)  


[https://docs.microsoft.com/en-us/azure/architecture/patterns/choreography](https://docs.microsoft.com/en-us/azure/architecture/patterns/choreography)  
[https://docs.microsoft.com/en-us/azure/architecture/patterns/](https://docs.microsoft.com/en-us/azure/architecture/patterns/)  







[https://realpython.com/api-integration-in-python/](https://realpython.com/api-integration-in-python/)  
[https://www.freecodecamp.org/news/how-to-interact-with-web-services-using-python/](https://www.freecodecamp.org/news/how-to-interact-with-web-services-using-python/) 
[https://www.quora.com/How-do-you-build-a-REST-API-with-Python-without-any-frameworks-Is-there-any-source-where-I-can-learn-about-this](https://www.quora.com/How-do-you-build-a-REST-API-with-Python-without-any-frameworks-Is-there-any-source-where-I-can-learn-about-this)  
[https://www.quora.com/What-is-the-best-way-to-store-search-through-1-million-URLs](https://www.quora.com/What-is-the-best-way-to-store-search-through-1-million-URLs)  
[https://towardsdatascience.com/optimizing-memory-usage-in-python-applications-f591fc914df5](https://towardsdatascience.com/optimizing-memory-usage-in-python-applications-f591fc914df5)  
[https://www.quora.com/What-is-the-best-data-structure-for-maintaining-URLs-that-have-been-visited-by-a-Web-crawler](https://www.quora.com/What-is-the-best-data-structure-for-maintaining-URLs-that-have-been-visited-by-a-Web-crawler)  
[https://stackoverflow.com/questions/3917574/how-is-pythons-list-implemented](https://stackoverflow.com/questions/3917574/how-is-pythons-list-implemented)  
[https://www.geeksforgeeks.org/count-the-number-of-words-with-given-prefix-using-trie/](https://www.geeksforgeeks.org/count-the-number-of-words-with-given-prefix-using-trie/)  

[https://realpython.com/python-microservices-grpc/](https://realpython.com/python-microservices-grpc/)  


[https://www.tigera.io/learn/guides/prometheus-monitoring/prometheus-metrics/](https://www.tigera.io/learn/guides/prometheus-monitoring/prometheus-metrics/)  
[https://sensu.io/blog/introduction-to-prometheus-monitoring](https://sensu.io/blog/introduction-to-prometheus-monitoring)  
[https://linuxhint.com/monitor-python-applications-prometheus/](https://linuxhint.com/monitor-python-applications-prometheus/)  
[https://blog.anvileight.com/posts/simple-python-http-server/](https://blog.anvileight.com/posts/simple-python-http-server/)  
[https://www.cloudbees.com/blog/monitoring-your-synchronous-python-web-applications-using-prometheus](https://www.cloudbees.com/blog/monitoring-your-synchronous-python-web-applications-using-prometheus)  
[https://geekyhumans.com/monitor-python-scripts-using-prometheus/](https://geekyhumans.com/monitor-python-scripts-using-prometheus/)  
[https://sysdig.com/blog/prometheus-metrics/](https://sysdig.com/blog/prometheus-metrics/)  
[https://coralogix.com/blog/promql-tutorial-5-tricks-to-become-a-prometheus-god/](https://coralogix.com/blog/promql-tutorial-5-tricks-to-become-a-prometheus-god/)  
[https://nakamasato.medium.com/how-prometheus-operator-facilitates-prometheus-configuration-updates-a55844186e04](https://nakamasato.medium.com/how-prometheus-operator-facilitates-prometheus-configuration-updates-a55844186e04)  
[https://blog.container-solutions.com/prometheus-operator-beginners-guide](https://blog.container-solutions.com/prometheus-operator-beginners-guide)  
[https://www.cncf.io/blog/2021/10/25/prometheus-definitive-guide-part-iii-prometheus-operator/](https://www.cncf.io/blog/2021/10/25/prometheus-definitive-guide-part-iii-prometheus-operator/)  
[https://medium.com/kubernetes-tutorials/monitoring-your-kubernetes-deployments-with-prometheus-5665eda54045](https://medium.com/kubernetes-tutorials/monitoring-your-kubernetes-deployments-with-prometheus-5665eda54045)  
[https://prometheus-operator.dev/docs/operator/api/#servicemonitor](https://prometheus-operator.dev/docs/operator/api/#servicemonitor)  
[https://medium.com/kubernetes-tutorials/simple-management-of-prometheus-monitoring-pipeline-with-the-prometheus-operator-b445da0e0d1a](https://medium.com/kubernetes-tutorials/simple-management-of-prometheus-monitoring-pipeline-with-the-prometheus-operator-b445da0e0d1a)  

[https://stackoverflow.com/questions/69641363/how-to-run-fastapi-app-on-multiple-ports](https://stackoverflow.com/questions/69641363/how-to-run-fastapi-app-on-multiple-ports)  
[https://www.uvicorn.org/deployment/](https://www.uvicorn.org/deployment/)  
[https://medium.com/cuddle-ai/concurrency-with-fastapi-1bd809916130](https://medium.com/cuddle-ai/concurrency-with-fastapi-1bd809916130)  
[https://stackoverflow.com/questions/69641363/how-to-run-fastapi-app-on-multiple-ports](https://stackoverflow.com/questions/69641363/how-to-run-fastapi-app-on-multiple-ports)  
[https://linuxhint.com/install-prometheus-on-ubuntu/](https://linuxhint.com/install-prometheus-on-ubuntu/)  
[https://trstringer.com/quick-and-easy-prometheus-exporter/](https://trstringer.com/quick-and-easy-prometheus-exporter/)  
[https://cloud.google.com/stackdriver/docs/solutions/slo-monitoring/sli-metrics/prometheus#monitoring_sli_metrics_prometheus_setup-python](https://cloud.google.com/stackdriver/docs/solutions/slo-monitoring/sli-metrics/prometheus#monitoring_sli_metrics_prometheus_setup-python)  
[https://github.com/GoogleCloudPlatform/python-docs-samples/blob/HEAD/monitoring/prometheus/main.py](https://github.com/GoogleCloudPlatform/python-docs-samples/blob/HEAD/monitoring/prometheus/main.py)  
[Python SimpleHTTPServer : Routing sample](https://gist.github.com/jdkanani/4503653)  
[https://medium.com/@andrewklatzke/creating-a-python3-webserver-from-the-ground-up-4ff8933ecb96](https://medium.com/@andrewklatzke/creating-a-python3-webserver-from-the-ground-up-4ff8933ecb96)  
[https://www.tutorialspoint.com/What-does-the-b-character-do-in-front-of-a-string-literal-in-Python](https://www.tutorialspoint.com/What-does-the-b-character-do-in-front-of-a-string-literal-in-Python)  
[https://www.geeksforgeeks.org/python-convert-string-to-bytes/](https://www.geeksforgeeks.org/python-convert-string-to-bytes/)  
[https://blog.devgenius.io/best-way-to-speed-up-a-bulk-of-http-requests-in-python-4ec75badabed](https://blog.devgenius.io/best-way-to-speed-up-a-bulk-of-http-requests-in-python-4ec75badabed)  
[https://leimao.github.io/blog/Python-Concurrency-High-Level/](https://leimao.github.io/blog/Python-Concurrency-High-Level/)  
[https://realpython.com/python-concurrency/](https://realpython.com/python-concurrency/)  
[http://masnun.rocks/2016/10/06/async-python-the-different-forms-of-concurrency/](http://masnun.rocks/2016/10/06/async-python-the-different-forms-of-concurrency/)  
[https://fastapi.tiangolo.com/async/](https://fastapi.tiangolo.com/async/)  
[https://livebook.manning.com/book/concurrency-in-python-with-asyncio/chapter-12/1](https://livebook.manning.com/book/concurrency-in-python-with-asyncio/chapter-12/1)  
[https://github.com/python/cpython/blob/3.10/Lib/asyncio/queues.py](https://github.com/python/cpython/blob/3.10/Lib/asyncio/queues.py)  
[https://stackoverflow.com/questions/28492103/how-to-combine-python-asyncio-with-threads](https://stackoverflow.com/questions/28492103/how-to-combine-python-asyncio-with-threads)  
[https://www.geeksforgeeks.org/multithreading-python-set-1/](https://www.geeksforgeeks.org/multithreading-python-set-1/)  
[https://www.geeksforgeeks.org/python-daemon-threads/](https://www.geeksforgeeks.org/python-daemon-threads/)  
[http://cse.iitkgp.ac.in/~dsamanta/java/ch6.htm](http://cse.iitkgp.ac.in/~dsamanta/java/ch6.htm)  
[https://docs.python.org/2/library/multiprocessing.html](https://docs.python.org/2/library/multiprocessing.html)  
[https://www.quora.com/How-many-Python-threads-can-I-run](https://www.quora.com/How-many-Python-threads-can-I-run)  
[Python threading Module Tutorials](https://youtube.com/playlist?list=PL1H1sBF1VAKVMONJWJkmUh6_p8g4F2oy1)  
[https://hackernoon.com/concurrent-programming-in-python-is-not-what-you-think-it-is-b6439c3f3e6a](https://hackernoon.com/concurrent-programming-in-python-is-not-what-you-think-it-is-b6439c3f3e6a)  
[https://realpython.com/python-concurrency/](https://realpython.com/python-concurrency/)  
[https://www.infoworld.com/article/3632284/python-concurrency-and-parallelism-explained.html](https://www.infoworld.com/article/3632284/python-concurrency-and-parallelism-explained.html)  
[https://code.tutsplus.com/articles/introduction-to-parallel-and-concurrent-programming-in-python--cms-28612](https://code.tutsplus.com/articles/introduction-to-parallel-and-concurrent-programming-in-python--cms-28612)  
[https://stackoverflow.com/questions/3044580/multiprocessing-vs-threading-python](https://stackoverflow.com/questions/3044580/multiprocessing-vs-threading-python)  
```
The threading module uses threads, the multiprocessing module uses processes. The difference is that threads run in the same memory space, while processes have separate memory. This makes it a bit harder to share objects between processes with multiprocessing. Since threads use the same memory, precautions have to be taken or two threads will write to the same memory at the same time. This is what the global interpreter lock is for.Spawning processes is a bit slower than spawning threads.
```  
[https://www.geeksforgeeks.org/sharing-queue-among-three-threads/](https://www.geeksforgeeks.org/sharing-queue-among-three-threads/)  
[https://www.geeksforgeeks.org/multithreading-c-2/](https://www.geeksforgeeks.org/multithreading-c-2/)  
[https://www.personal.kent.edu/%7Ermuhamma/OpSystems/Myos/threads.htm](https://www.personal.kent.edu/%7Ermuhamma/OpSystems/Myos/threads.htm)  
[https://en.wikipedia.org/wiki/Pthreads](https://en.wikipedia.org/wiki/Pthreads)  
[http://www.csc.villanova.edu/~mdamian/threads/posixthreads.html](http://www.csc.villanova.edu/~mdamian/threads/posixthreads.html)  
[https://www.geeksforgeeks.org/python-collections-module/](https://www.geeksforgeeks.org/python-collections-module/)  
[https://realpython.com/async-io-python/](https://realpython.com/async-io-python/)  
[https://stackoverflow.com/questions/50757497/simplest-async-await-example-possible-in-python](https://stackoverflow.com/questions/50757497/simplest-async-await-example-possible-in-python)  
[https://github.com/crazyguitar/pysheeet/blob/master/docs/appendix/python-concurrent.rst](https://github.com/crazyguitar/pysheeet/blob/master/docs/appendix/python-concurrent.rst)  
[https://medium.com/dev-bits/a-minimalistic-guide-for-understanding-asyncio-in-python-52c436c244ea](https://medium.com/dev-bits/a-minimalistic-guide-for-understanding-asyncio-in-python-52c436c244ea)  
[https://www.geeksforgeeks.org/implement-inter-thread-communication-with-event-method-in-python/](https://www.geeksforgeeks.org/implement-inter-thread-communication-with-event-method-in-python/)  








[https://www.geeksforgeeks.org/system-design-url-shortening-service/](https://www.geeksforgeeks.org/system-design-url-shortening-service/)  
[https://www.interviewbit.com/data-structure-interview-questions/](https://www.interviewbit.com/data-structure-interview-questions/)  

[https://www.containiq.com/post/promql-cheat-sheet-with-examples](https://www.containiq.com/post/promql-cheat-sheet-with-examples)  
[https://valyala.medium.com/promql-tutorial-for-beginners-9ab455142085](https://valyala.medium.com/promql-tutorial-for-beginners-9ab455142085)  
[https://stackoverflow.com/questions/51268405/curl-and-python-requests-get-reporting-different-http-status-code](https://stackoverflow.com/questions/51268405/curl-and-python-requests-get-reporting-different-http-status-code)  
[https://softwareengineering.stackexchange.com/questions/277343/what-belongs-in-an-http-request-header-vs-the-request-body](https://softwareengineering.stackexchange.com/questions/277343/what-belongs-in-an-http-request-header-vs-the-request-body)  
[https://www.baeldung.com/cs/hash-table-vs-trie-prefix-tree](https://www.baeldung.com/cs/hash-table-vs-trie-prefix-tree)  
[https://www.toptal.com/java/the-trie-a-neglected-data-structure](https://www.toptal.com/java/the-trie-a-neglected-data-structure)  
[https://www.geeksforgeeks.org/find-the-k-most-frequent-words-from-a-file/](https://www.geeksforgeeks.org/find-the-k-most-frequent-words-from-a-file/)  
[https://albertauyeung.github.io/2020/06/15/python-trie.html/](https://albertauyeung.github.io/2020/06/15/python-trie.html/)  
[https://stackoverflow.com/questions/114830/is-a-python-dictionary-an-example-of-a-hash-table](https://stackoverflow.com/questions/114830/is-a-python-dictionary-an-example-of-a-hash-table)  
[https://stackoverflow.com/questions/1856785/characters-allowed-in-a-url](https://stackoverflow.com/questions/1856785/characters-allowed-in-a-url)  
[https://www.geeksforgeeks.org/python-memory-consumption-dictionary-vs-list-of-tuples/](https://www.geeksforgeeks.org/python-memory-consumption-dictionary-vs-list-of-tuples/)  
[https://www.tutorialspoint.com/implement-trie-prefix-tree-in-python](https://www.tutorialspoint.com/implement-trie-prefix-tree-in-python)  
[https://stackoverflow.com/questions/11015320/how-to-create-a-trie-in-python](https://stackoverflow.com/questions/11015320/how-to-create-a-trie-in-python)  
[https://towardsdatascience.com/implementing-a-trie-data-structure-in-python-in-less-than-100-lines-of-code-a877ea23c1a1](https://towardsdatascience.com/implementing-a-trie-data-structure-in-python-in-less-than-100-lines-of-code-a877ea23c1a1)  
[https://www.techiedelight.com/trie-implementation-python/](https://www.techiedelight.com/trie-implementation-python/)  
[https://python.plainenglish.io/trie-data-structure-and-the-implementation-of-its-methods-with-type-annotations-in-python-1737ba25adc4](https://python.plainenglish.io/trie-data-structure-and-the-implementation-of-its-methods-with-type-annotations-in-python-1737ba25adc4)  
[https://www.freecodecamp.org/news/trie-data-structure-implementation/](https://www.freecodecamp.org/news/trie-data-structure-implementation/)  
[https://www.geeksforgeeks.org/python-collections-module/](https://www.geeksforgeeks.org/python-collections-module/)  





[https://blog.stackpath.com/microservice-video-streaming/](https://blog.stackpath.com/microservice-video-streaming/)  


[https://medium.com/cuddle-ai/concurrency-with-fastapi-1bd809916130](https://medium.com/cuddle-ai/concurrency-with-fastapi-1bd809916130)  

