# GCP Commands  

```
gcloud init

gcloud config list 


gcloud config configurations describe [NAME]


gcloud config configurations delete [NAME]


gcloud config get-value project


gcloud projects list --sort-by=projectId --limit=5

# To list projects that have been marked for deletion: 
gcloud projects list --filter='lifecycleState:DELETE_REQUESTED'






# List Enabled APIs for a project:

gcloud services list --enabled



# To specify a project explicitly:

gcloud services list --enabled --project=PROJECT_ID




# Search for a Specific API (like Compute Engine):

gcloud services list --available --filter="name:compute"


# Enable an API

gcloud services enable compute.googleapis.com

# And to disable:

gcloud services disable compute.googleapis.com







# Use gcloud projects describe to get the project number:

gcloud projects describe project-name --format="value(projectNumber)"


gcloud projects get-iam-policy project-name \
  --format="table(bindings.members)" \
  --flatten="bindings[].members" \
  | grep compute


# Manually grant roles to make it visible:
# You can assign a role like Viewer just to surface it in the UI:

gcloud projects add-iam-policy-binding project-name \
  --member="serviceAccount:13413241341-compute@developer.gserviceaccount.com" \
  --role="roles/viewer"

# After this, it will show up in service account listings.












gcloud projects add-iam-policy-binding YOUR_PROJECT_ID \
  --member="user:YOUR_EMAIL" \
  --role="roles/iam.viewer"


gcloud iam service-accounts list --project=YOUR_PROJECT_ID


# List All Roles Assigned to the Service Account

gcloud projects get-iam-policy YOUR_PROJECT_ID \
  --flatten="bindings[].members" \
  --format='table(bindings.role)' \
  --filter="bindings.members:serviceAccount:SERVICE_ACCOUNT_EMAIL"


# Get Permissions for Each Role

gcloud iam roles describe roles/storage.admin



# Allow Your User Account to Impersonate the SA

gcloud iam service-accounts add-iam-policy-binding terraform@YOUR_PROJECT_ID.iam.gserviceaccount.com \
  --member="user:YOUR_USER_EMAIL" \
  --role="roles/iam.serviceAccountTokenCreator"



gcloud storage buckets list --impersonate-service-account=SERVICE_ACCT_EMAIL


# Use impersonation with the gcloud CLI by default
# To set up the gcloud CLI to use the identity and access provided by a service account by default, you use the gcloud CLI config command:

gcloud config set auth/impersonate_service_account SERVICE_ACCT_EMAIL









# To check whether the secure-by-default organization policies are enforced on your organization, use the following command

gcloud resource-manager org-policies list --organization=ORGANIZATION_ID



# To disable or delete an organization policy, run the following command:

gcloud org-policies delete CONSTRAINT_NAME --organization=ORGANIZATION_ID


# To add or update these values listed in the YAML file, run the following command:

gcloud org-policies set-policy POLICY_FILE



# Set up authentication:
#    Create the service account:

gcloud iam service-accounts create SERVICE_ACCOUNT_NAME


# To provide access to your project and your resources, grant a role to the service account:

gcloud projects add-iam-policy-binding PROJECT_ID --member="serviceAccount:SERVICE_ACCOUNT_NAME@PROJECT_ID.iam.gserviceaccount.com" --role=ROLE


# Note: The --role flag affects which resources the service account can access in your project. You can revoke these roles or grant additional roles later. In production environments, do not grant the Owner, Editor, or Viewer roles. Instead, grant a predefined role or custom role that meets your needs.

# To grant another role to the service account, run the command as you did in the previous step.
# Grant the required role to the principal that will attach the service account to other resources.


gcloud iam service-accounts add-iam-policy-binding SERVICE_ACCOUNT_NAME@PROJECT_ID.iam.gserviceaccount.com --member="user:USER_EMAIL" --role=roles/iam.serviceAccountUser




```


##  Network Engineer Learning Path  


### Multiple VPC Networks  

