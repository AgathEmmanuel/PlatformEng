
# GCP  


[https://cloud.google.com/compute/all-pricing#lb](https://cloud.google.com/compute/all-pricing#lb)  

[https://cloud.google.com/compute/docs/general-purpose-machines](https://cloud.google.com/compute/docs/general-purpose-machines)  

[https://cloud.google.com/compute/all-pricing](https://cloud.google.com/compute/all-pricing)  

[https://cloud.google.com/kubernetes-engine/docs/concepts/spot-vms](https://cloud.google.com/kubernetes-engine/docs/concepts/spot-vms)  


[https://cloud.google.com/kubernetes-engine/docs/concepts/spot-vms](https://cloud.google.com/kubernetes-engine/docs/concepts/spot-vms)  


[https://blog.realkinetic.com/using-google-cloud-service-accounts-on-gke-e0ca4b81b9a2](https://blog.realkinetic.com/using-google-cloud-service-accounts-on-gke-e0ca4b81b9a2)  


```


gcloud config set project <project-name>  

gcloud config set compute/zone us-central1-a  



https://cloud.google.com/binary-authorization/docs/getting-started-cli  


gcloud container clusters get-credentials <cluster-name>  






gcloud container clusters create test-cluster --num-nodes=1  

 Node Pools
default-pool 	
Ok 	1.21.10-gke.2000 	1 	e2-medium 	Container-Optimized OS with containerd (cos_containerd) 	Off 




Machine type 	vCPUs 	Memory 	Price (USD) 	Spot price*(USD) 	1 year commitment (USD) 	3 year commitment (USD)
e2-micro 	2 	1GB 	$0.008376 	$0.002513 	$0.00528 	$0.00377
e2-small 	2 	2GB 	$0.016751 	$0.005025 	$0.01055 	$0.00754
e2-medium 	2 	4GB 	$0.033503 	$0.010051 	$0.02111 	$0.01508




gcloud container clusters get-credentials test-cluster   		# configures kubectl to use the cluser u created  

gcloud container clusters create \
  --machine-type n1-standard-2 \
  --num-nodes 2 \
  --zone <compute zone from the list linked below> \
  --cluster-version latest \
  <CLUSTERNAME>


gcloud container clusters delete \
    --zone=us-central1-a \
    test-cluster





kubectl create deploy web-server --image=nginx  

kubectl expose deploy web-server --type LoadBalancer --port 80 --target-port 8080  

kubectl get service web-server  




```


```


gcloud config set project <project-name>

gcloud config set compute/zone us-central1-a




gcloud auth login  

gcloud init  






gcloud components install kubectl  


gcloud container clusters get-credentials <cluster name>  



gcloud alpha storage ls			# list buckets in gcp  



https://cloud.google.com/storage/docs/listing-buckets#cli-list-buckets  




gcloud alpha storage cp --recursive gs://SOURCE_BUCKET/* gs://DESTINATION_BUCKET

gcloud alpha storage rm --recursive gs://SOURCE_BUCKET

gcloud alpha storage rm --all-versions gs://SOURCE_BUCKET/**

gcloud alpha storage ls --recursive gs://BUCKET_NAME/**

gcloud alpha storage rm gs://BUCKET_NAME/OBJECT_NAME





[https://cloud.google.com/kubernetes-engine/docs/how-to/node-pools](https://cloud.google.com/kubernetes-engine/docs/how-to/node-pools)  



gcloud container node-pools create POOL_NAME \
    --cluster CLUSTER_NAME \
    --service-account SERVICE_ACCOUNT


gcloud container node-pools list --cluster CLUSTER_NAME


gcloud container node-pools list --cluster CLUSTER_NAME


gcloud container node-pools describe POOL_NAME \
    --cluster CLUSTER_NAME


gcloud container clusters resize CLUSTER_NAME \
    --node-pool POOL_NAME \
    --num-nodes NUM_NODES


gcloud container clusters upgrade CLUSTER_NAME


gcloud container clusters upgrade CLUSTER_NAME \
  --node-pool=NODE_POOL_NAME


gcloud container clusters upgrade CLUSTER_NAME \
  --node-pool=NODE_POOL_NAME \
  --cluster-version VERSION


gcloud container node-pools delete POOL_NAME \
    --cluster CLUSTER_NAME




https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-autoscaler


gcloud container clusters create CLUSTER_NAME \
    --enable-autoscaling \
    --num-nodes NUM_NODES \
    --min-nodes MIN_NODES \
    --max-nodes MAX_NODES \
    --region=COMPUTE_REGION


gcloud container clusters create my-cluster --enable-autoscaling \
    --num-nodes 30 \
    --min-nodes 15 --max-nodes 50 \
    --zone us-central1-c


gcloud container node-pools create POOL_NAME \
    --cluster=CLUSTER_NAME \
    --enable-autoscaling \
    --min-nodes=MIN_NODES \
    --max-nodes=MAX_NODES \
    --region=COMPUTE_REGION


gcloud container node-pools create my-node-pool \
    --cluster my-cluster \
    --enable-autoscaling \
    --min-nodes 1 --max-nodes 5 \
    --zone us-central1-c


gcloud container clusters update CLUSTER_NAME \
    --enable-autoscaling \
    --node-pool=POOL_NAME \
    --min-nodes=MIN_NODES \
    --max-nodes=MAX_NODES \
    --region=COMPUTE_REGION


gcloud container clusters update CLUSTER_NAME \
    --no-enable-autoscaling \
    --node-pool=POOL_NAME \
    --region=COMPUTE_REGION






```



google cloud build  
google cloud VM  




```

Steps  

enable google cloud build  
update skaffold.yaml file to use Google cloud Build  
setup ingress-nginx on our google-cloud cluster  kubernetes.github.io/ingress-nginx  
update our host file to point to the remote cluster  
Restart Skaffold  











[https://pnatraj.medium.com/how-to-run-gcloud-command-line-using-a-service-account-f39043d515b9](https://pnatraj.medium.com/how-to-run-gcloud-command-line-using-a-service-account-f39043d515b9)  


1) Create a Service Account

gcloud iam service-accounts create gcpcmdlineuser --display-name "GCP Service Account"

gcloud iam service-accounts create gcpcmdlineuser

2) List the users

gcloud iam service-accounts list --filter gcpcmdlineuser@someproject.gserviceaccount.com

3) Download the service account key

gcloud iam service-accounts keys create ./somekey.json --iam-account <EMAIL ADDRESS>

gcloud iam service-accounts keys create gcpcmdlineuser.json --iam-account gcpcmdlineuser@someproject.iam.gserviceaccount.com

4) Associate a ROLE

gcloud iam roles create <ROLE NAME> --project <YOUR PROJECT ID> --file ./rolename.yaml

gcloud projects add-iam-policy-binding someprojecthere --member "serviceAccount:gcpcmdlineuser@someproject.iam.gserviceaccount.com" --role "roles/owner"

gcloud projects add-iam-policy-binding <PROJECT ID> --role <ROLE NAME> --member serviceAccount:<EMAIL ADDRESS>

5) Activate the service account

gcloud auth activate-service-account --project=someproject --key-file=gcpcmdlineuser.json

gcloud auth activate-service-account --key-file=gcpcmdlineuser.json

GCP CLI’s which might help

gcloud init --console-only

gcloud config set account gcpcmdline@someproject.iam.gserviceaccount.com

gcloud auth application-default login --no-launch-browser

gcloud compute instances list

gcloud auth list

gcloud auth revoke

gcloud info

From GCP Console

    Create a service account with GCP console
    Download the json key file
    Create a role and assign proper required permissions to the role.
    gcloud config set account gcli@someproject.iam.gserviceaccount.com
    gcloud auth activate-service-account — key-file=gcli.json — project=someprojectname

Role template could be as below

title: CLI Service Role
description: “CLI Service Role.”
stage: “ROLE”
includedPermissions:
— compute.autoscalers.get
— compute.autoscalers.list
— compute.autoscalers.update
— compute.instances.start
— compute.instances.startWithEncryptionKey
— compute.instances.stop
— compute.instances.get
— compute.instances.list
— compute.instanceGroupManagers.get
— compute.instanceGroupManagers.list
— compute.instanceGroupManagers.update
— compute.instanceGroupManagers.use
— compute.zones.get
— compute.zones.list
— monitoring.groups.get
— monitoring.groups.list
— monitoring.metricDescriptors.get
— monitoring.metricDescriptors.list
— monitoring.monitoredResourceDescriptors.get
— monitoring.monitoredResourceDescriptors.list
— monitoring.timeSeries.list
— resourcemanager.projects.get



[https://cloud.google.com/storage/docs/access-control](https://cloud.google.com/storage/docs/access-control)  
[https://cloud.google.com/storage/docs/access-control/iam-permissions](https://cloud.google.com/storage/docs/access-control/iam-permissions)  
[https://www.edureka.co/community/96208/gcp-custom-iam-role-creation-with-terraform](https://www.edureka.co/community/96208/gcp-custom-iam-role-creation-with-terraform)  

[https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_custom_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_custom_role)  

[https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_id_token](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_id_token)  

[https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_openid_userinfo](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_openid_userinfo)  

```

Example Usage - OpenID Connect w/ Kubernetes provider + RBAC IAM role

data "google_client_openid_userinfo" "provider_identity" {
}

data "google_client_config" "provider" {
}

data "google_container_cluster" "my_cluster" {
  name = "my-cluster"
  zone = "us-east1-a"
}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
  )
}

resource "kubernetes_cluster_role_binding" "user" {
  metadata {
    name = "provider-user-admin"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind = "User"
    name = data.google_client_openid_userinfo.provider_identity.email
  }
}


```



[https://cloud.google.com/iam/docs/policies](https://cloud.google.com/iam/docs/policies) 
```
Example: Policy with multiple role bindings

Consider the following allow policy that contains more than one role binding. Each role binding grants a different role:

{
  "bindings": [
    {
      "members": [
        "user:jie@example.com"
      ],
      "role": "roles/resourcemanager.organizationAdmin"
    },
    {
      "members": [
        "user:raha@example.com",
        "user:jie@example.com"
      ],
      "role": "roles/resourcemanager.projectCreator"
    }
  ],
  "etag": "BwUjMhCsNvY=",
  "version": 1
}

```

[https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_iam) 

```
google_service_account_iam_policy

data "google_iam_policy" "admin" {
  binding {
    role = "roles/iam.serviceAccountUser"

    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_service_account" "sa" {
  account_id   = "my-service-account"
  display_name = "A service account that only Jane can interact with"
}

resource "google_service_account_iam_policy" "admin-account-iam" {
  service_account_id = google_service_account.sa.name
  policy_data        = data.google_iam_policy.admin.policy_data
}

```


[https://learn.hashicorp.com/tutorials/terraform/gke](https://learn.hashicorp.com/tutorials/terraform/gke)  

[https://cloud.google.com/kubernetes-engine/docs/concepts/node-pools](https://cloud.google.com/kubernetes-engine/docs/concepts/node-pools)  




DevOps Engineer

```

Compute
Storage
Big Data
Machine Learning



on demand service
broad network access
resource pooling
rapid elasticity
measured service


every company is a data company


compute engine 
kubernetes engine
app engine
cloud functions
managed services


GCP regions and Zones

15 regions



Cloud Bigtable  -  Apache HBAse like interface
Cloud Dataproc  -  similar to Hadoop


Tensorflow
Kubernetes
Forseti security

Google stackdriver



Compute
  compute engine
  kubernetes engine
  app engine
  cloud functions

Storage
  bigtable
  cloud storage
  cloud sql
  cloud spanner
  cloud datastore


Bigdata
  big query
  pub/sub
  data flow
  data proc
  data lab


Machine Learning
  Natural Language API
  Vision API
  Machine Learning 
  Speech API
  Translate API



Budgets and Alerts
Billing export
Reports
Quotas (rate and allocation quota)



IAM
Projects
Folders


All resources in the project inherite the IAM policies


Owner 
Editor
Viewer 
Billing administrator


IAM custome roles
- can only be used at project or organizational level not at the folder level

Service Accounts
- control server to server communication


Cloud client libraries
Google API client libraries


Cloud Launcher





VPC network

gcp VPC network are global, subnets are regional

Compute Engine

boot image : linux or windows server
memory
cpu
gpu
persistent disks
standard
ssd
startup script
disk snapshot as backups or migration tools


Preemptible instances


VPC capabilities

- we can use its route table to forward traffic within the network, even across subnets
- use its firewall to control what network traffic is allowed
- use shared vpc to share a network or individual subnets with other gcp projects
- use vpc peering to interconnect networks in gcp projects
- with global cloud load balancing your application presents a single front-end to the world
- users get a single global anycast IP address

Global VPC offers a suite of load balancing options
- Global HTTP(s)
- Global SSL Proxy
- Global TCP Proxy
- Regional
- Regional internal



Cloud DNS
Cloud CDN


Interconnection options

VPN
Direct peering
Carrier peering
Dedicated interconnect





---- Cloud Storage

large-object storage
data encryption at rest and in transit
ACLs
object lifecycle management
classes:  multi-regional, regional, nearline, coldline


Ways to bring data into Cloud Storage
- Online transfer
- Storage transfer service
- Transfer appliance


---- Cloud Bigtable

fully managed NoSQL
wide column database
store large amounts of data with very low latency
both read and write
analytical applications, IOT, user analytics, financial data analytics
accessed using HBase API
native compatibility with big data, Hadoop ecosystems
managed, scalable storage
data encyption in-flight and at rest
control access with IAM

Bigtable Access Patterns
- Application API
- Streaming
- Batch Processing


---- Cloud SQL

managed RDBMS
offers MySql and ProstgreSql database as a service
automatic replication
managed backups
vertical scaling (read and write)
horizontal scaling (read)
google security

---- Cloud Spanner

strong global consistency
managed instances with high availability
SQL quries   ANSI 2011 with extensions
automatic replications



---- Cloud Datastore

horizontally scalable NoSql DB
for application backends
supports transactions
includes a free daily quota
automatically handles sharding and replication




coparing storage options
  
            cloudDatastore   bigTable          cloudStorage   cloudSql           cloudSpanner       bigQuery
type        noSql document  Nosql wide column  blobstore   relationalSql/OLTP  relationalSql/OLTP relationalSql/OLTP   
transactions    yes           single-row         no             yes                    yes             no
complex query   no              no               no             yes                    yes             yes
capacity      terabytes+      petabytes+       petabytes+      terabytes             petabytes         petabytes+
unit size     1MB/entity    10MB/cell 100MB/row   5TB/Object Determined by DBengine   10,240 MiB/row   10MB/row 
best for     semi structured  flat data          structured and     web frameworks    large-scale      Interactive
            application data  heavy read/write   unstructured binary   existing      db applications   querying,
      durable key-value data  events,analyticaldata  or object data    applications    (> 2TB)         offline anlaytics
use cases    getting started,  AdTech, finacial    images, large    user credentials,  when high I/O   Data warehousing
     app engine applications   and IoT data      media files, backups   customer orders  glbal consistency is needed








Containers in Cloud


Kubernetes


modern distributed systems allow a more agile approach to 
managing your compute resources

- move only some of your compute workloads to cloud
- move at your own pace
- take advantage of clouds scalability and lower costs
- add specialized services to your compute resources stack



Anthos is Google solution for hybrid multi-cloud systems
- kubernetes and GKE on prem create the foundation
- on premises and cloud environments stay in sync


Google Cloud Platform
- cloud console
- Anthos config management
- Anthos service mesh
- gke

On prem Data center
- policy repocitory on git
- istio open source
- anthos config management
- gke on-prem


cloud interconnect
gcp marketplace
stackdriver ( logging and monitoring )


GKE
- configuring health checks
- setting session affinity
- managing different rollout strategies
- deploying pods across regions for HA




App Engine  PaaS
- for building scalable applications
- make deployment, maintenance, scalability easy
- suited for scalable web applications and mobile backends
- SDKs for development, testing and deployment


Cloud Endpoints
- distributed api management through an API console
- expose your api using a restful interface
- control access and validate calls with json web tokesn and google api keys
- identify web and mobile users with Auth0 and firebase authentication
- generate client libraries


Apigee Edge


https://github.com/GoogleCloudPlatform/appengine-guestbook-python


Developing, Deploying and Monitoring in cloud

Cloud Source Repositories

Cloud functions

GCP Deployment Manager
Deployment: Infrastructure as code


Stackdirver
- monitoring
- logging
- trace
- error reporting
- debugger
- profiler





Big data and Machine Learning in cloud

- Cloud Dataproc
- Cloud Dataflow
- BigQuery
- Cloud Pub/Sub
- Cloud Datalab






# Comparing loadbalancing options

Global HTTP(S)       
layer 7 load balancing based on load
can route different URLs to different back ends

Global SSL Proxy
layer 4 load balancing of non-SSL TCP traffic
supported on specific port numbers

Global TCP Proxy
layer 4 load balancing of non-SSL TCP traffic
supported on specific port numbers

Regional
load balancing of any traffic (TCP, UDP)
supported on any port number

Regional internal
load balancing of traffic inside a VPC
use for the internal tiers of multi-tier applications


# Comparing interconnect options
VPN              secure multi-Gbps connection over VPN tunnels
Direct Peering   private connection bw you and google for your hybrid cloud workloads
Carrier Peering  connection through the largest partner n/w of service providers
Dedicated Interconnect    connect N X 10G transport circuit for private
                          cloud traffic to Google Cloud at Google POPs




-------- Developing a Google SRE culture

DevOps philosophy
IT operations


DevOps
- reduce organizational silos
- accept failure as normal
- implement gradual change
- leverage tooling and automation
- measure everything


SRE
- share ownership
- SLO ( service level objectives )
- Blamelessness
- reduce cost of failure
- toil automation
- measure toil and reliability
- software engineers responsible for operations




the value of SRE to your organization
blameless post mortems
psychological safety
SLOs
Error budgets
sharing vision and knowledge



protect, provide for and progress software and systems
with consistent forcus on availability, latency,
performance, and capacity


incentivize automation with time for creativity
launching and iterating allows teams to fail fast



Experienced SREs
- are comfortable with failure
- eleminate ambiguity with monitoring
- establish and document processes


Components of postmortem
- details of the incident and its timeline
- actions taken to mitigate or resolve the incident
- incidents impact
- trigger and root cause or causes
- follow-up actions to prevent its recurrence
- take effective action to prevent issue from occuring again
- reduce likelihood of stressful outages
- avoid multiplying complexity


Psycological safety:  belief that a person will not be punished or 
                      humiliated for speaking up with ideas, questions,
                      concerns, or mistakes


Work environments wit low psycological safety:
- people keep concerns or ideas to themselves
- people are afraid of looking incompetent or ignorant
- people are afraid of being ridiculed



Blamelessness fosters psychological safety
- Hindsight bias
- Discomfor discharge

focus on systems and processes, not people
innovation requires some degree of risk taking



Reduce orgnanisational silos with SLOs and error budgets

- 40% to 90% of total software engineering costs are incurred after launch
- SRE promotes shared ownership
- Reliability = Good time / Total time
- fraction of time the service is available and working
- Availability = Good interactions / Total interactions
- fraction of real users who experience a service thats working and available
- Error Budget = amount of unreliability you are willing to tolerate
- error budget help priorize engineering work
- SLO - service level objectives : precise numerical target for system reliability
- SLI - service level indicators
- SLI = how well a service is doing at any moment in time
- SLI = ( good events / valid events ) * 100%
- SLI should generally be just short of 100%, 99.9%
- SLA is a promise about health of your service to your customers



Create a unified vision
Determine what collaboration looks like
Share knowldge among teams
Google uses OKRs ( Objectives and Key Results )



Team composition roles
- Tech lead: who sets technical direction of the team
- Manager: who runs performance management
- Project manager: comments on design doc and writes code



Effective communication between product development and SRE teams is vital
This collaboration is best if its as early in the design phase as possible
SRE make recommendations about architecture and software behaviour
SRE leverages automation to put more time and effort into software
development than to operations




Knowledge Sharing
Cross training
Employee to employee network
Job shadowing
Cross functional collaboration
Pair up with team members to scale and retain knowledge




CI/CD
Canarying
Toil
Automation



CI - building, integrating and testing code within dev environment


code -> build -> integrate -> test -> release -> deploy -> operate



Design thinking
- empathize
- define
- ideate
- prototype
- test



If a human operato needs to touch your system during normal
operations, then you have a bug. The definition of normal
changes as your systems grow.




Toil
- manual
- repetitive
- automatable
- tactical
- without enduring value
- scales linearly as the service grows


Exessive toil
- career stagnation
- low morale
- confusion
- slower progress
- precedence
- attrition
- breach of faith


Psycology of change
- navigators
- critics
- victims
- bystanders

How to incoporate a change
- involve people in the change
- set realistic expectations
- identify opportunities for co-creation and provide coaching instead of solutions
- simplify messaging and focus on key concepts per user group
- ensure that communications are engaging and training is interactive
- allow people time to build new habits


Emotional response to change
- denial
- resistence
- acceptance
- exploration
- commitment
- growth


Head ( rational )
Heart ( emotional )
Feet ( behavioral )



Regulate Workload

- measuring reliability
- measuring toil
- monitoring



cpu utilization
memory usage
load avaerage


Four Golden signals
- latency
- traffic
- errors
- saturation


Goal setting, transperancy and data-driven decision making
- google uses OKRs as KPIs, graded from 0.0 to 1.0
- OKR grading 60-70 % is a good score
- transperency
- feedback loop
- data-driven decision making
- remove bias ( affinity bias, confirmation bias, labeling bias, selective attention bias )
- question your first impressions
- justify decisions
- make decisions collectively


Apply SRE in Organization
- operations and software engineering
- monitoring systems
- production automation
- system architecture
- troubleshooting
- culture of trust
- incident management

SRE team implementations
- Kitchen Sink or "Everything SRE"
- Infrastructure
- Tools
- Product/Application
- Embedded
- Consulting

Kitchen Sink or "Everything SRE"
- there are no coverage gaps
- easy to spot patterns & similarities bw services and projects
- acts as glue between teams
- may write code and maintain tools for themselves and developers
- could be hands-on changing code and configuraton of service
- may need to work on reliability of many critical applications
- could focus on building software to help developers with aspects of SRE work
- maintain shared services related to infrastructure


Infrastructure team
- help make other teams jobs easier
- maintains shared services related to infrastructure
- recommended for organizations with multiple developer teams
- defines common standards for the IT team


Tools team
- could focus on building software to help developers with aspects of SRE work
- recommended for orgs that need highly specialized reliability-related tooling


Product/Application team
- improves reliability of a critical application
- recommended for organizations that have Kitchen Sink, Infrastucture,
  or Tools SRE team and application with high reliability needs


Embedded team
- SREs are embedded with developers
- SREs and developers have a project or time bounded relationship
- hands-on changing code and configs or service
- recommended for orgs to start a team or scale another implementation
- can augment impact of tools or infrastructure team

Consulting team
- similar to embedded team
- less hands on
- may write code and maintain tools for themselves and developers
- not recomended until organizational complexity is large




Reliable Google Cloud Infra Design and Process

- architect you application using microservices
- choose best storage and deployment service using objective criteria

Agenda
- defining service
- microservice design and architecture
- devops automation
- choosing storage solutions
- google cloud and hybrid netework architecture
- deploying applications to google cloud
- designing reliable systems
- security
- maintenance and monitoring



Challengin ideas
- online banking portal
- ride sharing application
- online shopping site
- online travel portal


Online Shopping
- customer
- supplier upload inventory 
- manager
- social media intergration
- unique pricing based on customer preferences


users roles and personas
qualitative requirements
quantitative requirements usin KPI(key performance indicators)
evaluate service requirements
determine appropriate SLOs and SLIs for your service


KPIs
- Business KPIs
- Technical KPIs



SMART KPIs
- specific
- measurable
- relevant
- time-bound



SLI				      SLO
HTTP POST photo uploads complete      99%
within 100ms aggregated per minute    80%

Available as measured with an         100%
uptime check every 10 seconds         99.999%
aggregated per minute                 99%





SLA  is a business  contract between the provider and customer
- a penalty will apply to provider if service not maintain certain availability
  and performance thresholds
- if SLA broken, customer will receive compensation from the provider


Example
SLI: latency of successful HTTP responses (HTTP-200)
SLO: latency of 99% of responses must be <= 200 ms
SLA: user is compensated if 99th percentile latency exceeds 300ms




User Story               SLO                       SLI
Balance inquiry    available 99.95%        Fraction of 200 vs 500 HTTP
                                           responses from API endpoint measured per day
Balance inquiry    95% or requests will    Time to last byte GET requests measured
                  complete in under 300ms  every 10 seconds aggregated per minute
search inventory   available 99.9%         Fraction of 200 vs 500 HTTP responses from
                                           API endpoint measured per month
analyze user count  95% of queries should  Time to last byte GET requests measured every
                   complete in under 10s   60 seconds aggregated per 10 minutes
supply inventory   available 99.9%         Fraction of 200 vs 500 HTTP responses from
                                           API endpoint measured per month
supply inventory   error rate < .00001%    Errors in upload measured as % of bulk 
                                           uploads per day by custom metric




Microservice Design and Architecture
- monolithic to microservices
- stateful & stateless services to optimize scalability & reliability
- services using 12-factor best practices
- microservice boundaries
- consistent standard RESTful service APIs
- loosely coupled services with well-designed REST architecture


multiple smaller independent services
multiple code bases with each service managing its own data


Key to architecting Microservices
- decompose apps by feature to minimize dependencies
- organize services by architectural layer
- isolate services that provide shared functionality

Stateful services manage stored data over time
- harder to scale
- harder to upgrade
- need to back up

Stateless services get their data from environment
or other stateful services
- easy to scale
- easy to update to new versions
- easy to administer



Avoid storing shared state in-memory on your servers
- requires sticky sessions to be set up in the load balancer
- hinders elastic autoscaling

Store ste using backend storage services shared by the frontend stateless servers
- cache state data for faster access
- take advantage of Googl Cloud - managed data services
  - firestore, Cloud SQL, etc. for state
  - memorystore for caching


General solution for large-scale cloud-based systems

              Stateless             Stateless    Stateful
Cloud DNS      Frontend              Backend     Stateful pods
                                      pod1
HTTP load        pod1    Network      pod2
balancer         pod2     Load        pod3
                         balancer     pod4

- use DNS and HTTP(S) load balancing to get requests from users
- use internal load balancers to communicate b/w frontend & backend services
- use many small stateless servers for scalability and fault tolerance
- isolate the stateful servers


12 Facto App: Best Practice for SaaS apps
- maximize portability
- deploy to cloud
- enable continous deployment
- scale easily

- codebase: each app has one code repo, git
- dependencies: declaration and isolation, package mangers pip,maven,npm
- config: store secrets, connecion strings, endpoints as environment variables
- backing service: treat them as attached resources
          databases, caches, queues, & other services are accessed via URLs
          should be easy to swap one implementation for another
- build, release, run: strictly separate build and run stages
          build creates a deployment package from source code
          release combines deployment with config in runtime environment
          run executes the application
- processes:  execute the app as one or more stateless processes
          apps run in one or more processes
          each instance of the app gets its data from a separate service
- port binding:  export services via port binding
          apps are self contained and expose port and protocol internally
          apps are not injected into a separate server like Apache
- concurrency:  scale out via the process model
          because apps are self-contained and run in separate process,
          they can scale easily by adding instances
- disposability: maximize robustness with fast startup and graceful shutdown
          app instances should scale quickly when needed
          if and instance isnt needed, we should be able to turn it off with no side effects
- Dev/prod parity:  keep dev, staging and production as similar as possible
          container systems makes it easier
          use IAC to make easy to create environments
- Logs:   Treat logs as event streams
          write log messages to standard output and aggregate all logs to single source
- Admin processes:  Run admin/management tasks as one-off processes
          admin tasks should be repeatable processes, not one-off manual tasks
          admin tasks shouldn't be a part of the application


Sample Design
- Web UI
- Mobile UI
- Auth Service
- Search service
- Orders service | orders database
- Inventory service | inventory database
- Analytics service | data warehouse
- Reporting service


Design consistent APIs for services
OpenAPI is an industry standard for exposing API to clients
gRPC is a lightweight protocol for fast, binary communincation b/w services or devices
  - developed at google
  - support many languages
  - easy to implement
  - global load balancer (HTTP/2)
  - cloud endpoints
  - can expose gRPC services using an envoy proxy in GKE
Google Cloud provides 2 tools, Cloud Endpoints and Apigee for managing APIs





DevOps Automation
- automate service deployment using CI/CD pipelines
- source and version control with Cloud Source Repositories
- automate build with Cloud build and build triggers
- manage container images with Container Registry
- infrastructure with code using Terraform


CI
- developer check-in code
- run unit tests
- build deployment package docker image
- deploy
- extra steps: linting of code, quality analysis, sonarqube, 
               integration test, test reports, container scanning

Binary authorization allows you to enforce deploying only 
trusted containers into GKE



Terraform



Choosing GCP storage solutions
- use case, durability, scalability, cost
- binary data with Cloud Storage
- relational data with Cloud SQL and Spanner
- store NoSQL data using Firestore and Cloud Bigtable
- Cache data for fast access using Memorystore
- aggregate data for queries and reports using BigQuery as a data Warehouse


Releational: Cloud SQL, Cloud Spanner
NoSQL:   Firestore, Cloud Bigtable
Object:  Cloud Storage
Warehouse: BigQuery
InMemory: MemoryStore

        Persistent Disk


scale horizontally:   Bigtable, Spanner
scale vertically:    Cloud SQL, Memorystore
scale auomatically  : Cloud storage, BigQuery, Firestore
with no limits 



Strong Consistency
- databases update all copies of data within a transaction
- ensures everyone gets latest copy of data on reads
- storage, cloud sql, spanner, firestore

Eventually Consistent
- databases update one copy of data and rest asynchronously
- can handle a large volume of writes
- bigtable, memorystore replicas


Calculate total cost per GB


Storage and database decision chart

Is your data structured?
no : Do you need a shared file system?
     yes : filestore
     no  : cloud storage
yes: Is your workload analytics?
     yes : Do you need updates or low latency?
           no  :  BigQuery
           yes :  Cloud Bigtable
     no  : Is your data relational?
           no  :  Firestore
           yes :  Do you need horizontal scalability?
                  no  :  Cloud SQL
                  yes :  Cloud Spanner




Cloud Storage Transfer Service
Transfer Appliance
Transfer service for BigQuery






Google Cloud and Hybrid Network Architecture
- design VPC networks to optimize for cost, security and performance
- global and regional load balancers to provide access to services
- leverage cloud CDN to provide lower latency and decrease network egress
- evaluate network architecture using Netwok Intelligence Center
- connect networks using peering, VPNs and Cloud Interconnect



In Google cloud, VPC networks are global
- single project can have multiple networks
- create subnets for regions you want to operate in when creating networks
- resources across regions can reach each other without any added interconnect
- regions around world can be chosen for global company
- choose closest region and a backup region if users are close together


When creating subnets, specify region and interal IP address range
- machines in same VPC can communicate via their interal IP
- ip aliasing or secondary range can be set on the subnet
  address regardless of the subnet region
- subnets don't need to be derived from a single CIDR block
- ip address ranges cannot overlap
- subnets are expandable without downtime



Single VM can have multiple network interfaces connecting to different networks
- each network must have a subnet in region the VM is created in
- each interface must be attached to a different VPC
- maximum of 8 interfaces per VM

Shared VPC created in one project, can be shared and used by other projects
- requires an organization
- create VPC in host project
- shared VPC admin shares VPC with other service projects

Allows centralized control over network configuration
- network admins configure subnets, firewall rules, routes etc
- remove network admin rights from developers
- disable creation of default network using organizational policy
- devlopers can focus on machine creation and configuration in shared network


Designing Google Cloud Load balancer
- Global load balancing supported by HTTP load balancer and TCP and SSL proxies
- HTTP load balancer routes requests to region closest to the user using global, anycast IP address
Regional load balancer can be used to provide access to services deployed in single region
- Supported by HTTP, TCP and UDP load balancers
- Can have a public or private IP address
- Can use any TCP or UDP port
If load balancers have public IPs, secure them using SSL
- supported by HTTP and TCP load balancers
- self-managed and google-managed SSL certificates
Leverage Cloud CDN, for lower-latency and decreased egress cost
- can be enabled when configuring the HTTP global load balancer
- caches static ontent worldwide using Google Cloud edge-caching locations
- Cache static data from web servers in compute engine instances, gke pod, cloud storage buckets


GCP load balancer types
- HTTP load balancing
  layer 7 load balancing for HTTP and HTTPS applications
  Configure    HTTP LB, HTTPS LB
  Options      Internet facing or internal single or multi-region
- TCP load balancing
  layer 4 load balancing or proxy for applications that rely on TCP/SSL protocol
  Configure    TCP LB, SSL Proxy, TCP Proxy
  Options      Internet facing or internal Single or multi-region
- UDP load balancing
  layer 4 load balancing for applications that rely on UDP protocol
  Configure    UDP LB
  Options      Internet facing or internal Single-region


http LB: search, analytics, web UI
tcp LB:  inventory, orders


Network Intelligence Center 


VPC peering can used to connect networks when they are both in google cloud
Cloud VPN securely connects your on-premises network to Google Cloud VPC network
HA VPN to peer VPN gateway
HA VPN to AWS peer gateway
HA VPN to peer VPN gateway
Cloud Router enables dynamic discovery of routes between connected networks BGP (Border Gateway Protocol)
Cloud Interconnect when a dedicated high-speed connection is required b/w networks
Dedicated Interconnect provides direct physical connection
Partner Interconnect provides connectivity through a supported service provider



Managed instance grous create VMs based on instance templates
Use one or more instance groups as backend for load balancers


  
Desingning Reliable Systems
- avialiablity, durability, scalability
- fault tolerant systems by avoiding single point of failure, correlated failures and cascading failures
- circuit breakers and exponential backoff design patters to avoid overload failures
- resilient data storage with lazy deletion
- design for normal operational state, degraded operational state, and failure scenarios
- plan, implement, test/simulate for disaster recovery and analyze disaster scenarios


Availability: percent of time system is running
              - achieved with fault tolerance
              - create backup systems
              - use health checks
              - use mertics to count real traffic success and failure
Durability:   odds of losing data because of hardware or system failure
              - achieved by replicating data in multiple zones
              - taking regular backups
              - practice restoring from backups
Scalability:  ability of system to work as user load and data grow
              - monitor usage
              - capacity autoscaling to add and remove servers in response to change in load

To avoid single points of failure
- N+2L: Plan to have one unit out for upgrade or testing and survive another failing
- make units interchangeable stateless clones
- not make any single unit too large
- each unit should be able to handle extra load


To avoid correlated failure
- divide business logic into services based on failure domains
- deploy to multiple zones and or regions
- split responisbility into components and spread over multiple processes
- desingning independent, loosely coupled but collaborating services
- decouple servers and use microservics distributed among multiple failure domains
- health checks in compute engine or readiness and liveness probe in k8s
  to detect and the repair unhealthy instances
- new servers should start fast and ideally not rely on other backend systems to start up
- prevent query of death oveload, where logic error shows up as overconsumption
  of resources and the service overloads, monitor query performance and notify
  developers if there are any issues
- prevent potential for overload while icreasing reliability by adding retries
  Positive feedback cycle overload failure
  Truncated Exponential backoff pattern to avoid positive feedback overload at the client
  Ciruit Breaker pattern to protect service from too many retries
  In gke, u can leverage istio to automatically implement circuit breakers
  Use lazy deletion to reliably recover when users delete data by mistake
- High availability can be achieved by deploying to multiple zones in a region
  deploy multiple servers
  Orchestrate servers with a regional managed instance group
  Create failover database in another zone or use distributed database like firestore or spanner
  Regional managed instance groups distribute VMs across zones in the region specified
  Kubernets cluster can be deployed to single or multiple zones
  Selecting regional location type in k8s replicates node pools in multiple zones in that region
  Create health check when creating instance groups to enable auto healing
    - create test endpoint in the service
    - test endpoint needs to verify service is up and also that it can communicate
      with dependent backend database and services
    - if health check fails, instance group will create new server and delete broken one
    - load balancers use health checks to ensure they send requests only to healthy instances
  Use multi-region storage buckets for high availability if latency impact is negligible
  If using Cloud SQL, create a failover replica for high availability
  Spanner and Firestore can be deployed in 1 or mutliple regions
  Deploying for high availability increases cost, do a risk/cost analysis
  Disaster recovery strategy: Cold standby
    - create snapshots, machine images and data backups in multi-region storage
    - if main region fails, spin up servers in backup region
    - route requests to new region
    - document and test recovery procedure regularly
  Disaster recovery strategy: Hot standby
    - create instance groups in multiple regions
    - use global load balancer
    - store unstructured data in multi-region buckets
    - for structrued data, use multi-region database such as spanner or firestore
  During disaster planning, consider scenarios that cause data loss and/or service failure
  Formulate a plan to recover based on your disaster scenarios
  Preparing the team for disasters by using drills by planning and periodic practice



Security
- best practices: separation of concerns, principle of least privilege, regular audits
- Google's Security Command Center to identify vulenrabilities
- Organizational policies for cloud governance
- authenticate and authorize users with IAM roles, Identity-Aware Proxy, Identity platform
- Service accounts to manage access and authorization of resources by machines and processes
- secure networks with private IPs, firewalls, and Google Cloud private access
- mitigate DDoS attacks by leveraging Cloud DNS and Google Cloud Armor



Maintenance and Moitoring
- manage new service version using rolling updates, blue/green deployments and canary releases
- forcast, monitor and optimize sevice cost using Google cloud prizing calculator and
  billing reports and by analyzing billing data
- observe whether services are meeting their SLOs using Cloud Monitoring and Dashboard
- use uptime checks to determine service availability
- respond to service outage using cloud monitoring alerts


In Microservices, make sure not to break clients when services are updated
- include version in URI
- if you deploy a breaking change, you need to change the version
- need to deploy new versions with zero downtime
- need to effectively test version prior to going live


Rolling updates
- available as a feature of instance groups, just need to change instance template
- rolling updates are default in kubernetes, just need to change docker image
- its completely automated in App engine

Blue/Green deployment
- in compute engine, use DNS to migrate requests from one load balancer to another
- in kubernetes, configure your service to route to new pods using labels 
- use traffic splitting feature in App engine


Canary can be used before rolling update to reduce risk
- in compute engine, create a new instance group and add as additional backend in load balancer 
- in k8s, create new pod with same label as existing pods,
  the service will automatically route a portion of request to it
- use traffic splitting feature in App engine




Cost Planning

Capacity planning is a continous, iterative cycle
- forecast
- allocate
- approve
- deploy
Optimizing cost of compute
- start with small VMs
- use small machines with auto scaling turned on
- make use of discounts
- use some preemptible instances 80% discount
- use auto healing to recreate VMs when they are preempted
- Google cloud rightsizng recommendations will
  alert you when VMs are underutilized
Optimizing cost of disk
- dont over-allocate disk space
- depnding on I/O requirements, consider Standard over SSD disks
- determine performance characteristics of your app
  I/O pattern: small reads and writes or large reads and writes
  Configure your instances to optimize storage performance
Optimizing network costs
- keep machins close to your data
- egress within same zone is free
- egress between zones in same region
- egress between regions
- internet egress
- intercontinental egress
Use GKE usage metering to prevent over provisioning clusters
- compares requested resources with consumed resources
Use alternative services to save cost instead of allocating more resources
- CDN
- Caching
- Messaging
- Queueing etc..
Google Cloud Pricing Calculator
Billing reports
Export billing data to BigQuery for advanced cost analysis
Visualize spend with Google Data Studio
Setup budgets and alerts
- progrmmatic budgets: Cloud Pub/Sub -> Cloud Functions
Monitoring Dashboards
- monitoring
- loggin
- trace
- debugger
- error reporting
- profiler
Monitor key metrics
- CPU use
- storage capacity
- reads and writes
- network egress etc
- SLI  (determing whether you are meeting your SLOs)
- availability
- latency



Monitoring and Observability in Google Cloud
- gcp monitoring tools
- operations based tools
- application performance management tools



Compute signals
- metrics
- logs
- trace
Visualize and Analyze
- dashboards
- metrics explorer
- logs explorer
- service monitoring
- health checks
- debugger
- profiler
Manage Incidents
- alerts
- error reporting
- SLO


Debugger
Trace
Profiler ( production cpu and heap profiling )


Four Golden Signals
- SLIs, SLOs, SLAs
- choosing a good SLI
- specifying SLIs
- developing SLOs and SLIs



Monitoring
- product
- development
- capacity planning
- testing and release procedures
- postmortem / root cause analysis
- incident response
- monitoring ( urgent attention, trends, planning, improvements )



```

[https://sre.google/books/](https://sre.google/books/)  


[https://sre.google/workbook/alerting-on-slos/](https://sre.google/workbook/alerting-on-slos/)  


[https://cloud.google.com/monitoring/alerts/policies-in-json](https://cloud.google.com/monitoring/alerts/policies-in-json)  

[https://cloud.google.com/monitoring/alerts/target-configuration-library](https://cloud.google.com/monitoring/alerts/target-configuration-library)  

[https://cloud.google.com/stackdriver/docs/managed-prometheus](https://cloud.google.com/stackdriver/docs/managed-prometheus)  



```


```

Advanced Logging and Analysis
- strategic logging
  - labeling
  - working with logs explorer
  - using logs-based metrics
- exporting and analyzing logs
- error reporting


Monitoring Network Security
- VPC flow logs
- Firewall rules logging
- Cloud NAT logs
- Packet Mirroring
- Network Intelligence Center
Monitoring GCP Audit Logs
- Audit Logs
- Data Access Logging
- Understanding Audit logs
- best practices


Incident Management
Declaring an Incident
Restoring Service
Preventing Recurrence


Postmortem Repost
- blameless report
- impact
- triggering event
- resolution
- quantifiable metrics
- action items
- lessons learned
- timeline


Always write a Postmortem Report
- anytime an SLO is breached
- when an incident required emergency on-call response from another team
- when an impacted team requests a follow-up communication
- a draft report should be published within X hours of incident resolution
- report should be completed within Y business days

Standard Documentation
- use public postmortem templates
- document the entire troubleshooting process
- include any policy changes that should be made
- include a review of incident response itself
- never stop learning



Investigating Application Performance Issues
- Debugger  ( debug production code to correct code defects )
- Trace  ( trace latency to see throgh layers of service interaction to eliminate performance bottlenecks )
- Profiler ( profile and identify resource intensive functions in an application )



Profile Type
- cpu time
- heap
- allocated heap
- contention
- threads
- wall time


Optimizing the cost of Monitoring
- cost of monitoring
- bill estimation
- cost control best practices




Google Kubernetes Engine

- kubernetes concepts
- kubernetes components
- gke concepts
- object management
- migrate for Anthos


Kubernets Control Plane
- kube APIserver
- etcd
- kube scheduler
- kube cloud manager
- kube controller manager
- kubelet
- kube-proxy
- node


GKE concepts
- node pools
- control plane
- zonal versus regional clusters
- zonal or regional gke cluster can be set up as a private cluster


Kubernetes Object management
- namespaces ( default, kube-system, kube-public )
- deployments, statefulsets, daemonset, jobs



Migrate for Anthos moves VMs to containers
- move and convert workloads into containers
- workloads can start as physical servers or VMs
- moves workload compute to container immediately (<10 min)
- data can be migrated all at once or streamed to cloud until app is live in cloud



Migrate for Anthos architecture
migration is a multi-step process
- configure processing cluster
- add migration source
- generate and review plan
- generate artifacts 
- test
- deploy



Pod Networking
- pod is a group of container with shared storage and networking
- container
- shared networking namespace in pod
- pod
- node networking namespace in node
- VM NIC
- nodes get pod IP addresses from address ranges assigned to your VPC
- VPCs are logically isolated networks that provide connectivity for resources
  you deploy within gcp
- VPC can be composed of many different ip subnets and regions all around the world
- when you deploy gke you can select a VPC along with region or zone
  by default VPC has an IP subnet preallocated for each gcp region in the world
  Ip addresses and subnets are then allocated to the compute instances deployed in that region
- on gcp alias IPs allow you to configure configure additional secondary
  ip addresses on you compute engine virtual machines
  VPC native gke clusters automatically create an alias IP range to reserve 
  approx 4000 ip addresses for cluster wide services, this will mitigate the problem
  of unexpectedly running out of ip addresses which your apps use to talk to one another
  VPC native gke cluster also create a separate alias IP range for your pods
  by default this address uses a /14 block containing over 250000 ip addresses
  Using this gke divides the ip space amongst the nodes /24 blocks each with 250 ip addreses



Kubernetes offers storage abstraction options

Volumes
- are a directory accessible to all conatainers in a pod
- some volumes are ephemeral ( shared pods lifecycle )
  ConfigMap, Secret, downwardAPI ( makes data about pods data available to containers )
  emptyDir ( is removed on pod removal, data in emptyDir volume is safe across container crashes ) 
- some volumes are persistent

# creating a pod with an emptyDir volume
apiVersion: v1
kind: Pod
metadata:
  name: web
spec:
  containers:
  - name: web
    image: nginx
    volumeMounts:
    - mountPath: /cache
      name: cache-volume
  volumes:
  - name: cache-volume
    emptyDir: {}
    

PersistentVolumes
- manage durable storage in a cluster
- are independent of pods lifecycle
- provision dynamically through PersistentVolumeClaims
  or explicitly created by a cluster admin





```


Data Engineer Professional


```


Data Driven Decision Making
- product recommendation using cloud sql and spark
- demand forecasting using BigQuery ML
- real-time IOT dashboards with pub/sub, dataflow, data studio
- text and image classification using ML APIs, AutoML, DialogFlow


Big data challenges
- migrating existing data workloads
- analyzing datasets at scale
- building streaming data pipelines
- applying ml to your data


Moores Law
ASICs (Application Specific Integrated Circuits)



TPUs enable faster models and more iterations
ebay used Cloud TPU Pods to train image recognition model
Google saved data center cooling energy by 40%
Google improved power usage effectiveness (PUE) by 15%

	


Standard storage
Nearline storage
Coldline storage
Archive storage



Autoscale streaming pipelines with Cloud Dataflow


Recommending Products
- Recommendation systems must scale to meet demand
- If you like X you also like Y
- recommendation systems require data, model, training/serving infrstructure
- ex: RankBrain (ML for search ranking) 
- ex: recommending housing rental options
- model is based on 2 things, your rating for other houses 
  and other peoples rating of the particular house
  Look at all the people who rated the house, and find 3 users in 
  that list who are most like you ( with same age, same country, same college, etc )
  Who is this user like?
  Is this house similar to houses that people similar to this user like?
  Predicted rating = users preference * item-quality
  How often you need to compute predicted ratings?
  Where to save this ratings?
  Stream vs Batch processing
  Compute the ratings once per day
  Compute ratings quickly using a Hadoop cluster
  Store the computed ratings, users, and houses in Cloud SQL
  DataProc Spark Hadoop
  Lauch DataProc
  Train and apply ML models in PySpark to create product recommendations
  Explore inserted rows in Cloud SQL
  
- Cloud Dataproc Autoscaling provides flexible character
  Primary Nodes    standard VMs
  Primary Workers  standard VMs
  Secondary Workers  Preemptible VMs
  HDFS     HDDs and SSDs
  Persistent storage    Cluster bucket (HDFS connector, Cloud storage), 
     Tables (HBase connector, Cloud Bigtable) , Data warehouse (BiqQuery connnectory, BigQuery)
  Off-cluster storage with Google Cloud Storage




BigQuery
- fast sql query engine
- managed storage for datasets 
- creating ML models with SQL
- petabyte-scale fully managed data warehouse
- serverless
- flexible pricing model
- data encyption and security
- geospatial data types and fuctions
- foundation for BI and AI
- Typical BiqQuery data warehouse architecture
  
  real-time-events -> authentication game server -> asynchronous messaging -> steaming pipeline
                      App engine                      Cloud Pub/Sub              |
                                                                                 |
                                                                                       batch
  batch load  ->  raw log storage  -> batch pipeline ->              Cloud Dataflow   --->    Bigquery
                   cloud storage                           Parallel Data Processing    streaming


- ex: predict visitor purchases using bigquery ML

- ex: query 2 billion lines of code in less than 30 seconds
      Analyze if its famous to use tabs or spaces in code
      Parsing and processing each and every line


- BigQuery Storage service
  Bulk data ingest
  Streaming data ingest

- BigQuery Query service
  query submitted by:
  Web UI, bq, REST api

- bigquery public datasets
  https://cloud.google.com/bigquery/public-data

- end-to-end bigqueryML project
  Writing code to create the actual model is the easiest part
  Getting all the required data into the model is the hard part
  ETL into BigQuery
  Preprocess Features ( explore, join, create train/test tables )
  Create the model inside BigQuery
  CREATE MODEL
  rental.classification
  OPTIONS
    (
  model_type='logistic_req',
  input_label_cols = ['buy'] ) AS
  data
     # sql query with training data
  Run the model on running the query, resulting in a dataset object in bigQuery
  Evaluate the performance of your trained model against evaluation dataset
  SELECT
    house,rating,pecision,accuracy,recall
  FROM
    ML.EVALUATE(MODEL rental.classification
     # sql query with eval data 
  Predict once you are happy with models performance
  SELECT * FROM
    ML.PREDICT	
  (MODEL rental.classification, 
  (
     # sql query with test data

- BigQuery ML Cheatsheet
  label
  feature
  model
  model types
  training progress
  inspect weights
  evaluation
  prediction

  https://cloud.google.com/blog/topics/developers-practitioners/query-big-bigquery-cheat-sheet




Real-time IoT dashboard with Pub/Sub, Dataflow and Data Studio
- message oriented architectures
- serverless data pipelines
  designing streaming pipelines with Apache Beam
  implementing streaming pipelines on Cloud Dataflow
- Distributed Messaging with Pub/Sub
  at least once delivery
  no provisioning, auto everything
  open APIs
  global by default
  end-to-end encryption
  decoupled sources
  decoupled workers
  reliable delivery
  topics
- Pipeline design with Apache Beam
  advanced unified & portable data processing programming model
  Cloud dataflow is one popular choice for running Apache Beam
  Dataflow offers NoOps data pipelines
  input -> read -> filter 1 -> group 1 -> filter 2 -> transform 1 -> write -> output
  Same code can be used for real-time and batch
- implementing streaming pipelines on Cloud Dataflow
  Dataflow does ingest, transform and load
  Apache Beam submit job,  Cloud Dataflow execute job

  https://github.com/GoogleCloudPlatform/DataflowTemplates

- setup steaming Rentit topic in Pub/Sub
  create a dataflow job from template
  stream and monitor pipeline in bigQuery
  analyze results and create views
  visualize key metrics in data studio


Deriving data from unstructured data using ML
- pre-built AI building blocks
- pre-built AI to create a chatbot
- customize pre-build models with autoML
- building a custom model
- ex: text classification can be done in three ways

 

Component of a Data Engineering ecosystem
- Data sources
- Data sinks
  - Central Data Lake repository
  - Data Warehouse
- Data pipelines ( batch and streaming )
- high-level orchestration workflows





Modernizing Data Lakes and Data Warehouse with GCP

Building a Data Lake
- Data lake: a scalable & secure data platform that allows enterprises to 
  ingest, store, process and analyze any type or volume of information
- data storage and ETL options on GCP
- building a data lake using Cloud Storage
- securing cloud storage
- storing all sorts of data types
- cloud SQL as a relational Data lake


 
 
  
Storage
- cloud storage
- cloud sql
- cloud spanner
- cloud datastore
- cloud bigtable

Ingestion
- compute egine
- kuberenetes engine
- cloud dataflow
- cloud composer
- cloud pub/sub
- cloud functions

Analytics
- BigQuery
- Cloud Dataproc
- AI platform notebooks

Machine learning
- Cloud TPU
- AI platform
- Tensorflow
- Cloud AutoML
- ML APIs

Serving
- Data Studio Dashboards/BI
- Dialogflow
- App engine


Data Lake vs  Data Warehouse
data lake
- retain all data in its native format
- support all data types and all users
- adapt to changes easily
- tends to be application-specific
data warehouse
- loaded only when its use is defined
- processed/organized/transformed
- provide faster insights
- current/historical data for reporting
- tends to have consistent schema shared
  across applications



Steps
- bringing in the raw data
- transform raw materials inta a useful form
- making the ml model using the clean data
- orchestrator governs all aspects of workflow ( workflow orchestration )
  apache airflow running on a cloud composer environment

 
Building a Data Lake using Cloud Storage
- persistence
- durability
- strong consistency
- availability
- high throughput
- single global namespace simplifies locating buckets and objects
- location to control latency
- long object names simulate structure
- cloud storage simulates a file system

Modern serverless data management architecture

                   asynchronous messaging   prallel data processing             Analytics    interactive data exploration
real-time events   Cloud pub/sub             cloud     streaming pipeline     Bigquery       AI platform notebooks
and IoT devices                             dataflow   batch pipeline


Batch load         cloud storage             cloud bigtable                  cloud dataproc
                                            noSql database                managed spark and hadoop





Building  a Modern Data warehouse
- gigabytes to petabytes
- serverless and no-op, including ad hoc queries
- ecosystem of visualization and reporting tools
- ecosystem of etl and data processing tools
- up to the minute data
- machine learning
- security and collaboration
- query 10 billion rows of wikipedia data on bigquery

BigQuery
- bigquery orginizes data tables into units called datasets
- project.dataset.table
- biquery datasets belong to a project
- bigquery provides predefined roles for controlling access to resources
  views add another degree of access control
- use query validator with pricing calculator for estimates
- you can separate cost of storage and cost of queries
- bigquery data transfer service


Batch load supports different file formats
- CSV
- NEWLINE_DELIMITED_JSON
- AVRO
- DATASTORE_BACKUP
- PARQUET
- ORC

https://github.com/GoogleCloudPlatform/bigquery-utils



Designing schemas that scale is a core job of data engineers
- normalize for efficiency in transactional database
  ( only if table has < 1M rows or 10 GB )
  https://www.guru99.com/database-normalization.html

- denormalize before loading into a data warehouse
  data must first be normalized befor it can be denormalized
  Denormalizing is the strategy of allowing duplicat field values for coloumn
  and in a table in a data to gain processing performance
  Denormalization is an increase in the orderliness of data
  Data is repeated rather than being relational
  Denormalized flattened data
  Flattened data takes more storage, but flattened non relational organization
  makes queries more efficient, because it can be processed in parallel using
  coloumnar processing
  Denormalizing data enables bigquery to distribute processing among slots,
  resulting in more parallel processing and query performance
  Grouping on a 1-to-many field in flattened data can cause shuffling of data
  over the network
  Nested and repeated coloumns improve the efficiency of bigqery
  with relational source data

  https://cloud.google.com/bigquery/docs/best-practices-performance-nested

  Querying a Bitcoin dataset in BigQuery with nested and repeated coloumns

  Nested and Repeated Fields
  ARRAYs and STRUCTs
  Optimizing using Partitioning and Clustering
   
  woking wih JSON and Array Data in BigQuery

  Reduce cost and amount of data read by partitioning your tables
  Bigquery supports three ways of partitioning tables
  Partitioning can improve query cost and performance by reducing data being queried
  Bigquery automatically sorts the data based on values in clustering coloumns
  Partitioned tables
  clustered tables
  Set up clustering at table creation time
  In streaming tables, sorting fails over time, and so Bigquery has to recluster
  Bigquery will automatically recluster your data

  Creating a data-partitioned table
  
  https://github.com/GoogleCloudPlatform/training-data-analyst/blob/master/courses/data-engineering/demos/clustering.md
  https://github.com/GoogleCloudPlatform/training-data-analyst/blob/master/courses/data-engineering/demos/partition.md

- Transforming Batch and Streaming data
  
  incoming data is not usable in its original form
  Data processing
  Cloud Dataproc
  Cloud Dataflow
  data is processed in an intermediate system before its loaded into analytics warehouse
  
  Streaming data processing    Cloud pub/sub, Cloud dataflow, Bigquery
  
  Real-time data is streamed into Bigquery by inserting records into tables via Cloud Dataflow pipeline
  You can also use the BigQuery streaming API directly
  


Purposes of Data Quality processing
- validity
- accuracy
- completeness
- consistency
- uniformity


Building Batch Data Pipelines on GCP
- EL   data are already clean and correct, 
  ELT  transform data on fly using Bigquery views or store into new tables  after EL, 
  ETL 
- executing spark on Dataproc
- leveraging GCP in pipelines
- Dataflow for serverless data processing

- Solving data quality issues using BigQuery operations
  
  Filter to identify and isolate valid data
     anyting that does not comply to the business rules
     filtering out both NULLS and BLANKS
     setup filed data type constraints
     specify fields as NULLABLE or REQUIRED
     check proactively for NULL values
     check and filter for allowable range values sql conditionals     
         CASE WHEN, IF ()
     filter rows   
         WHERE(condition)
     filter aggregations     
         HAVING(condition)
     filter NULLs but leave blanks      
         WHERE field IS NOT NULL
     filter NULLs and blanks        
         WHERE field IS NOT NULL AND field <> ""
     require primary keys/relational constraints in upstream source systems
     Bigquery is an analytics warehouse not your primary operational database
  Detect duplication, enforce uniqueness for cosistency
     duplicate records, concurrency issues
     store one fact in one location and use IDs for lookup
     use string functions to clean data 
         PARSE_DATE()
         SUBSTR()
         REPLACE()
     a difference means there are duplicates
         COUNT (DISTINCT field)
         COUNT (field)
     >1 indicates duplicates
         COUNT (field)
         GROUP BY (field)
  Test data against known good values for accuracy
     Lookup issues, Datasets do not exist
     data do not conform to an objective true value
     create test cases or calculated fields to check values
          (ordered_volume * price)AS total_cost
     lookup values against an objective reference dataset
          IN() with a subquery or JOIN
  Identify and fill in missing values for completeness
     missing data, fail to create, save and store whole datasets
     explore existing dataset shape and skew and look for missing values
          NULLIF(), IFNULL, COALESCE
     enrich existing dataset with others using UNIONs and JOINs
          UNIO, JOIN
     verify file integrity with checksum values (hash, MD5)
     Backfilling: automatic process of detecting data drops and 
                  requesting data items to fill in gaps
  Make data types and formats explicit for uniformity
     exploring and presenting data is misleading, same units of measurments
     use FORMAT() to clearly indicate units
     CAST() data types to same format and digits
     label all visulalizations appropriately
     comment and document your approach
         

  
Using ETL to solve data quality issues
- transformations that cannot be expressed in SQL or too complex to do in SQL
  then you will have to tranform it before loading it into bigquery
- build ETL pipelines in Dataflow and land the data in Bigquery
- Extract data from pub/sub, google cloud storage, cloud spanner, cloud sql
  Transform data using cloud dataflow
  Have Dataflow pipeline write to Bigquery
- Orchestration     Cloud Composer
- Cloud dataproc is a managed service for batch processing, querying, serving and ML 
- when to look beyond Dataflow and Bigquery
  latency, throughput             dataflow to bigtable
  reusing spark pipelines         cloud dataproc
  need visual pipeline building   cloud data fusion
- Tracking lineage in ETL pipelines can be important
  whered did the data came from 
  the processes it has been through
  its present location and condition

  Lineage: Metadata about the data
  Trust and regulatory compliances
  Labels on datasets, tables, and views can help track data lineage



Spark on Cloud DataProc

- hadoop ecosystem
- running hadoop on cloud dataproc
- using google Cloud Storage instead of HDFS
- optimizing Dataproc







```


# Links  

[https://cloud.google.com/deployment-manager/docs/dm-convert?_ga=2.17739513.-1342917718.1650208535](https://cloud.google.com/deployment-manager/docs/dm-convert?_ga=2.17739513.-1342917718.1650208535)  
[https://cloud.google.com/deployment-manager/docs/fundamentals](https://cloud.google.com/deployment-manager/docs/fundamentals)  
[https://cloud.google.com/deployment-manager/docs](https://cloud.google.com/deployment-manager/docs)  
[https://cloud.google.com/deployment-manager/docs/reference/cloud-foundation-toolkit](https://cloud.google.com/deployment-manager/docs/reference/cloud-foundation-toolkit)  
[https://github.com/googlecodelabs/gcp-marketplace-integrated-saas/](https://github.com/googlecodelabs/gcp-marketplace-integrated-saas/)  
[https://cloud.google.com/marketplace/docs/partners/integrated-saas/backend-integration](https://cloud.google.com/marketplace/docs/partners/integrated-saas/backend-integration)  
[https://cloud.google.com/marketplace/docs/partners/integrated-saas/frontend-integration](https://cloud.google.com/marketplace/docs/partners/integrated-saas/frontend-integration)  
[https://developers.google.com/identity/protocols/oauth2/web-server#handlingresponse](https://developers.google.com/identity/protocols/oauth2/web-server#handlingresponse)  
[https://developers.google.com/identity/protocols/oauth2/web-server#node.js_3](https://developers.google.com/identity/protocols/oauth2/web-server#node.js_3)  
[https://developers.google.com/identity/protocols/oauth2/javascript-implicit-flow](https://developers.google.com/identity/protocols/oauth2/javascript-implicit-flow)  
[Learn to add authentication and identity management to your own apps](https://youtu.be/OkqRTNluXOg)  
[Getting started with Google's Identity platform for web](https://youtu.be/ny92vcpOQFs)  
[Centralize access to your organization’s websites with Identity Aware Proxy (IAP)](https://youtu.be/xM9-FSU5MoY)  
[https://cloud.google.com/iap/docs/enabling-kubernetes-howto](https://cloud.google.com/iap/docs/enabling-kubernetes-howto)  
[Centralize access to your organization’s websites with Identity Aware Proxy (IAP)](https://youtu.be/xM9-FSU5MoY)  
[Hosting a REST API with a Cloud Firestore backend](https://youtu.be/M53VqNtioxE)  
[Differences between Identity Platform and Firebase Authentication](https://cloud.google.com/identity-platform/docs/product-comparison)  
[Sign in a user with an email by using Identity Platform](https://cloud.google.com/identity-platform/docs/sign-in-user-email)  
[https://www.freecodecamp.org/news/react-firebase-authentication-and-crud-operations/](https://www.freecodecamp.org/news/react-firebase-authentication-and-crud-operations/)  
[How to Build a Role-based API with Firebase Authentication](https://www.toptal.com/firebase/role-based-firebase-authentication)  
[https://stackoverflow.com/questions/42854865/what-is-the-difference-between-cloud-functions-and-firebase-functions](https://stackoverflow.com/questions/42854865/what-is-the-difference-between-cloud-functions-and-firebase-functions)  
[https://github.com/firebase/firebase-functions](https://github.com/firebase/firebase-functions)  
[https://firebase.google.com/docs/functions/](https://firebase.google.com/docs/functions/)  
[https://cloud.google.com/functions/](https://cloud.google.com/functions/)  
[Easy Serverless Deployment Of Your React App Using Cloud Run](https://levelup.gitconnected.com/easy-serverless-deployment-of-your-react-app-using-cloud-run-c26aa79af491)  
[https://github.com/Abszissex/medium-react-cloud-run](https://github.com/Abszissex/medium-react-cloud-run)  
[https://stackoverflow.com/questions/58379122/react-on-google-cloud-how-to-authenticate-users-with-google-email-address](https://stackoverflow.com/questions/58379122/react-on-google-cloud-how-to-authenticate-users-with-google-email-address)  
[https://cloud.google.com/appengine/docs/standard/python/oauth](https://cloud.google.com/appengine/docs/standard/python/oauth)  
[Learn to add authentication and identity management to your own apps](https://youtu.be/OkqRTNluXOg)  
[https://cloud.google.com/anthos/docs/concepts/overview](https://cloud.google.com/anthos/docs/concepts/overview)  
[https://cloud.google.com/identity-platform/docs/concepts](https://cloud.google.com/identity-platform/docs/concepts)  
[https://firebase.google.com/docs/firestore/solutions/role-based-access](https://firebase.google.com/docs/firestore/solutions/role-based-access)  
[Google Cloud Functions Tutorial: HTTP & API Gateway & Pub/Sub Triggers + Authentication & Serverless](https://youtu.be/LAcErtGU-VU)  
[https://medium.com/mdblog/creating-a-serverless-rest-api-with-gcp-32cc62188a03](https://medium.com/mdblog/creating-a-serverless-rest-api-with-gcp-32cc62188a03)  
[https://cloud.google.com/api-gateway](https://cloud.google.com/api-gateway)  
[https://cloud.google.com/api-gateway/docs](https://cloud.google.com/api-gateway/docs)  
[https://www.oreilly.com/content/serverless-on-google-with-cloud-functions-and-react/](https://www.oreilly.com/content/serverless-on-google-with-cloud-functions-and-react/)  
[https://github.com/odewahn/cloud-functions-with-react](https://github.com/odewahn/cloud-functions-with-react)  
[https://cloud.google.com/blog/products/serverless/build-restful-apis-on-serverless-platforms-like-cloud-run](https://cloud.google.com/blog/products/serverless/build-restful-apis-on-serverless-platforms-like-cloud-run)  
[https://towardsdatascience.com/understand-and-compare-cloud-functions-vs-cloud-run-5afc2beb2fb](https://towardsdatascience.com/understand-and-compare-cloud-functions-vs-cloud-run-5afc2beb2fb)  
[https://towardsdatascience.com/building-a-microservice-with-google-cloud-run-90f8df9682da](https://towardsdatascience.com/building-a-microservice-with-google-cloud-run-90f8df9682da)  
[https://towardsdatascience.com/introduction-to-kafka-stream-processing-in-python-e30d34bf3a12](https://towardsdatascience.com/introduction-to-kafka-stream-processing-in-python-e30d34bf3a12)  
[https://cloud.google.com/blog/topics/developers-practitioners/cloud-run-story-serverless-containers](https://cloud.google.com/blog/topics/developers-practitioners/cloud-run-story-serverless-containers)  
[https://cloud.google.com/sdk/docs/initializing](https://cloud.google.com/sdk/docs/initializing)  
[https://www.pingidentity.com/en/resources/content-library/articles/openid-connect.html](https://www.pingidentity.com/en/resources/content-library/articles/openid-connect.html)  
[https://dev.to/pcraig3/cloud-run-vs-app-engine-a-head-to-head-comparison-using-facts-and-science-1225](https://dev.to/pcraig3/cloud-run-vs-app-engine-a-head-to-head-comparison-using-facts-and-science-1225)  
[https://cloud.google.com/run/docs/quickstarts](https://cloud.google.com/run/docs/quickstarts)  
[https://cloud.google.com/run/docs/quickstarts#containerizing](https://cloud.google.com/run/docs/quickstarts#containerizing)  
[https://cloud.google.com/appengine/docs/standard/nodejs/create-app](https://cloud.google.com/appengine/docs/standard/nodejs/create-app)  
[https://firebase.google.com/docs/functions/use-cases](https://firebase.google.com/docs/functions/use-cases)  
[https://firebase.google.com/docs/functions/auth-events](https://firebase.google.com/docs/functions/auth-events)  
[How to set up a scalable and secure application in GCP using CloudRun, API Gateway, and Firebase](https://www.padok.fr/en/blog/setup-application-gcp)  
[Deploy a Serverless React App to Google Cloud Run](https://youtu.be/82Z_VrazXcs)  
[https://stackoverflow.com/questions/48255622/how-to-create-different-user-groups-in-firebase](https://stackoverflow.com/questions/48255622/how-to-create-different-user-groups-in-firebase)  
[https://firebase.google.com/docs/auth/admin/custom-claims#defining_roles_via_backend_script](https://firebase.google.com/docs/auth/admin/custom-claims#defining_roles_via_backend_script)  
[https://firebase.google.com/docs/auth/admin/custom-claims#access_custom_claims_on_the_client](https://firebase.google.com/docs/auth/admin/custom-claims#access_custom_claims_on_the_client)  
[https://firebase.google.com/docs/database/](https://firebase.google.com/docs/database/)  
[https://firebase.google.com/docs/firestore/](https://firebase.google.com/docs/firestore/)  
[https://firebase.google.com/docs/storage/](https://firebase.google.com/docs/storage/)  
[https://firebase.google.com/docs/database/rtdb-vs-firestore](https://firebase.google.com/docs/database/rtdb-vs-firestore)  
[Controlling Data Access Using Firebase Auth Custom Claims Firecasts](https://youtu.be/3hj_r_N0qMs) 
[User Groups in Firebase WEB](https://youtu.be/vy8jn-9yyt4)    
[https://towardsdatascience.com/deploy-cloud-functions-on-gcp-with-terraform-111a1c4a9a88](https://towardsdatascience.com/deploy-cloud-functions-on-gcp-with-terraform-111a1c4a9a88)  
[https://cloud.google.com/blog/products/serverless/google-cloud-api-gateway-is-now-available-in-public-beta](https://cloud.google.com/blog/products/serverless/google-cloud-api-gateway-is-now-available-in-public-beta)  
[https://medium.com/swlh/manage-serverless-apis-with-api-gateway-in-gcp-b7f906efec1a](https://medium.com/swlh/manage-serverless-apis-with-api-gateway-in-gcp-b7f906efec1a)  
[https://codelabs.developers.google.com/codelabs/user-auth-with-iap#0](https://codelabs.developers.google.com/codelabs/user-auth-with-iap#0)  
[https://medium.com/google-cloud/what-is-beyondcorp-what-is-identity-aware-proxy-de525d9b3f90](https://medium.com/google-cloud/what-is-beyondcorp-what-is-identity-aware-proxy-de525d9b3f90)  
[https://medium.com/swlh/secure-apis-in-cloud-run-cloud-functions-and-app-engine-using-cloud-endpoints-espv2-beta-b51b1c213aea](https://medium.com/swlh/secure-apis-in-cloud-run-cloud-functions-and-app-engine-using-cloud-endpoints-espv2-beta-b51b1c213aea)  
[https://cloud.google.com/identity-platform/docs/multi-tenancy-ui](https://cloud.google.com/identity-platform/docs/multi-tenancy-ui)  
[https://cloud.google.com/iap/docs/enabling-cloud-run](https://cloud.google.com/iap/docs/enabling-cloud-run)  
[https://cloud.google.com/iap/docs/identity-howto](https://cloud.google.com/iap/docs/identity-howto)  
[https://medium.com/trillo-platform/google-identity-platform-for-building-a-custom-user-management-application-55a0f9012951](https://medium.com/trillo-platform/google-identity-platform-for-building-a-custom-user-management-application-55a0f9012951)  
[https://stackoverflow.com/questions/62736151/google-identity-platform-authentication-inside-cloud-functions](https://stackoverflow.com/questions/62736151/google-identity-platform-authentication-inside-cloud-functions)  
[https://medium.com/tech-tajawal/microservice-authentication-and-authorization-solutions-e0e5e74b248a](https://medium.com/tech-tajawal/microservice-authentication-and-authorization-solutions-e0e5e74b248a)  
[Authentication and Authorization in a Microservice Architecture | OAuth 2.0 | JWT](https://youtu.be/Rn8ts-3eayc)  
[Google Cloud Functions Tutorial: HTTP & API Gateway & Pub/Sub Triggers + Authentication & Serverless](https://youtu.be/LAcErtGU-VU)  
[https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-google-cloud-platform](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-google-cloud-platform)  
[https://medium.com/google-cloud/authenticating-using-google-openid-connect-tokens-e7675051213b](https://medium.com/google-cloud/authenticating-using-google-openid-connect-tokens-e7675051213b)  
[https://cloud.google.com/identity-platform/docs/web/oidc](https://cloud.google.com/identity-platform/docs/web/oidc)  
[https://cloud.google.com/anthos/clusters/docs/on-prem/1.6/how-to/oidc](https://cloud.google.com/anthos/clusters/docs/on-prem/1.6/how-to/oidc)  
[https://github.com/terraform-google-modules/terraform-google-github-actions-runners/tree/v3.0.0/modules/gh-oidc](https://github.com/terraform-google-modules/terraform-google-github-actions-runners/tree/v3.0.0/modules/gh-oidc)  
[https://developers.google.com/identity/protocols/oauth2/openid-connect](https://developers.google.com/identity/protocols/oauth2/openid-connect)  
[https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_openid_userinfo](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_openid_userinfo)  
[https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_id_token](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_id_token)  
[How to architect an AI/ML powered Healthcare platform on Google Cloud](https://youtu.be/QjMl9lgcOU0)  
[Using Google Cloud services for clinical trial informatics](https://youtu.be/nI4J6_I7hwg)  
[What is the Cloud Healthcare API?](https://youtu.be/_aZZpAYzoHU)  
[https://cloud.google.com/healthcare-api/docs#docs?utm_source=youtube&utm_medium=unpaidsoc&utm_campaign=CDR_ret_gcp__azzpayzohu_HealthcareSolutionsSpotlight_061421&utm_content=description](https://cloud.google.com/healthcare-api/docs#docs?utm_source=youtube&utm_medium=unpaidsoc&utm_campaign=CDR_ret_gcp__azzpayzohu_HealthcareSolutionsSpotlight_061421&utm_content=description)  
[Understanding the Healthcare Data Engine](https://youtu.be/cFyWUraZh9I)  
[Building Healthcare Solutions Using Google Cloud](https://youtu.be/E5g0qzDVDuE)  
[Cloud Composer](https://youtu.be/bwZOAXnCMf8)  
[Flexible, Easy Data Pipelines on Google Cloud with Cloud Composer Cloud Next '18](https://youtu.be/GeNFEtt-D4k)  
[https://googlecloudcheatsheet.withgoogle.com/architecture](https://googlecloudcheatsheet.withgoogle.com/architecture)  
[https://cloud.nih.gov/resources/guides/science-at-cloud-providers/science-on-gcp/GCPHealthcareSolutionsPlaybook.pdf](https://cloud.nih.gov/resources/guides/science-at-cloud-providers/science-on-gcp/GCPHealthcareSolutionsPlaybook.pdf)  
[Creating Bucket on GCP | Cloud Storage | Google Cloud | MLAIT](https://youtu.be/sIni4YO6rnY)  





[https://cloud.google.com/binary-authorization/docs/getting-started-cli](https://cloud.google.com/binary-authorization/docs/getting-started-cli)  
[https://zero-to-jupyterhub.readthedocs.io/en/latest/kubernetes/google/step-zero-gcp.html](https://zero-to-jupyterhub.readthedocs.io/en/latest/kubernetes/google/step-zero-gcp.html)  
[https://cloud.google.com/compute/vm-instance-pricing](https://cloud.google.com/compute/vm-instance-pricing)  
[https://cloud.google.com/kubernetes-engine/pricing/](https://cloud.google.com/kubernetes-engine/pricing/)  
[https://cloud.google.com/kubernetes-engine/docs/concepts/types-of-clusters#modes](https://cloud.google.com/kubernetes-engine/docs/concepts/types-of-clusters#modes)  
[https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview)  
[https://cloud.google.com/compute/vm-instance-pricing](https://cloud.google.com/compute/vm-instance-pricing)  
[https://cloud.google.com/kubernetes-engine/docs/how-to/creating-an-autopilot-cluster](https://cloud.google.com/kubernetes-engine/docs/how-to/creating-an-autopilot-cluster)  



[https://cloud.google.com/compute/docs/regions-zones](https://cloud.google.com/compute/docs/regions-zones)  
[https://blog.realkinetic.com/using-google-cloud-service-accounts-on-gke-e0ca4b81b9a2](https://blog.realkinetic.com/using-google-cloud-service-accounts-on-gke-e0ca4b81b9a2)  

[https://pnatraj.medium.com/how-to-run-gcloud-command-line-using-a-service-account-f39043d515b9](https://pnatraj.medium.com/how-to-run-gcloud-command-line-using-a-service-account-f39043d515b9)  


[https://cloud.google.com/kubernetes-engine/docs/deploy-app-cluster](https://cloud.google.com/kubernetes-engine/docs/deploy-app-cluster)  
[https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/](https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/)  



[https://cloud.google.com/architecture/exposing-service-mesh-apps-through-gke-ingress](https://cloud.google.com/architecture/exposing-service-mesh-apps-through-gke-ingress)  


[https://github.com/AckeeCZ/terraform-gke-vpc/blob/master/main.tf](https://github.com/AckeeCZ/terraform-gke-vpc/blob/master/main.tf)  

[https://istio.io/v0.7/docs/setup/kubernetes/quick-start-gke-dm.html](https://istio.io/v0.7/docs/setup/kubernetes/quick-start-gke-dm.html)  



[https://programmaticponderings.com/2017/12/22/deploying-and-configuring-istio-on-google-kubernetes-engine-gke/](https://programmaticponderings.com/2017/12/22/deploying-and-configuring-istio-on-google-kubernetes-engine-gke/)  


[https://istio.io/latest/docs/setup/platform-setup/gke/](https://istio.io/latest/docs/setup/platform-setup/gke/)  





[https://cloud.google.com/service-mesh/docs/onlineboutique-install-kpt](https://cloud.google.com/service-mesh/docs/onlineboutique-install-kpt)  
[https://cloud.google.com/service-mesh/docs/deploy-bookinfo](https://cloud.google.com/service-mesh/docs/deploy-bookinfo)  
[https://cloud.google.com/service-mesh/docs/deploy-demo-telemetry-addons](https://cloud.google.com/service-mesh/docs/deploy-demo-telemetry-addons)  

[https://cloud.google.com/community/tutorials/terraform-asm-in-cluster](https://cloud.google.com/community/tutorials/terraform-asm-in-cluster)  



[https://cloud.google.com/istio/docs/istio-on-gke/adding-gateways](https://cloud.google.com/istio/docs/istio-on-gke/adding-gateways)  


[https://cloud.google.com/blog/products/identity-security/enabling-keyless-authentication-from-github-actions](https://cloud.google.com/blog/products/identity-security/enabling-keyless-authentication-from-github-actions)  


[https://gmusumeci.medium.com/how-to-create-a-service-account-for-terraform-in-gcp-google-cloud-platform-f75a0cf918d1](https://gmusumeci.medium.com/how-to-create-a-service-account-for-terraform-in-gcp-google-cloud-platform-f75a0cf918d1)  

[https://cloud.google.com/blog/products/identity-security/how-to-authenticate-service-accounts-to-help-keep-applications-secure](https://cloud.google.com/blog/products/identity-security/how-to-authenticate-service-accounts-to-help-keep-applications-secure)  


[https://cloud.google.com/deploy/docs/using-skaffold/managing-manifests](https://cloud.google.com/deploy/docs/using-skaffold/managing-manifests)  


[https://stackoverflow.com/questions/52908401/pulling-images-from-gcr-into-gke](https://stackoverflow.com/questions/52908401/pulling-images-from-gcr-into-gke)  


[https://blog.container-solutions.com/using-google-container-registry-with-kubernetes](https://blog.container-solutions.com/using-google-container-registry-with-kubernetes)  
[https://stackoverflow.com/questions/68497046/error-pulling-docker-image-from-gcr-into-gke-failed-to-pull-image-403-forb](https://stackoverflow.com/questions/68497046/error-pulling-docker-image-from-gcr-into-gke-failed-to-pull-image-403-forb)  

[https://cloud.google.com/kubernetes-engine/docs/how-to/hardening-your-cluster](https://cloud.google.com/kubernetes-engine/docs/how-to/hardening-your-cluster)  
[https://ryaneschinger.com/blog/using-google-container-registry-gcr-with-minikube/](https://ryaneschinger.com/blog/using-google-container-registry-gcr-with-minikube/)  



[https://cloud.google.com/deployment-manager/docs/configuration/templates/create-basic-template](https://cloud.google.com/deployment-manager/docs/configuration/templates/create-basic-template)  
[https://github.com/GoogleCloudPlatform/deploymentmanager-samples](https://github.com/GoogleCloudPlatform/deploymentmanager-samples)  

