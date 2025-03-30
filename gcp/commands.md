# GCP Commands  


gcloud init

gcloud config list 


gcloud config configurations describe [NAME]


gcloud config configurations delete [NAME]




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