```

gcloud config list project



# Create custom mode VPC networks with firewall rules  


# Create the managementnet network

gcloud compute networks create managementnet --project=qwiklabs-gcp-04-6adfc2f184b9 --subnet-mode=custom --mtu=1460 --bgp-routing-mode=regional --bgp-best-path-selection-mode=legacy


gcloud compute networks subnets create managementsubnet-1 --project=qwiklabs-gcp-04-6adfc2f184b9 --range=10.130.0.0/20 --stack-type=IPV4_ONLY --network=managementnet --region=us-central1



# Create the privatenet network
# Create the privatenet network using the Cloud Shell command line.
# Run the following command to create the privatenet network:


gcloud compute networks create privatenet --subnet-mode=custom



# Run the following command to create the privatesubnet-1 subnet:

gcloud compute networks subnets create privatesubnet-1 --network=privatenet --region=us-central1 --range=172.16.0.0/24


# Run the following command to create the privatesubnet-2 subnet:

gcloud compute networks subnets create privatesubnet-2 --network=privatenet --region=europe-west4 --range=172.20.0.0/20



gcloud compute networks list


# Note: default and mynetwork are auto mode networks, whereas, managementnet and privatenet are custom mode networks. Auto mode networks create subnets in each region automatically, while custom mode networks start with no subnets, giving you full control over subnet creation 


gcloud compute networks subnets list --sort-by=NETWORK


# Note: As expected, the default and mynetwork networks have subnets in each region (zones/regions may changes as per lab's requirements) as they are auto mode networks. The managementnet and privatenet networks only have the subnets that you created as they are custom mode networks . 



# Create the firewall rules for managementnet



# Note: Make sure to include the /0 in the Source IPv4 ranges to specify all networks. 


gcloud compute --project=qwiklabs-gcp-04-6adfc2f184b9 firewall-rules create managementnet-allow-icmp-ssh-rdp --direction=INGRESS --priority=1000 --network=managementnet --action=ALLOW --rules=tcp:22,tcp:3389 --source-ranges=0.0.0.0/0


# Create the firewall rules for privatenet

gcloud compute firewall-rules create privatenet-allow-icmp-ssh-rdp --direction=INGRESS --priority=1000 --network=privatenet --action=ALLOW --rules=icmp,tcp:22,tcp:3389 --source-ranges=0.0.0.0/0



gcloud compute firewall-rules list --sort-by=NETWORK





# Create VM instances

gcloud compute instances create managementnet-vm-1 \
    --project=qwiklabs-gcp-04-6adfc2f184b9 \
    --zone=us-central1-c \
    --machine-type=e2-micro \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=managementsubnet-1 \
    --metadata=enable-osconfig=TRUE,enable-oslogin=true \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --service-account=1021974644236-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/trace.append \
    --create-disk=auto-delete=yes,boot=yes,device-name=managementnet-vm-1,image=projects/debian-cloud/global/images/debian-12-bookworm-v20250311,mode=rw,size=10,type=pd-balanced \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ops-agent-policy=v2-x86-template-1-4-0,goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any \
&& \
printf 'agentsRule:\n  packageState: installed\n  version: latest\ninstanceFilter:\n  inclusionLabels:\n  - labels:\n      goog-ops-agent-policy: v2-x86-template-1-4-0\n' > config.yaml \
&& \
gcloud compute instances ops-agents policies create goog-ops-agent-v2-x86-template-1-4-0-us-central1-c \
    --project=qwiklabs-gcp-04-6adfc2f184b9 \
    --zone=us-central1-c \
    --file=config.yaml \
&& \
gcloud compute resource-policies create snapshot-schedule default-schedule-1 \
    --project=qwiklabs-gcp-04-6adfc2f184b9 \
    --region=us-central1 \
    --max-retention-days=14 \
    --on-source-disk-delete=keep-auto-snapshots \
    --daily-schedule \
    --start-time=17:00 \
&& \
gcloud compute disks add-resource-policies managementnet-vm-1 \
    --project=qwiklabs-gcp-04-6adfc2f184b9 \
    --zone=us-central1-c \
    --resource-policies=projects/qwiklabs-gcp-04-6adfc2f184b9/regions/us-central1/resourcePolicies/default-schedule-1



### equivalent terraform

# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

resource "google_compute_instance" "managementnet-vm-1" {
  boot_disk {
    auto_delete = true
    device_name = "managementnet-vm-1"

    initialize_params {
      image = "projects/debian-cloud/global/images/debian-12-bookworm-v20250311"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src           = "vm_add-tf"
    goog-ops-agent-policy = "v2-x86-template-1-4-0"
  }

  machine_type = "e2-micro"

  metadata = {
    enable-osconfig = "TRUE"
    enable-oslogin  = "true"
  }

  name = "managementnet-vm-1"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/qwiklabs-gcp-04-6adfc2f184b9/regions/us-central1/subnetworks/managementsubnet-1"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "1021974644236-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  zone = "us-central1-c"
}

module "ops_agent_policy" {
  source          = "github.com/terraform-google-modules/terraform-google-cloud-operations/modules/ops-agent-policy"
  project         = "qwiklabs-gcp-04-6adfc2f184b9"
  zone            = "us-central1-c"
  assignment_id   = "goog-ops-agent-v2-x86-template-1-4-0-us-central1-c"
  agents_rule = {
    package_state = "installed"
    version = "latest"
  }
  instance_filter = {
    all = false
    inclusion_labels = [{
      labels = {
        goog-ops-agent-policy = "v2-x86-template-1-4-0"
      }
    }]
  }
}






# Create the privatenet-vm-1 instance


gcloud compute instances create privatenet-vm-1 --zone=us-central1-c --machine-type=e2-micro --subnet=privatesubnet-1


gcloud compute instances list --sort-by=ZONE




# Explore the connectivity between VM instances  

ping -c 3 'Enter mynet-vm-2 external IP here'

ping -c 3 'Enter managementnet-vm-1 external IP here'

ping -c 3 'Enter privatenet-vm-1 external IP here'

# Note: You are able to ping the external IP address of all VM instances, even though they are either in a different zone or VPC network. This confirms public access to those instances is only controlled by the ICMP firewall rules that you established earlier. 


ping -c 3 'Enter mynet-vm-2 internal IP here'


# Note: You are able to ping the internal IP address of mynet-vm-2 because it is on the same VPC network as the source of the ping (mynet-vm-1), even though both VM instances are in separate zones, regions and continents! 


ping -c 3 'Enter managementnet-vm-1 internal IP here'

ping -c 3 'Enter privatenet-vm-1 internal IP here'


# Note: This should not work either as indicated by a 100% packet loss! You are unable to ping the internal IP address of managementnet-vm-1 and privatenet-vm-1 because they are in separate VPC networks from the source of the ping (mynet-vm-1), even though they are all in the same region Region_1 


# VPC networks are by default isolated private networking domains. However, no internal IP address communication is allowed between networks, unless you set up mechanisms such as VPC peering or VPN.



# Create a VM instance with multiple network interfaces


# Every instance in a VPC network has a default network interface. You can create additional network interfaces attached to your VMs. Multiple network interfaces enable you to create configurations in which an instance connects directly to several VPC networks (up to 8 interfaces, depending on the instance's type).


# Note: The number of interfaces allowed in an instance is dependent on the instance's machine type and the number of vCPUs. The e2-standard-4 allows up to 4 network interfaces. Refer to the Maximum number of network interfaces section of the Google Cloud Guide for more information. 
# https://cloud.google.com/vpc/docs/create-use-multiple-interfaces#max-interfaces



# Explore the network interface details

# Explore the network interface details of vm-appliance within the Cloud console and within the VM's terminal.

    In the Cloud console, navigate to Navigation menu (Navigation menu icon) > Compute Engine > VM instances.
    Click nic0 within the Internal IP address of vm-appliance to open the Network interface details page.
    Verify that nic0 is attached to privatesubnet-1, is assigned an internal IP address within that subnet (172.16.0.0/24), and has applicable firewall rules.
    Click nic0 and select nic1.
    Verify that nic1 is attached to managementsubnet-1, is assigned an internal IP address within that subnet (10.130.0.0/20), and has applicable firewall rules.
    Click nic1 and select nic2.
    Verify that nic2 is attached to mynetwork, is assigned an internal IP address within that subnet (10.128.0.0/20), and has applicable firewall rules.

# Note: Each network interface has its own internal IP address so that the VM instance can communicate with those networks. 


# Note: The sudo ifconfig command lists a Linux VM's network interfaces along with the internal IP addresses for each interface. 

sudo ifconfig


# Explore the network interface connectivity

ping -c 3 'Enter privatenet-vm-1's internal IP here'

ping -c 3 privatenet-vm-1

# Note: You are able to ping privatenet-vm-1 by its name because VPC networks have an internal DNS service that allows you to address instances by their DNS names rather than their internal IP addresses. When an internal DNS query is made with the instance hostname, it resolves to the primary interface (nic0) of the instance. Therefore, this only works for privatenet-vm-1 in this case. 


ping -c 3 'Enter managementnet-vm-1's internal IP here'

ping -c 3 'Enter mynet-vm-1's internal IP here'

ping -c 3 'Enter mynet-vm-2's internal IP here'

# Note: This does not work! In a multiple interface instance, every interface gets a route for the subnet that it is in. In addition, the instance gets a single default route that is associated with the primary interface eth0. Unless manually configured otherwise, any traffic leaving an instance for any destination other than a directly connected subnet will leave the instance via the default route on eth0. 

ip route


# Note: The primary interface eth0 gets the default route (default via 172.16.0.1 dev eth0), and all three interfaces eth0, eth1 and eth2 get routes for their respective subnets. Since, the subnet of mynet-vm-2 (10.132.0.0/20) is not included in this routing table, the ping to that instance leaves vm-appliance on eth0 (which is on a different VPC network). You could change this behavior by configuring policy routing as documented in the Configuring policy routing section of the Google Cloud Guide. 
# https://cloud.google.com/vpc/docs/create-use-multiple-interfaces#configuring_policy_routing



```


