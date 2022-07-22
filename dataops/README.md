# DataOps  


## Big Data, Data Lakes and Data Warehouses with GCP


- Big Data Text Processing Pipeline in Cloud Dataflow  



A data pipeline architecture is a system that captures, organizes, and routes data so that it can be used to gain insights. Raw data contains too many data points that may not be relevant. Data pipeline architecture organizes data events to make reporting, analysis, and using data easier. A customized combination of software technologies and protocols automate the management, visualization, transformation, and movement of data from multiple resources according to business goals.  


Real-time data collection with Hadoop and Spark integration feature is more prominent in Dataproc. The data lake, data collection, cleaning, cloud, and workload processing are highly rated for the Dataflow. Visual analytics and processing data with the help of Dataprep is seen as its plus-point.  

```

Points of Difference    |Dataproc   				|Dataflow 			  |DataPrep  
			|					|				  |
provisioning		|manual cluster provisioning  		|automated  		 	  |automated  
system intrgration      |apache spark and hadoop  		|apache beam             	  |Big Table and Big Query  
ease of use  		|simple and easy to use 	        |relatively difficult    	  |easy to use  
approach                |hands-on, Dev-Ops approach             |Fully managed, no-ops approach   |fully managed, no-ops approach  
unique for  		|data science/ Ml ecosystem 		|batch & stream processing data   |UI driven processing of data  

```




## Data Ops

- involves utilizing, transforming, and orchestrating data workflows.
- use processes and tools to get data to people quickly.
- produce quality data and analytics solutions faster and more efficiently.

Involves
-    Data management.
-    Data science.
-    Data analysis.
-    Data integration.
-    Data security.
-    Data engineering.
-    Data governance.



A data mesh involves a cultural shift in the way that companies think about their data.
Instead of data acting as a by-product of a process, it becomes the product, where data producers act as data product owners.
Historically, a centralized infrastructure team would maintain data ownership across domains,
but the product thinking focus under a data mesh model shifts this ownership to the producers as they are the subject matter experts.
Their understanding of the primary data consumers and how they leverage the domains operational and analytical data allows them to design APIs
with their best interests in mind.
While this domain-driven design also makes data producers responsible for documenting semantic definitions, cataloguing metadata and setting policies for permissions and usage, there is still a centralized data governance team to enforce these standards and procedures around the data.
Additionally, while domain teams become responsible for their ETL data pipelines under a data mesh architecture, it doesn't eliminate the need for a centralized data engineering team. However, their responsibility becomes more focused on determining the best data infrastructure solutions for the data products being stored.
Data mesh allows for more flexible data integration and interoperable functionality, where data from multiple domains can be immediately consumed by users for business analytics, data science experimentation and more.
A data mesh uses functional domains as a way to set parameters around the data, enabling it to be treated as a product which can be accessed to users across the organization
Data mesh is a distributed data architecture, where data is organized by its domain to make it more accessible to users across an organization.



A data fabric is an architectural approach to simplify data access in an organization to facilitate self-service data consumption.
This architecture is agnostic to data environments, processes, utility and geography, all while integrating end-to-end data-management capabilities.
A data fabric automates data discovery, governance and consumption, enabling enterprises to use data to maximize their value chain.
With a data fabric, enterprises elevate the value of their data by providing the right data, at the right time, regardless of where it resides.
A data fabric is an architecture concept, and it focuses on the automation of data integration, data engineering, and governance in a data value chain between data providers and data consumers.
A data fabric is based on the notion of active metadata which uses knowledge graph, semantics, and AI / ML technology to discover patterns in various types of metadata (for example system logs, social, etc.) and apply this insight to automate and orchestrate the data value chain (for example enable a data consumer to find a data product and then have that data product provisioned to them automatically).
A data fabric is complimentary to a data mesh as opposed to mutually exclusive.
In fact the data fabric makes the data mesh better because it can automate key parts of the data mesh such as creating data products faster, enforcing global governance, and making it easier to orchestrate the combination of multiple data products.


A data lake is a low-cost storage environment, which typically houses petabytes of structured, semi-structured and unstructured data for business analytics, machine learning and other broad applications.
A data mesh is an architectural approach to data, which a data lake can be a part of.
However, a central data lake is more typically used as dumping ground for data as it frequently is used to ingest data that does not yet have a defined purpose.
A data lake is defined as a data storage repository that centralizes, organizes, and protects large amounts
of structured, semi-structured, and unstructured data from multiple sources.
Unlike data warehouses that follow a schema-on-write approach (data is structured as it enters the warehouse),
data lakes follow a schema-on-read approach, where data can be structured at query-time based on a users needs.
The cloud data platform, an emerging paradigm that combines elements of data warehouses and data lakes,
seeks to integrate those myriad data points, generate insights, and create business value.


An enterprise data warehouse (EDW) is a relational data warehouse containing a company’s business data, including information about its customers.
An EDW enables data analytics, which can inform actionable insights.
Like all data warehouses, EDWs collect and aggregate data from multiple sources, acting as a repository for most or all organizational data to facilitate broad access and analysis.


