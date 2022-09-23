
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




```


Data Engineer Professional


```





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