### VPC Networks - Controlling Access 

```

# you create two nginx web servers on the default VPC network and control external HTTP access to the web servers using tagged firewall rules. Then, you explore IAM roles and service accounts.

    Two web servers gives you redundancy - if one web server fails, the other can continue serving web traffic, preventing downtime.
    Tagged firewall rules provide granular control over which traffic is allowed to reach specific web servers.
    By assigning a service account permission to perform tasks, you're upholding the principal of least priviledge, keeping your Cloud resources safe.


# Objectives

    Create a nginx web server on a vpc network
    Create tagged firewall rules
    Create a service account with IAM roles
    Explore permissions for the Network Admin and Security Admin roles


# Create the blue server

# Note: Networks use network tags to identify which VM instances are subject to certain firewall rules and network routes. Later in this lab, you create a firewall rule to allow HTTP access for VM instances with the web-server tag. Alternatively, you could check the Allow HTTP traffic checkbox, which would tag this instance as http-server and create the tagged firewall rule for tcp:80 for you. 


# Create the green server

# Install nginx and customize the welcome page

sudo apt-get install nginx-light -y
sudo nano /var/www/html/index.nginx-debian.html

# Replace the <h1>Welcome to nginx!</h1> line with <h1>Welcome to the blue server!</h1>.

cat /var/www/html/index.nginx-debian.html

exit




# Create the firewall rule


# Note: The default-allow-internal firewall rule allows traffic on all protocols/ports within the default network. You want to create a firewall rule to allow traffic from outside this network to only the blue server, by using the network tag web-server. 

# Set the following values, leave all other values at their defaults.
Property 	Value (type value or select option as specified)
Name 	allow-http-web-server
Network 	default
Targets 	Specified target tags
Target tags 	web-server
Source filter 	IPv4 Ranges
Source IPv4 ranges 	0.0.0.0/0
Protocols and ports 	Specified protocols and ports, and then check tcp, type: 80; and check Other protocols, type: icmp.


# Note: Make sure to include the /0 in the Source IP ranges to specify all networks. 



# Create a test-vm

gcloud compute instances create test-vm --machine-type=e2-micro --subnet=default --zone=ZONE

# Test HTTP connectivity

# From the test-vm, curl the internal and external IP addresses of blue and green.

curl <Enter blue's internal IP here>

curl -c 3 <Enter green's internal IP here>

# Note: You are able to HTTP access both servers using their internal IP addresses. The connection on tcp:80 is allowed by the default-allow-internal firewall rule, as test-vm is on the same VPC network as the web server's default network. 


curl <Enter blue's external IP here>

curl -c 3 <Enter green's external IP here>

# Note: As expected, you are only able to HTTP access the external IP address of the blue server as the allow-http-web-server only applies to VM instances with the web-server tag. 




# Explore the Network and Security Admin roles

# Cloud IAM lets you authorize who can take action on specific resources, giving you full control and visibility to manage cloud resources centrally. The following roles are used in conjunction with single-project networking to independently control administrative access to each VPC Network:

    Network Admin: Permissions to create, modify, and delete networking resources, except for firewall rules and SSL certificates.
    Security Admin: Permissions to create, modify, and delete firewall rules and SSL certificates.

Explore these roles by applying them to a service account, which is a special Google account that belongs to your VM instance, instead of to an individual end user. Rather than creating a new user, you will authorize test-vm to use the service account to demonstrate the permissions of the Network Admin and Security Admin roles.




# Note: The Compute Engine default service account does not have the right permissions to allow you to list or delete firewall rules. The same applies to other users who do not have the right roles. 

# Verify current permissions, SSH terminal of the test-vm instance.

gcloud compute firewall-rules list


# Create a service account and get credentials.json



gcloud auth activate-service-account --key-file credentials.json



```