"A data mesh is basically an API-driven [solution] for developers, unlike [data] fabric, Yuhanna said.
Data fabric is the opposite of data mesh, where you are writing code for the APIs to interface.
On the other hand, data fabric is low-code, no-code, which means that the API integration is happening
inside of the fabric without actually leveraging it directly, as opposed to data mesh."

"A data fabric and a data mesh both provide an architecture to access data across multiple technologies and
platforms, but a data fabric is technology-centric, while a data mesh focuses on organizational change"
Serra writes in a June blog post.
Data mesh is more about people and process than architecture, while a data fabric is an architectural
approach that tackles the complexity of data and metadata in a smart way that works well together.

Data fabric will include:
    Full SQL support
    Distributed datastore architecture, supporting linear scalability
    High concurrency support, with real-time performance for operational workloads
    Complex query support for single business entities
    Complex query support for single business entities
    Supports all integration methods
    High-scale data preparation and pipelining into data lakes and warehouses for analytical workloads
    Dynamic data governance
    Acessing data
    Managing data lifecycle
    Data compliance ( GDPR, CCPA, HIPAA, FCRA )
    Exposing Data to Enterprise Catalogs ( Business Analysts, Data Science, App Dev, Power BI, Python, Spark, Trustworthy AI, MLOPS having proper monitoring of Bias, Drift, Fairness and Explainability ) 

Example: Hotel management  with hotel recomendation to users

Data injested from social media regarding users --> MDM (Master Data Management)
--> Governance (Mask, masking credit cards ets) --> Publish Catalogs
--> Developer creates recomendation service with the data

```
                      Data Lake                         Data Warehouse
Data Structure           Raw                              Processed
Purpose of Data    Not yet determined                   Currently in use
Users               Data scientists                     Business professionals
Accessibility   Highly accessible and quick to update   More complicated and costly to make changes
```






# Links

[https://analyticsindiamag.com/data-mesh-vs-data-fabric-whats-the-difference/](https://analyticsindiamag.com/data-mesh-vs-data-fabric-whats-the-difference/)
[https://solutionsreview.com/data-management/the-best-cloud-data-warehouse-solutions-2/](https://solutionsreview.com/data-management/the-best-cloud-data-warehouse-solutions-2/)
[https://solutionsreview.com/business-intelligence/the-best-self-service-analytics-tools-and-software/](https://solutionsreview.com/business-intelligence/the-best-self-service-analytics-tools-and-software/)
[https://www.datanami.com/2021/10/25/data-mesh-vs-data-fabric-understanding-the-differences/](https://www.datanami.com/2021/10/25/data-mesh-vs-data-fabric-understanding-the-differences/)
[https://martinfowler.com/articles/data-monolith-to-mesh.html](https://martinfowler.com/articles/data-monolith-to-mesh.html)
[https://martinfowler.com/articles/data-mesh-principles.html](https://martinfowler.com/articles/data-mesh-principles.html)
[https://www.talend.com/resources/data-lake-vs-data-warehouse/](https://www.talend.com/resources/data-lake-vs-data-warehouse/)
[https://www.chaossearch.io/blog/data-lake-vs-data-mesh](https://www.chaossearch.io/blog/data-lake-vs-data-mesh)
[https://www.ibm.com/in-en/analytics/data-fabric](https://www.ibm.com/in-en/analytics/data-fabric)
[https://www.ibm.com/topics/data-mesh](https://www.ibm.com/topics/data-mesh)
[https://www.k2view.com/what-is-data-fabric](https://www.k2view.com/what-is-data-fabric)
[https://en.wikipedia.org/wiki/Enterprise_data_management](https://en.wikipedia.org/wiki/Enterprise_data_management)
[https://www.chainsys.com/case-studies/edm-edw-and-data-science-with-40-applications](https://www.chainsys.com/case-studies/edm-edw-and-data-science-with-40-applications)
[https://tdan.com/the-enterprise-data-model-a-key-ingredient-for-successful-data-warehousing/4252](https://tdan.com/the-enterprise-data-model-a-key-ingredient-for-successful-data-warehousing/4252)
[https://www.snowflake.com/guides/what-enterprise-data-warehouse](https://www.snowflake.com/guides/what-enterprise-data-warehouse)
[Data Fabric Explained](https://youtu.be/0Zzn4eVbqfk)



[https://cloud.google.com/sql/docs/introduction](https://cloud.google.com/sql/docs/introduction)  
[https://cloud.google.com/blog/topics/developers-practitioners/bigtable-vs-bigquery-whats-difference](https://cloud.google.com/blog/topics/developers-practitioners/bigtable-vs-bigquery-whats-difference)  
[https://cloud.google.com/dataprep](https://cloud.google.com/dataprep)  


[https://www.snaplogic.com/glossary/data-pipeline-architecture](https://www.snaplogic.com/glossary/data-pipeline-architecture)  




[https://towardsdatascience.com/scalable-efficient-big-data-analytics-machine-learning-pipeline-architecture-on-cloud-4d59efc092b5](https://towardsdatascience.com/scalable-efficient-big-data-analytics-machine-learning-pipeline-architecture-on-cloud-4d59efc092b5)  


[https://wisdomplexus.com/blogs/dataproc-vs-dataflow-vs-dataprep/](https://wisdomplexus.com/blogs/dataproc-vs-dataflow-vs-dataprep/)  

