


# Auth  



3 Microservices Authentication Approaches


Edge-Level Authorization

authorization only occurs at the edge, typically using an API Gateway. You can use an API Gateway to centralize authentication and authorization for all downstream microservices. The gateway enforces authentication and access control for each microservice. In this case, NIST recommends implementing mitigation controls such as mutual authentication between microservices to prevent direct anonymous connections to internal services.


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




Microservices Authentication Techniques

Single Sign-On (SSO)
Authentication of end-users
Authentication of microservices


JSON Web Tokens


OAuth API Authentication





# Links  

[https://medium.com/swlh/authentication-and-authorization-in-microservices-how-to-implement-it-5d01ed683d6f](https://medium.com/swlh/authentication-and-authorization-in-microservices-how-to-implement-it-5d01ed683d6f)  
[https://frontegg.com/blog/authentication-in-microservices](https://frontegg.com/blog/authentication-in-microservices)  
[https://medium.com/tech-tajawal/microservice-authentication-and-authorization-solutions-e0e5e74b248a](https://medium.com/tech-tajawal/microservice-authentication-and-authorization-solutions-e0e5e74b248a)  
[https://medium.com/@rahul.soni_3674/migrate-keycloak-h2-database-to-postgres-on-kubernetes-a7d6dd9d7659](https://medium.com/@rahul.soni_3674/migrate-keycloak-h2-database-to-postgres-on-kubernetes-a7d6dd9d7659)  
[https://siddhivinayak-sk.medium.com/openid-connect-authentication-and-oauth-2-0-authorization-in-web-application-e7e422eb5223](https://siddhivinayak-sk.medium.com/openid-connect-authentication-and-oauth-2-0-authorization-in-web-application-e7e422eb5223)  
[https://dev.to/behalf/authentication-authorization-in-microservices-architecture-part-i-2cn0](https://dev.to/behalf/authentication-authorization-in-microservices-architecture-part-i-2cn0)  
[https://medium.com/tech-tajawal/microservice-authentication-and-authorization-solutions-e0e5e74b248a](https://medium.com/tech-tajawal/microservice-authentication-and-authorization-solutions-e0e5e74b248a)  
[https://authress.io/knowledge-base/so-you-want-your-own-authorization](https://authress.io/knowledge-base/so-you-want-your-own-authorization)  
[https://medium.com/@robert.broeckelmann/openid-connect-authorization-code-flow-with-aws-cognito-246997abd11a](https://medium.com/@robert.broeckelmann/openid-connect-authorization-code-flow-with-aws-cognito-246997abd11a)  
[https://developers.onelogin.com/blog/aws-alb-openid-connect](https://developers.onelogin.com/blog/aws-alb-openid-connect)  
[https://docs.amazonaws.cn/en_us/elasticloadbalancing/latest/application/listener-authenticate-users.html](https://docs.amazonaws.cn/en_us/elasticloadbalancing/latest/application/listener-authenticate-users.html)  
[https://codeburst.io/aws-eks-authentication-with-openid-connect-by-example-70b1989e689b](https://codeburst.io/aws-eks-authentication-with-openid-connect-by-example-70b1989e689b)  