### Application Load Balancer with Cloud Armor  


```

# Google Cloud Application Load Balancing is implemented at the edge of Google's network in Google's points of presence (POP) around the world. User traffic directed to an Application Load Balancer enters the POP closest to the user and is then load balanced over Google's global network to the closest backend that has sufficient capacity available.

Cloud Armor IP allowlist/denylist enable you to restrict or allow access to your Application Load Balancer at the edge of the Google Cloud, as close as possible to the user and to malicious traffic. This prevents malicious users or traffic from consuming resources or entering your Virtual Private Cloud (VPC) networks.

In this lab, you configure an Application Load Balancer with global backends, as shown in the diagram below. Then, you stress test the Load Balancer and denylist the stress test IP with Cloud Armor.



# Objectives

    Create HTTP and health check firewall rules
    Configure two instance templates
    Create two managed instance groups
    Configure an Application Load Balancer with IPv4 and IPv6
    Stress test an Application Load Balancer
    Denylist an IP address to restrict access to an Application Load Balancer



# Configure HTTP and health check firewall rules


# Configure instance templates and create instance groups


# Create the managed instance groups


# Verify the backends


# Configure the Application Load Balancer


# Test the Application Load Balancer


# Denylist the siege-vm


# Note: There are ways to identify the external IP address of a client trying to access your Application Load Balancer. For example, you could examine traffic captured by VPC Flow Logs in BigQuery to determine a high volume of incoming requests






```

# Create an Internal Load Balancer 

```

# Google Cloud offers Internal Load Balancing for your TCP/UDP-based traffic. Internal Load Balancing enables you to run and scale your services behind a private load balancing IP address that is accessible only to your internal virtual machine instances.

In this lab you create two managed instance groups in the same region. Then, you configure and test an Internal Load Balancer with the instances groups as the backends, as shown in this network diagram:




# Objectives


    Create HTTP and health check firewall rules
    Configure two instance templates
    Create two managed instance groups
    Configure and test an internal load balancer





# Task 1. Configure HTTP and health check firewall rules




# Task 2. Configure instance templates and create instance groups


# Configure the next instance template


# Create the managed instance groups


# Note: Managed instance groups offer autoscaling capabilities that allow you to automatically add or remove instances from a managed instance group based on increases or decreases in load. Autoscaling helps your applications gracefully handle increases in traffic and reduces cost when the need for resources is lower. You just define the autoscaling policy and the autoscaler performs automatic scaling based on the measured load.




# Task 3. Configure the Internal Load Balancer


# Configure the regional backend service


# Note: Health checks determine which instances can receive new connections. This HTTP health check polls instances every 5 seconds, waits up to 5 seconds for a response and treats 2 successful or 2 failed attempts as healthy or unhealthy, respectively.




```




### Build a Secure Google Cloud Network


```


# Challenge scenario

You are a security consultant brought in by Jeff, who owns a small local company, to help him with his very successful website (juice-shop). Jeff is new to Google Cloud and had his neighbour's son set up the initial site. The neighbour's son has since had to leave for college, but before leaving, he made sure the site was running.

Below is the current set up:


# Your challenge

You need to create the appropriate security configuration for Jeff's site. Your first challenge is to set up firewall rules and virtual machine tags. You also need to ensure that SSH is only available to the bastion via IAP.

For the firewall rules, make sure that:

    The bastion host does not have a public IP address.
    You can only SSH to the bastion and only via IAP.
    You can only SSH to juice-shop via the bastion.
    Only HTTP is open to the world for juice-shop.

Tips and tricks:

    Pay close attention to the network tags and the associated VPC firewall rules.
    Be specific and limit the size of the VPC firewall rule source ranges.
    Overly permissive permissions will not be marked correct.



```


### Cloud DNS - Traffic Steering using Geolocation Policy  

```

# Cloud DNS routing policies enable users to configure DNS based traffic steering. A user can either create a Weighted Round Robin (WRR) routing policy or a Geolocation (GEO) routing policy. You can configure routing policies by creating special ResourceRecordSets with special routing policy values.

Use WRR to specify different weights per ResourceRecordSet for the resolution of domain names. Cloud DNS routing policies help ensure that traffic is distributed across multiple IP addresses by resolving DNS requests according to the configured weights.

​​In this lab, you will configure and test the Geolocation routing policy. Use GEO to specify source geolocations and to provide DNS answers corresponding to those geographies. The geolocation routing policy applies the nearest match for the source location when the traffic source location doesn't match any policy items exactly.





```



