

# istio  


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





## Links  

- [https://istio.io/](https://istio.io/)
