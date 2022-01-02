

-------------- Ansible

Ansible is a configuration management tool 

Terraform is an IaC tool

Ansible and Terraform are complementary tools that are commonly used together.
The decision to include Ansible and Terraform in your DevOps stack is not an either-or decision.


https://www.theserverside.com/answer/Terraform-vs-Ansible-How-do-these-DevOps-tools-differ


Use Terraform to create resources and services
Then use Ansible to configure the resources Terraform created.

For example, imagine you need to provision an Amazon Elastic Compute Cloud (EC2) instance for infrastructure. And on that instance, you'll need to install a MySQL server and configure it with a variety of port settings, security constraints and performance optimization parameters.

In this scenario, you should use Terraform to define how to create a virtual machine as an EC2 instance in the AWS cloud. You would then use Ansible to install and configure the MySQL database. As you can see, Ansible and Terraform address two separate DevOps concerns.
They are complementary, not competitive.