### Implement Private Google Access and Cloud NAT   


```

# In this lab, you implement Private Google Access and Cloud NAT for a VM instance that doesn't have an external IP address. Then, you verify access to public IP addresses of Google APIs and services and other connections to the internet.

VM instances without external IP addresses are isolated from external networks. Using Cloud NAT, these instances can access the internet for updates and patches, and in some cases, for bootstrapping. As a managed service, Cloud NAT provides high availability without user management and intervention.


# Objectives


    Configure a VM instance that doesn't have an external IP address
    Connect to a VM instance using an Identity-Aware Proxy (IAP) tunnel
    Enable Private Google Access on a subnet
    Configure a Cloud NAT gateway
    Verify access to public IP addresses of Google APIs and services and other connections to the internet


# Note: In order to connect to your private instance using SSH, you need to open an appropriate port on the firewall. IAP connections come from a specific set of IP addresses (35.235.240.0/20). Therefore, you can limit the rule to this CIDR range.
# https://cloud.google.com/iap/docs/using-tcp-forwarding



# Note: The default setting for a VM instance is to have an ephemeral external IP address. This behavior can be changed with a policy constraint at the organization or project level. To learn more about controlling external IP addresses on VM instances, refer to the external IP address documentation.
# https://cloud.google.com/compute/docs/ip-addresses/reserve-static-external-ip-address#disableexternalip  


gcloud compute ssh vm-internal --zone ZONE --tunnel-through-iap


ping -c 2 www.google.com


# Note: When instances do not have external IP addresses, they can only be reached by other instances on the network via a managed VPN gateway or via a Cloud IAP tunnel. Cloud IAP enables context-aware access to VMs via SSH and RDP without bastion hosts. To learn more about this, see the blog post Cloud IAP enables context-aware access to VMs via SSH and RDP without bastion hosts.
# https://cloud.google.com/blog/products/identity-security/cloud-iap-enables-context-aware-access-to-vms-via-ssh-and-rdp-without-bastion-hosts




# Enable Private Google Access

Private Google Access is enabled at the subnet level. When it is enabled, instances in the subnet that only have private IP addresses can send traffic to Google APIs and services through the default route (0.0.0.0/0) with a next hop to the default internet gateway.




# Configure a Cloud NAT gateway

Although vm-internal can now access certain Google APIs and services without an external IP address, the instance cannot access the internet for updates and patches. Configure a Cloud NAT gateway, which allows vm-internal to reach the internet.


Cloud NAT is a regional resource. You can configure it to allow traffic from all ranges of all subnets in a region, from specific subnets in the region only, or from specific primary and secondary CIDR ranges only.





# Note: The NAT mapping section allows you to choose the subnets to map to the NAT gateway. You can also manually assign static IP addresses that should be used when performing NAT. Do not change the NAT mapping configuration in this lab.


# Note: The Cloud NAT gateway implements outbound NAT, but not inbound NAT. In other words, hosts outside of your VPC network can only respond to connections initiated by your instances; they cannot initiate their own, new connections to your instances via NAT.



# Configure and view logs with Cloud NAT Logging

Cloud NAT logging allows you to log NAT connections and errors. When Cloud NAT logging is enabled, one log entry can be generated for each of the following scenarios:

    When a network connection using NAT is created.
    When a packet is dropped because no port was available for NAT.

You can opt to log both kinds of events, or just one or the other. Created logs are sent to Cloud Logging.




```



## Networking in Google Cloud: Network Architecture  




### Implementing a Hub and Spoke Topology using NCC  


```

# In this lab, you design and implement a classic hub-and-spoke network topology. Your pre-configured environment includes three VPC networks—a central hub and two branches (spoke1 and spoke2). You will create virtual machines (VMs) on each network to test connectivity.

You begin by verifying connectivity between the VMs within and across VPCs. Then, you use NCC to implement a hub and spoke. You retest connectivity to confirm that your hub-and-spoke architecture is fully functional.


# Objectives


    Configure VMs in different VPCs.
    Test connectivity between networks before implementing a hub and spoke.
    Use NCC to create a hub and spoke.
    Test connectivity after implementing a hub and spoke.
    Use Network Topology to view metrics for traffic between entities.




# Create a hub and spoke using NCC

ping -c 3 <internal IP address of spoke2-vm>



Task 6. Explore the Network Topology Tool



# Network Topology is a visualization tool that shows the topology of your network infrastructure. You can also view metrics and details of network traffic to other Shared VPC networks and inter-region traffic.

For each Network Topology hierarchy, the Google Cloud console displays a single metric for Compute Engine virtual machine (VM) instance entities and region entities, as well as for connections.

    On the Google Cloud console title bar, type Network Topology in the Search field, then click Network Topology in the Products & Page section.
    Hover over an entity to display the Expand icon for expanding or Collapse icon for collapsing.
    In the Metrics and insights section, select an insight from the options.





# https://storage.googleapis.com/cloud-training/gcpnet/v3.0/student/06_Introduction%20to%20Network%20Architecture_ILT.pdf



# https://storage.googleapis.com/cloud-training/gcpnet/v3.0/student/07%20Network%20Topologies_ILT.pdf





```



## Build Infrastructure with Terraform on Google Cloud  


### Terraform Fundamentals   


