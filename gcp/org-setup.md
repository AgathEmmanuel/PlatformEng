## Google Cloud Setup  



Organization  


Users & groups  


Administrative access  


Billing  

Hierarchy & access  


Security  



Central logging & monitoring  


VPC networks  


## Hybrid connectivity  

```
What it is

Hybrid connectivity - Hybrid connectivity enables your organization to establish connections between your on-premise servers or another Cloud provider and Google Cloud resources and services. It builds on top of the Shared VPC network you configured as part of this guide. Learn more

Cloud Interconnect - Cloud Interconnect provides low-latency, high-availability connections that enable you to reliably transfer data between your Google Cloud Virtual Private Cloud (VPC) networks and your other networks. A Google best practice is to begin setting up Cloud Interconnect for hybrid connectivity as this can take several weeks to set up.

High-availability VPN - High-availability VPN (HA VPN) is the type of VPN that you'll be using to securely connect your on-premises, third-party VPN, or other Cloud provider services to your VPC network. HA VPN uses an IPsec VPN connection in a single region for encryption and also provides an SLA of 99.99% service availability. Learn more
```


```

Advantages of HA-VPN

Hybrid connectivity with HA VPN has many benefits and reasons for use, such as:

    Ability to securely communicate between on-premises and Google Cloud securely over private networking. Additional security best practices are available. Learn more 

Providing an SLA of 99.99% service availability
Supports up to 250,000 packets per second, per VPN tunnel, for the sum of ingress and egress traffic (equivalent to 1 Gbps to 3 Gbps of bandwidth). You'll create 2 VPN tunnels in this setup. Learn more

    Enabling you to migrate applications to the cloud securely at your own pace
    Allowing you to comply with any data residency laws
    Expand VPN tunnels based on capacity requirements 

Additional details

    HA VPN connectivity involves data transfer between on-premises infrastructure and the cloud over the internet, which can introduce additional network latency compared to purely on-premises or purely cloud setups. This latency may impact application performance and user experience, particularly for latency-sensitive workloads.
    The performance of hybrid connectivity depends on the available network bandwidth between on-premises networks and Google Cloud. If the bandwidth is limited or inconsistent, it may impact the speed and efficiency of data transfer and communication between the environments.
    HA VPN relies on an internet connection to establish the secure tunnel between on-premises networks and Google Cloud. If there are interruptions or performance issues with the internet connection, it can impact the availability and reliability of the hybrid connectivity. 



https://cloud.google.com/learn/what-is-hybrid-cloud
https://cloud.google.com/network-connectivity/docs/how-to/choose-product


```


```
Costs

For hybrid connectivity with HA VPN, Google Cloud charges by the hour for each tunnel attached to the gateway. There is no charge for an external IP address unless it’s not being used by a VPN tunnel.

Once there’s traffic through those tunnels, there is no charge for data transfer to the same Google Cloud zone when using the internal IPv4 addresses or any IPv6 addresses. Google does charge per GiB for data transfer to a different Cloud zone in the same Google Cloud region when using an internal or external IP address.


https://cloud.google.com/network-connectivity/docs/vpn/pricing

https://cloud.google.com/network-connectivity/docs/vpn/concepts/best-practices

https://cloud.google.com/network-connectivity/docs/interconnect/concepts/overview

```


```


Additional considerations
Cloud Interconnect

A Google best practice is to begin setting up Cloud Interconnect for hybrid connectivity either through dedicated interconnect, partner interconnect, or cross-cloud interconnect. This can take up to several weeks. Once Cloud Interconnect is set up, it’s best practice to keep HA VPN connectivity in place and switch your primary connection to Cloud Interconnect.

    Dedicated Interconnect provides a direct physical connection between your on-premises network and the Google network.
    Partner Interconnect provides connectivity between your on-premises and VPC networks through a supported service provider.
    Cross-Cloud Interconnect provides a direct physical connection between your network in another cloud and the Google network. 

Learn more about Cloud Interconnect
Other architectures

To explore alternative architectures, visit the Cloud Architecture Center
for reference diagrams, articles, and documentation.


https://cloud.google.com/network-connectivity/docs/interconnect/concepts/overview

https://cloud.google.com/architecture/networking


```








Deploy or download  



Support  
