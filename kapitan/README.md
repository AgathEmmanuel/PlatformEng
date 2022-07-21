# kapitan

Kapitan is  a configuration tool to generate files to be consumed by other systems: one tool to rule them all  
Generic approach makes it suitable to enable gitops and declarative configuration workflow consitently across a range of application domains  

Main k8s config tools like Helm, kustomize 
- focus on one application at a time  
- do not have ability to capture full deployment or full setup you have across all your infrastructure  
- do not follow reuse of configuration data  
- each has a different approach for example (for secret management)  
- defer rendering of produced manifests to the apply stage  
- force same  language or template for all use cases  
- are kubernetes centric  
- often we also need to manage playbooks, documentation, dashboards, config/params/values shared with multiple systems and technologies  


Features  
- supports reuse, overriding, merging and sharing of config data  
- extensible choice of input types ( jinja2,jsonnet,kadet(python),helm,copy,externa)  
- secure handling of secrets integrating with ( GPG, Vault, GCP kms, AWS kms, Azure kms )  
- fetching external dependencies ( git, http, helm, remote inventories )  
- reveolves around inventory "single source of truth" hierarchical database of config values  
- lets you define targets and reuse common configuration values using classes  
- config values in a class  
    - can be shared across targets  
    - can be overriden by other classes  
    - can be refered from any other class 

# Links  
[Introduction to Kapitan | Rawkode Live](https://youtu.be/8QZvgJi0vII)  