```


# Objectives


    Get started with Terraform in Google Cloud
    Install Terraform from installation binaries
    Create a VM instance infrastructure using Terraform



# What is Terraform?

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing, popular service providers and custom in-house solutions.

Configuration files describe to Terraform the components needed to run a single application or your entire data center. Terraform generates an execution plan describing what it will do to reach the desired state, and then executes it to build the described infrastructure. As the configuration changes, Terraform can determine what changed and create incremental execution plans that can be applied.

The infrastructure Terraform can manage includes both low-level components such as compute instances, storage, and networking, and high-level components such as DNS entries and SaaS features.



cat > instance.tf
resource "google_compute_instance" "terraform" {
  project      = ""
  name         = "terraform"
  machine_type = "e2-medium"
  zone         = ""

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}




terraform init

terraform plan

terraform apply

terraform show




# Defining a provisioner

    To define a provisioner, modify the resource block defining the first vm_instance in your configuration to look like the following:



resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"
  tags         = ["web", "dev"]

  provisioner "local-exec" {
    command = "echo ${google_compute_instance.vm_instance.name}:  ${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
  }

  # ...
}



# This adds a provisioner block within the resource block. Multiple provisioner blocks can be added to define multiple provisioning steps. Terraform supports many provisioners, but for this example you are using the local-exec provisioner.

The local-exec provisioner executes a command locally on the machine running Terraform, not the VM instance itself. You're using this provisioner versus the others so we don't have to worry about specifying any connection info right now.

This also shows a more complex example of string interpolation than you've seen before. Each VM instance can have multiple network interfaces, so refer to the first one with network_interface[0], count starting from 0, as most programming languages do. Each network interface can have multiple access_config blocks as well, so once again you specify the first one.  



# A tainted resource will be destroyed and recreated during the next apply.

terraform taint google_compute_instance.vm_instance




# Failed provisioners and tainted resources

If a resource is successfully created but fails a provisioning step, Terraform will error and mark the resource as tainted. A resource that is tainted still exists, but shouldn't be considered safe to use, since provisioning failed.

When you generate your next execution plan, Terraform will remove any tainted resources and create new resources, attempting to provision them again after creation.



# Destroy provisioners

Provisioners can also be defined that run only during a destroy operation. These are useful for performing system cleanup, extracting data, etc.

For many resources, using built-in cleanup mechanisms is recommended if possible (such as init scripts), but provisioners can be used if necessary.

This lab won't show any destroyed provisioner examples. If you need to use destroy provisioners, please see the Provisioners documentation.


# https://www.terraform.io/docs/provisioners/






```



### Interact with Terraform Modules 


