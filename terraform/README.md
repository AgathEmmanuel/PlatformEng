

# Terraform



[https://cloud.google.com/storage/docs/access-control/create-manage-lists#json-api](https://cloud.google.com/storage/docs/access-control/create-manage-lists#json-api)  



[https://cloud.google.com/sdk/gcloud/reference/container](https://cloud.google.com/sdk/gcloud/reference/container)  
[https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam)  



```
1 	Understand infrastructure as code (IaC) concepts

1a 	Explain what IaC is
1b 	Describe advantages of IaC patterns

2 	Understand Terraform's purpose (vs other IaC)
2a 	Explain multi-cloud and provider-agnostic benefits
2b 	Explain the benefits of state

3 	Understand Terraform basics

3a 	Handle Terraform and provider installation and versioning
3b 	Describe plugin based architecture
3c 	Demonstrate using multiple providers
3d 	Describe how Terraform finds and fetches providers
3e 	Explain when to use and not use provisioners and when to use local-exec or remote-exec

4 	Use the Terraform CLI (outside of core workflow)

4a 	Given a scenario: choose when to use terraform fmt to format code
4b 	Given a scenario: choose when to use terraform taint to taint Terraform resources
4c 	Given a scenario: choose when to use terraform import to import existing infrastructure into your Terraform state
4d 	Given a scenario: choose when to use terraform workspace to create workspaces
4e 	Given a scenario: choose when to use terraform state to view Terraform state
4f 	Given a scenario: choose when to enable verbose logging and what the outcome/value is

5 	Interact with Terraform modules

5a 	Contrast module source options
5b 	Interact with module inputs and outputs
5c 	Describe variable scope within modules/child modules
5d 	Discover modules from the public Terraform Module Registry
5e 	Defining module version

6 	Navigate Terraform workflow

6a 	Describe Terraform workflow ( Write -> Plan -> Create )
6b 	Initialize a Terraform working directory (terraform init)
6c 	Validate a Terraform configuration (terraform validate)
6d 	Generate and review an execution plan for Terraform (terraform plan)
6e 	Execute changes to infrastructure with Terraform (terraform apply)
6f 	Destroy Terraform managed infrastructure (terraform destroy)

7 	Implement and maintain state

7a 	Describe default local backend
7b 	Outline state locking
7c 	Handle backend authentication methods
7d 	Describe remote state storage mechanisms and supported standard backends
7e 	Describe effect of Terraform refresh on state
7f 	Describe backend block in configuration and best practices for partial configurations
7g 	Understand secret management in state files

8 	Read, generate, and modify configuration

8a 	Demonstrate use of variables and outputs
8b 	Describe secure secret injection best practice
8c 	Understand the use of collection and structural types
8d 	Create and differentiate resource and data configuration
8e 	Use resource addressing and resource parameters to connect resources together
8f 	Use Terraform built-in functions to write configuration
8g 	Configure resource using a dynamic block
8h 	Describe built-in dependency management (order of execution based)

9 	Understand Terraform Cloud and Enterprise capabilities

9a 	Describe the benefits of Sentinel, registry, and workspaces
9b 	Differentiate OSS and TFE workspaces
9c 	Summarize features of Terraform Cloud

```













Infra management tool  
Servers  
Networking  
Storage  
  
Infra defined as code  
  
  
Terraform is not for config management  
  
Designing with config management not needed approach  
  
Packer  
Immutable infrastructure  
- config and software can only be updated by replacing the instance  
Disposable infrastructure  


you can freely use data from 1 resource to create another  

Execution plan  
IAC code is compared with state and a plan is created  
Resource Graph (is data structure used to figure out plan)  
directed acyclic graph  



> AWS terraform setup   

IAM -> Add User -> programming access -> AdministratorAccess  

~/.aws/credentials  

[default]  
aws_access_key_id=  
aws_secret_access_key=  





> Features

Infra automation
Open source
Declarative syntax
Push based deployment
Integrate multiple providers
Abstract and Reusable components
Idempotent and Consistent
Repeatable

terraform reach out to the api for any given service and tell it what to create  

executable  
cofiguration files ( .tf files, in json or HCL )
provider plugins  
state data 


> commands  

```

terraform version  
terraform -help  

terraform init   

terraform plan    	   	# outputs a plan
terraform plan -destroy    	# ouputs plan to destroy
terraform plan -destroy -out=example.plan    	# saves to output file
terraform show example.plan    	# shows the plan 
terraform plan --help
terraform apply
terraform destroy


terraform state 		# state(reality) of your infra, the local represetation teraform keeps
terraform state list 		# list all resource names  
terraform state mv
terraform state pull
terraform state push
terraform state rm
terraform state show resorce_name 

terraform state show <resource type>
terraform state show <resource_type.name>
	
terraform state mv <source> <destination>

terraform state rm <resource type>

terraform graph      #generates a graph outupt which can be pasted in webgraphviz.com to view graphically



terraform plan -destroy -out=example.plan    	# saves to output file
terraform apply example.plan
terraform apply -auto-approve


terraform graph | grep -v -e 'meta' -e 'vpc' 	# -v means to exclude, -e means the expressions to be excluded



```


Resources 
- different settngs for every provider  

Terraform style  
- indent 2 spaces  
- single meta-arguments first  
- block meta-aruments last  
- blank lines for clarity  
- group single arguments  
- readability  
- equal signs should be lined up  


Terraform Advanced  
- variables  
- spliting out data  
- modules  


registry.terraform.io    # here there are prewritten modules that u can use in your code  



For a basic example:
vpc 
a public subnet  
ec2  
routing resources  
security groups  

blocks:  
providers - the cloud provider you want to use, along with account and region  
resources - any resource like instance, database, etc.  
data sources - asking for information for configs from cloud providers  



IaC : Provisioning infra via software to get consistent and predictable deployments
stored in source control

```
blocktype "label" "namelabel" {
  key = "value"
  nestedblock {
    key = "value"
  }
}

```

- [http://registry.terraform.io/browse/providers](http://registry.terraform.io/browse/providers)  
- [http://registry.terraform.io/browse/modules](http://registry.terraform.io/browse/modules)


Data in terraform  

input variables  
local values  
output values  

data types  

primitives  string,number,boolean
collection  list,set,map
structural  tuple,object

looping constructs  

Count  		integer  
For_each  	map or set  
Dynamic blocks  map or set





Variable values priority  

TF_VAR_ environment variable 
terraform.tfvars  
terraform.tfvars.json  
.auto.tfvars  
.auto.tfvars.json
-var-file flag  
-var flag 
default value 
cmd prompt  



```
variable "variable_name" {
  type = type_value	
  description = "description_value"
  default = "default_value"
  sensitive = true|false
}
  
```


splitting resources in separate files inprove readability 
terraform state data (stored in JSON format)  should not be altered directly  

terraform modules  
module components:  
input variables  
output values  
resources and data sources  






## Links


Hashicorp Certification [https://www.hashicorp.com/certification/terraform-associate](https://www.hashicorp.com/certification/terraform-associate)
Provision an EKS cluster(AWS)
[https://learn.hashicorp.com/tutorials/terraform/eks](https://learn.hashicorp.com/tutorials/terraform/eks) 

[https://medium.com/javarevisited/7-best-terraform-online-courses-for-devops-engineers-5e4dab297785](https://medium.com/javarevisited/7-best-terraform-online-courses-for-devops-engineers-5e4dab297785)
[https://www.udemy.com/course/terraform-beginner-to-advanced](https://www.udemy.com/course/terraform-beginner-to-advanced)
[https://www.pluralsight.com/courses/terraform-getting-started-2021](https://www.pluralsight.com/courses/terraform-getting-started-2021)
[https://www.udemy.com/course/learn-devops-infrastructure-automation-with-terraform](https://www.udemy.com/course/learn-devops-infrastructure-automation-with-terraform)
[https://app.pluralsight.com/library/courses/terraform-deep-dive](https://app.pluralsight.com/library/courses/terraform-deep-dive)
AWS localstack   
Easy-to-use test/mocking framework for developing Cloud applications.  
https://localstack.cloud/  
https://github.com/localstack/localstack 
[https://www.fairwinds.com/blog/terraform-and-eks-a-step-by-step-guide-to-deploying-your-first-cluster](https://www.fairwinds.com/blog/terraform-and-eks-a-step-by-step-guide-to-deploying-your-first-cluster)  
[https://learn.hashicorp.com/terraform?utm_source=terraform_io_download](https://learn.hashicorp.com/terraform?utm_source=terraform_io_download)  
[https://learn.hashicorp.com/collections/terraform/cloud-get-started](https://learn.hashicorp.com/collections/terraform/cloud-get-started)  
[https://www.freecodecamp.org/news/how-to-deploy-aws-infrastructure-with-terraform-and-github-actions-a-practical-multi-environment-ci-cd-guide/](https://www.freecodecamp.org/news/how-to-deploy-aws-infrastructure-with-terraform-and-github-actions-a-practical-multi-environment-ci-cd-guide/)  
[https://towardsdatascience.com/deploy-cloud-functions-on-gcp-with-terraform-111a1c4a9a88](https://towardsdatascience.com/deploy-cloud-functions-on-gcp-with-terraform-111a1c4a9a88)  