```
# Overview

As you manage your infrastructure with Terraform, increasingly complex configurations will be created. There is no intrinsic limit to the complexity of a single Terraform configuration file or directory, so it is possible to continue writing and updating your configuration files in a single directory. However, if you do, you may encounter one or more of the following problems:

    Understanding and navigating the configuration files will become increasingly difficult.
    Updating the configuration will become more risky, because an update to one block may cause unintended consequences to other blocks of your configuration.
    Duplication of similar blocks of configuration may increase, for example, when you configure separate dev/staging/production environments, which will cause an increasing burden when updating those parts of your configuration.
    If you want to share parts of your configuration between projects and teams, cutting and pasting blocks of configuration between projects could be error-prone and hard to maintain.


What are modules for?

Here are some of the ways that modules help solve the problems listed above:

    Organize configuration: Modules make it easier to navigate, understand, and update your configuration by keeping related parts of your configuration together. Even moderately complex infrastructure can require hundreds or thousands of lines of configuration to implement. By using modules, you can organize your configuration into logical components.

    Encapsulate configuration: Another benefit of using modules is to encapsulate configuration into distinct logical components. Encapsulation can help prevent unintended consequences—such as a change to one part of your configuration accidentally causing changes to other infrastructure—and reduce the chances of simple errors like using the same name for two different resources.

    Re-use configuration: Writing all of your configuration without using existing code can be time-consuming and error-prone. Using modules can save time and reduce costly errors by re-using configuration written either by yourself, other members of your team, or other Terraform practitioners who have published modules for you to use. You can also share modules that you have written with your team or the general public, giving them the benefit of your hard work.

    Provide consistency and ensure best practices: Modules also help to provide consistency in your configurations. Consistency makes complex configurations easier to understand, and it also helps to ensure that best practices are applied across all of your configuration. For example, cloud providers offer many options for configuring object storage services, such as Amazon S3 (Simple Storage Service) or Google's Cloud Storage buckets. Many high-profile security incidents have involved incorrectly secured object storage, and because of the number of complex configuration options involved, it's easy to accidentally misconfigure these services.

Using modules can help reduce these errors. For example, you might create a module to describe how all of your organization's public website buckets will be configured, and another module for private buckets used for logging applications. Also, if a configuration for a type of resource needs to be updated, using modules allows you to make that update in a single place and have it be applied to all cases where you use that module.


# Objectives

    Use a module from the Registry
    Build a module


# What is a Terraform module?

A Terraform module is a set of Terraform configuration files in a single directory. Even a simple configuration consisting of a single directory with one or more .tf files is a module. When you run Terraform commands directly from such a directory, it is considered the root module. So in this sense, every Terraform configuration is part of a module. You may have a simple set of Terraform configuration files like this:

├── LICENSE
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf


In this case, when you run Terraform commands from within the minimal-module directory, the contents of that directory are considered the root module.


Calling modules

Terraform commands will only directly use the configuration files in one directory, which is usually the current working directory. However, your configuration can use module blocks to call modules in other directories. When Terraform encounters a module block, it loads and processes that module's configuration files.

A module that is called by another configuration is sometimes referred to as a "child module" of that configuration.
Local and remote modules

Modules can be loaded from either the local filesystem or a remote source. Terraform supports a variety of remote sources, including the Terraform Registry, most version control systems, HTTP URLs, and Terraform Cloud or Terraform Enterprise private module registries.



Module best practices

In many ways, Terraform modules are similar to the concepts of libraries, packages, or modules found in most programming languages, and they provide many of the same benefits. Just like almost any non-trivial computer program, real-world Terraform configurations should almost always use modules to provide the benefits mentioned above.

It is recommended that every Terraform practitioner use modules by following these best practices:

    Start writing your configuration with a plan for modules. Even for slightly complex Terraform configurations managed by a single person, the benefits of using modules outweigh the time it takes to use them properly.

    Use local modules to organize and encapsulate your code. Even if you aren't using or publishing remote modules, organizing your configuration in terms of modules from the beginning will significantly reduce the burden of maintaining and updating your configuration as your infrastructure grows in complexity.

    Use the public Terraform Registry to find useful modules. This way you can quickly and confidently implement your configuration by relying on the work of others.

    Publish and share modules with your team. Most infrastructure is managed by a team of people, and modules are an important tool that teams can use to create and maintain infrastructure. As mentioned earlier, you can publish modules either publicly or privately. You will see how to do this in a later lab in this series.




# Task 1. Use modules from the Registry

https://registry.terraform.io/

https://registry.terraform.io/modules/terraform-google-modules/network/google/3.3.0


https://www.terraform.io/docs/modules/sources.html


# Create a Terraform configuration

git clone https://github.com/terraform-google-modules/terraform-google-network
cd terraform-google-network
git checkout tags/v6.0.1 -b v6.0.1




Set values for module input variables

Some input variables are required, which means that the module doesn't provide a default value; an explicit value must be provided in order for Terraform to run correctly.

    Within the module "test-vpc-module" block, review the input variables you are setting. Each of these input variables is documented in the Terraform Registry. The required inputs for this module are:
        network_name: The name of the network being created
        project_id: The ID of the project where this VPC will be created
        subnets: The list of subnets being created

In order to use most modules, you will need to pass input variables to the module configuration. The configuration that calls a module is responsible for setting its input values, which are passed as arguments to the module block. Aside from source and version, most of the arguments to a module block will set variable values.

On the Terraform Registry page for the Google Cloud network module, an Inputs tab describes all of the input variables that module supports.


# Task 2. Build a module

In the last task, you used a module from the Terraform Registry to create a VPC network in Google Cloud. Although using existing Terraform modules correctly is an important skill, every Terraform practitioner will also benefit from learning how to create modules. We recommend that you create every Terraform configuration with the assumption that it may be used as a module, because this will help you design your configurations to be flexible, reusable, and composable.

As you may already know, Terraform treats every configuration as a module. When you run terraform commands, or use Terraform Cloud or Terraform Enterprise to remotely run Terraform, the target directory containing Terraform configuration is treated as the root module.

In this task, you create a module to manage Compute Storage buckets used to host static websites.




Create a module

Navigate to your home directory and create your root module by constructing a new main.tf configuration file. Then create a directory called modules that contains another folder called gcs-static-website-bucket. You will work with three Terraform configuration files inside the gcs-static-website-bucket directory: website.tf, variables.tf, and outputs.tf.

    Create the directory for your new module:



cd ~
touch main.tf
mkdir -p modules/gcs-static-website-bucket



Navigate to the module directory and run the following commands to create three empty files:


cd modules/gcs-static-website-bucket
touch website.tf variables.tf outputs.tf


Inside the gcs-static-website-bucket directory, run the following command to create a file called README.md with the following content:

tee -a README.md <<EOF
# GCS static website bucket

This module provisions Cloud Storage buckets configured for static website hosting.
EOF

Note: Choosing the correct license for your modules is out of the scope of this lab. This lab will use the Apache 2.0 open source license. 




Create another file called LICENSE with the following content:




tee -a LICENSE <<EOF
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
EOF





Add this Cloud Storage bucket resource to your website.tf file inside the modules/gcs-static-website-bucket directory:


resource "google_storage_bucket" "bucket" {
  name               = var.name
  project            = var.project_id
  location           = var.location
  storage_class      = var.storage_class
  labels             = var.labels
  force_destroy      = var.force_destroy
  uniform_bucket_level_access = true

  versioning {
    enabled = var.versioning
  }

  dynamic "retention_policy" {
    for_each = var.retention_policy == null ? [] : [var.retention_policy]
    content {
      is_locked        = var.retention_policy.is_locked
      retention_period = var.retention_policy.retention_period
    }
  }

  dynamic "encryption" {
    for_each = var.encryption == null ? [] : [var.encryption]
    content {
      default_kms_key_name = var.encryption.default_kms_key_name
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      action {
        type          = lifecycle_rule.value.action.type
        storage_class = lookup(lifecycle_rule.value.action, "storage_class", null)
      }
      condition {
        age                   = lookup(lifecycle_rule.value.condition, "age", null)
        created_before        = lookup(lifecycle_rule.value.condition, "created_before", null)
        with_state            = lookup(lifecycle_rule.value.condition, "with_state", null)
        matches_storage_class = lookup(lifecycle_rule.value.condition, "matches_storage_class", null)
        num_newer_versions    = lookup(lifecycle_rule.value.condition, "num_newer_versions", null)
      }
    }
  }
}



Navigate to the variables.tf file in your module and add the following code:




variable "name" {
  description = "The name of the bucket."
  type        = string
}

variable "project_id" {
  description = "The ID of the project to create the bucket in."
  type        = string
}

variable "location" {
  description = "The location of the bucket."
  type        = string
}

variable "storage_class" {
  description = "The Storage Class of the new bucket."
  type        = string
  default     = null
}

variable "labels" {
  description = "A set of key/value label pairs to assign to the bucket."
  type        = map(string)
  default     = null
}


variable "bucket_policy_only" {
  description = "Enables Bucket Policy Only access to a bucket."
  type        = bool
  default     = true
}

variable "versioning" {
  description = "While set to true, versioning is fully enabled for this bucket."
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all contained objects. If false, Terraform will fail to delete buckets which contain objects."
  type        = bool
  default     = true
}

variable "iam_members" {
  description = "The list of IAM members to grant permissions on the bucket."
  type = list(object({
    role   = string
    member = string
  }))
  default = []
}

variable "retention_policy" {
  description = "Configuration of the bucket's data retention policy for how long objects in the bucket should be retained."
  type = object({
    is_locked        = bool
    retention_period = number
  })
  default = null
}

variable "encryption" {
  description = "A Cloud KMS key that will be used to encrypt objects inserted into this bucket"
  type = object({
    default_kms_key_name = string
  })
  default = null
}

variable "lifecycle_rules" {
  description = "The bucket's Lifecycle Rules configuration."
  type = list(object({
    # Object with keys:
    # - type - The type of the action of this Lifecycle Rule. Supported values: Delete and SetStorageClass.
    # - storage_class - (Required if action type is SetStorageClass) The target Storage Class of objects affected by this Lifecycle Rule.
    action = any

    # Object with keys:
    # - age - (Optional) Minimum age of an object in days to satisfy this condition.
    # - created_before - (Optional) Creation date of an object in RFC 3339 (e.g. 2017-06-13) to satisfy this condition.
    # - with_state - (Optional) Match to live and/or archived objects. Supported values include: "LIVE", "ARCHIVED", "ANY".
    # - matches_storage_class - (Optional) Storage Class of objects to satisfy this condition. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, STANDARD, DURABLE_REDUCED_AVAILABILITY.
    # - num_newer_versions - (Optional) Relevant only for versioned objects. The number of newer versions of an object to satisfy this condition.
    condition = any
  }))
  default = []
}




Add an output to your module in the outputs.tf file inside your module:



output "bucket" {
  description = "The created storage bucket"
  value       = google_storage_bucket.bucket
}



Like variables, outputs in modules perform the same function as they do in the root module but are accessed in a different way. A module's outputs can be accessed as read-only attributes on the module object, which is available within the configuration that calls the module.




Return to the main.tf in your root directory and add a reference to the new module:



module "gcs-static-website-bucket" {
  source = "./modules/gcs-static-website-bucket"

  name       = var.name
  project_id = var.project_id
  location   = "REGION"

  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age        = 365
      with_state = "ANY"
    }
  }]
}



In your root directory, create an outputs.tf file for your root module:


cd ~
touch outputs.tf


Add the following code in the outputs.tf file:


output "bucket-name" {
  description = "Bucket names."
  value       = "module.gcs-static-website-bucket.bucket"
}


Add the following code to the variables.tf file. Set the variables project_id and name to default to your Project ID



variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
  default     = "FILL IN YOUR PROJECT ID HERE"

}

variable "name" {
  description = "Name of the buckets to create."
  type        = string
  default     = "FILL IN A (UNIQUE) BUCKET NAME HERE"
}






```




## Managing Terraform State  


```

# Overview

Terraform must store the state about your managed infrastructure and configuration. This state is used by Terraform to map real-world resources to your configuration, keep track of metadata, and improve performance for large infrastructures.

This state is stored by default in a local file named terraform.tfstate, but it can also be stored remotely, which works better in a team environment.

Terraform uses this local state to create plans and make changes to your infrastructure. Before any operation, Terraform does a refresh to update the state with the real infrastructure.

The primary purpose of Terraform state is to store bindings between objects in a remote system and resource instances declared in your configuration. When Terraform creates a remote object in response to a change of configuration, it will record the identity of that remote object against a particular resource instance and then potentially update or delete that object in response to future configuration changes.



# Objectives


    Create a local backend
    Create a Cloud Storage backend
    Refresh your Terraform state
    Import a Terraform configuration
    Manage the imported configuration with Terraform



Purpose of Terraform state

State is a necessary requirement for Terraform to function. People sometimes ask whether Terraform can work without state or not use state and just inspect cloud resources on every run. In the scenarios where Terraform may be able to get away without state, doing so would require shifting massive amounts of complexity from one place (state) to another place (the replacement concept). This section will help explain why Terraform state is required.



Mapping to the real world

Terraform requires some sort of database to map Terraform config to the real world. When your configuration contains a resource resource "google_compute_instance" "foo", Terraform uses this map to know that instance i-abcd1234 is represented by that resource.

Terraform expects that each remote object is bound to only one resource instance, which is normally guaranteed because Terraform is responsible for creating the objects and recording their identities in the state. If you instead import objects that were created outside of Terraform, you must verify that each distinct object is imported to only one resource instance.

If one remote object is bound to two or more resource instances, Terraform may take unexpected actions against those objects because the mapping from configuration to the remote object state has become ambiguous.





```




