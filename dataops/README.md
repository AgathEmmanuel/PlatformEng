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
















##  Airflow vs Apache Spark: What are the differences  

Airflow: 
A platform to programmaticaly author, schedule and monitor data pipelines, by Airbnb.  
Use Airflow to author workflows as directed acyclic graphs (DAGs) of tasks.  
The Airflow scheduler executes your tasks on an array of workers while following the specified dependencies.  
Rich command lines utilities makes performing complex surgeries on DAGs a snap.  
The rich user interface makes it easy to visualize pipelines running in production, monitor progress and troubleshoot issues when needed.  

Apache Spark: 
Fast and general engine for large-scale data processing.  
Spark is a fast and general processing engine compatible with Hadoop data.  
It can run in Hadoop clusters through YARN or Spark's standalone mode,  
and it can process data in HDFS, HBase, Cassandra, Hive, and any Hadoop InputFormat.  
It is designed to perform both batch processing (similar to MapReduce) and new workloads like streaming, interactive queries, and machine learning.


Airflow can be classified as a tool in the "Workflow Manager" category, while Apache Spark is grouped under "Big Data Tools".

Some of the features offered by Airflow are:

    Dynamic: Airflow pipelines are configuration as code (Python), allowing for dynamic pipeline generation. This allows for writting code that instantiate pipelines dynamically.
    Extensible: Easily define your own operators, executors and extend the library so that it fits the level of abstraction that suits your environment.
    Elegant: Airflow pipelines are lean and explicit. Parameterizing your scripts is built in the core of Airflow using powerful Jinja templating engine.

On the other hand, Apache Spark provides the following key features:

    Run programs up to 100x faster than Hadoop MapReduce in memory, or 10x faster on disk
    Write applications quickly in Java, Scala or Python
    Combine SQL, streaming, and complex analytics


## Things you should avoid when designing a Data Warehouse  

Fact and Dimension tables are the main two tables that are used when designing a data warehouse.  
The fact table contains measures of columns and surrogate keys that link to the dimension tables.  
Measure columns are the values that you store in order to measure the business fact.  
For example, sales amount, quantity are examples for measure columns in a data warehouse.  
These measures are analyzed with the dimension attributes.  
Therefore, a fact table should have surrogate keys to join with dimension tables.  


facts and dimensions are the fundamental elements that define a data warehouse.  
They record relevant events of a subject or functional area (facts) and the characteristics that define them (dimensions).

Data warehouses are data storage and retrieval systems (i.e., databases) specifically designed to  
support business intelligence (BI) and OLAP (online analytical processing) activities.  
A well-designed data warehouse is high-performance and responsive to queries.  
It also provides flexibility so that business analysts (or any other end user of the data warehouse) can query from different points of view. 
Users can alternate between a high-level overview and deep queries at the greatest level of detail as they wish.  


The Four Pillars of the Data Warehouse:  

- Oriented to a single subject or a particular functional area. For example, it is oriented to company sales.
- They unify and create consistency among data from disparate sources.
- Persistent and immutable. Once data enters a data warehouse, it stays there and does not change.
- Structured in time intervals. To provide information from a historical perspective, data warehouses record information over different intervals, such as weekly, monthly, quarterly, etc.


In particular, data warehouse tables are divided into two main categories: fact tables and dimension tables.  


Facts and dimensions in a data warehouse should form a layout that responds to a particular topology.  
There are two main topologies: the star schema and the snowflake schema.  
In a star schema, individual dimensions surround a single fact table, while a snowflake schema has a hierarchy of dimensions.    
Facts are the measurable events related to the functional area covered by a data warehouse  
Fact tables are the core tables of a data warehouse  
They contain quantitative information, commonly associated with points in time  
Dimensions, on the other hand, are collections of reference information about the facts in a data warehouse  
Dimensions categorize and describe the facts recorded in a data warehouse to provide meaningful, categorized, and descriptive answers to business questions.  
In the design of a data warehouse, it is common to create dimension tables first and then create fact tables by relating them to the dimension tables through foreign keys.  


## Overview of CUBE, ROLLUP, and Top-N Queries  
ROLLUP and CUBE are simple extensions to the SELECT statement's GROUP BY clause.  
ROLLUP creates subtotals at any level of aggregation needed, from the most detailed up to a grand total.  
CUBE is an extension similar to ROLLUP, enabling a single statement to calculate all possible combinations of subtotals.  
CUBE can generate the information needed in cross-tab reports with a single query.  
To enhance performance, both CUBE and ROLLUP are parallelized: multiple processes can simultaneously execute both types of statements.  


```
 ROLLUP

ROLLUP enables a SELECT statement to calculate multiple levels of subtotals across a specified group of dimensions. It also calculates a grand total. ROLLUP is a simple extension to the GROUP BY clause, so its syntax is extremely easy to use. The ROLLUP extension is highly efficient, adding minimal overhead to a query.
Syntax

ROLLUP appears in the GROUP BY clause in a SELECT statement. Its form is:

SELECT ... GROUP BY
   ROLLUP(grouping_column_reference_list)

Details

ROLLUP's action is straightforward: it creates subtotals which "roll up" from the most detailed level to a grand total, following a grouping list specified in the ROLLUP clause. ROLLUP takes as its argument an ordered list of grouping columns. First, it calculates the standard aggregate values specified in the GROUP BY clause. Then, it creates progressively higher-level subtotals, moving from right to left through the list of grouping columns. Finally, it creates a grand total.

ROLLUP will create subtotals at n+1 levels, where n is the number of grouping columns. For instance, if a query specifies ROLLUP on grouping columns of Time, Region, and Department ( n=3), the result set will include rows at four aggregation levels.
Example

This example of ROLLUP uses the data in the video store database.

  SELECT Time, Region, Department,
   sum(Profit) AS Profit FROM sales
   GROUP BY ROLLUP(Time, Region, Dept)


 CUBE

Note that the subtotals created by ROLLUP are only a fraction of possible subtotal combinations. For instance, in the cross-tab shown in Table 20-1, the departmental totals across regions (279,000 and 319,000) would not be calculated by a ROLLUP(Time, Region, Department) clause. To generate those numbers would require a ROLLUP clause with the grouping columns specified in a different order: ROLLUP(Time, Department, Region). The easiest way to generate the full set of subtotals needed for cross-tabular reports such as those needed for Figure 20-1 is to use the CUBE extension.

CUBE enables a SELECT statement to calculate subtotals for all possible combinations of a group of dimensions. It also calculates a grand total. This is the set of information typically needed for all cross-tabular reports, so CUBE can calculate a cross-tabular report with a single SELECT statement. Like ROLLUP, CUBE is a simple extension to the GROUP BY clause, and its syntax is also easy to learn.
Syntax

CUBE appears in the GROUP BY clause in a SELECT statement. Its form is:

SELECT ...  GROUP BY
  CUBE (grouping_column_reference_list)

Details

CUBE takes a specified set of grouping columns and creates subtotals for all possible combinations of them. In terms of multi-dimensional analysis, CUBE generates all the subtotals that could be calculated for a data cube with the specified dimensions. If you have specified CUBE(Time, Region, Department), the result set will include all the values that would be included in an equivalent ROLLUP statement plus additional combinations. For instance, in Table 20-1, the departmental totals across regions (279,000 and 319,000) would not be calculated by a ROLLUP(Time, Region, Department) clause, but they would be calculated by a CUBE(Time, Region, Department) clause. If there are n columns specified for a CUBE, there will be 2n combinations of subtotals returned. Table 20-3 gives an example of a three-dimension CUBE.
Example

This example of CUBE uses the data in the video store database.

SELECT Time, Region, Department, 
   sum(Profit) AS Profit FROM sales
   GROUP BY CUBE  (Time, Region, Dept)



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







## Exercise Controlled Freedom when dealing with stakeholders

Alex has built decentralized access to data at Fox on a foundation he calls “controlled freedom.” In fact, he believes using your data team as the single source of truth within an organization actually creates the biggest silo.

"If you think about a centralized data reporting structure, where you used to come in, open a ticket, and wait for your turn, by the time you get an answer, it’s often too late,” Alex said. Businesses are evolving and growing at a pace I’ve never seen before, and decisions are being made at a blazing speed. You have to have data at your fingertips to make the correct decision."

I believe this is the way forward: “striving towards giving people trust in the data platforms while supplying them with the tools and skill sets they need to be self-sufficient.

data tagging and collections,
data engineering,
data analytics,
data science,
data architecture


While members of different data teams collaborate to deliver value to the business, there’s a clear delineation between analysts and engineers within the Fox data organization. Analysts sit close to the business units, understanding pain points and working to find and validate new data sources. This knowledge informs what Alex and his teams call an STM, or Source to Target Mapping — a spec that essentially allows engineers to operate from a well-defined playbook to build the pipelines and architecture necessary to support the data needs of the business.


The Fox data team built their tech stack to meet a specific need: enabling self-service analytics. “We embarked on the journey of adopting a lakehouse architecture because it would give us both the beauty and control of a data lake, as well as the cleanliness and structure of a data warehouse.”

Several types of data flow into the Fox digital ecosystem, including batched, micro-batched, streaming, structured, and unstructured. After ingestion, data goes through what Alex refers to as a “three-layer cake.



First, we have the data exposed at its raw state, exactly how we ingest it,” said Alex. “But that raw data is often not usable for people who want to do discovery and exploration. That’s why we’re building the optimized layer, where data gets sorted, sliced-and-diced, and optimized in different file formats for the speed of reading, writing, and usability. After that, when we know something needs to be defined as a data model or included in a data set, we engage in that within the publishing layer and then build it out for broader consumption within the company. Inside of the published layer, data can be exposed via our tool stack.  

The optimized layer makes up the pool of data that Alex and his team provide to internal stakeholders under the “controlled freedom” model. With self-serve analytics, data users can discover and work with data assets that they already know are trustworthy and secure.  

If you don’t approach your data from the angle that it’s easy to discover, easy to search, and easy to observe, it becomes more like a swamp,” said Alex. “We need to instill and enforce some formats and strict regulations to make sure the data is getting properly indexed and properly stored so that people can find and make sense of the data.  





The data mesh is a type of data platform architecture that embraces the ubiquity of data in the enterprise by leveraging a domain-driven, self-serve design.  



Unlike traditional monolithic data infrastructures that handle the ETL in one central data lake, a data mesh supports distributed, domain-specific data consumers and views “data-as-a-product,” with each domain handling their own data pipelines. Underlying the data mesh is a standardized layer of observability and governance that ensures data is reliable and trustworthy at all times.  




## Core principles and logical architecture of data mesh  

Data mesh objective is to create a foundation for getting value from analytical data and historical facts at scale - scale being applied to constant change of data landscape, proliferation of both sources of data and consumers, diversity of transformation and processing that use cases require, speed of response to change.  
To achieve this objective, there are four underpinning principles that any data mesh implementation embodies to achieve the promise of scale, while delivering quality and integrity guarantees needed to make data usable :  
- domain-oriented decentralized data ownership and architecture,  
- data as a product,  
- self-serve data infrastructure as a platform,  
- federated computational governance  


```
Pre data mesh governance aspect					Data mesh governance aspect


Centralized team						Federated team

Responsible for data quality					Responsible for defining how to model what constitutes quality

Responsible for data security					Responsible for defining aspects of data security i.e. data sensitivity levels for the platform to build in and monitor automatically

Responsible for complying with regulation			Responsible for defining the regulation requirements for the platform to build in and monitor automatically

Centralized custodianship of data				Federated custodianship of data by domains

Responsible for global canonical data modeling			Responsible for modeling polysemes - data elements that cross the boundaries of multiple domains

Team is independent from domains				Team is made of domains representatives
Aiming for a well defined static structure of data		Aiming for enabling effective mesh operation embracing a continuously changing and a dynamic topology of the mesh

Centralized technology used by monolithic lake/warehouse	Self-serve platform technologies used by each domain

Measure success based on number or volume of governed data(tables)	Measure success based on the network effect - the connections representing the consumption of data on the mesh

Manual process with human intervention				Automated processes implemented by the platform

Prevent error							Detect error and recover through platform’s automated processing
```




## Data Engineering Pipelines - SQL, Python, Spark  
```
processing data depending upon our downstream needs  
batch pipelines





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
[https://sbakiu.medium.com/orchestrating-spark-jobs-with-kubeflow-for-ml-workflows-830f802a99fe](https://sbakiu.medium.com/orchestrating-spark-jobs-with-kubeflow-for-ml-workflows-830f802a99fe)  

[https://cloud.google.com/blog/products/infrastructure-modernization/running-spark-on-kubernetes-with-dataproc](https://cloud.google.com/blog/products/infrastructure-modernization/running-spark-on-kubernetes-with-dataproc)  
[https://cloud.google.com/dataproc/docs/guides/dpgke/quickstarts/dataproc-gke-quickstart-create-cluster](https://cloud.google.com/dataproc/docs/guides/dpgke/quickstarts/dataproc-gke-quickstart-create-cluster)  
[https://wisdomplexus.com/blogs/dataproc-vs-dataflow-vs-dataprep/](https://wisdomplexus.com/blogs/dataproc-vs-dataflow-vs-dataprep/)  

[https://github.com/GoogleCloudPlatform/spark-on-k8s-operator#installation](https://github.com/GoogleCloudPlatform/spark-on-k8s-operator#installation)  

[https://github.com/kubeflow/pipelines/blob/master/components/gcp/dataproc/submit_pyspark_job/README.md](https://github.com/kubeflow/pipelines/blob/master/components/gcp/dataproc/submit_pyspark_job/README.md)  

[Comparing Apache Spark on Kubernetes to Kubeflow](Comparing Apache Spark on Kubernetes to Kubeflow)  
[https://stackshare.io/stackups/airflow-vs-spark](https://stackshare.io/stackups/airflow-vs-spark)  













[https://vertabelo.com/blog/facts-dimensions-data-warehouse/](https://vertabelo.com/blog/facts-dimensions-data-warehouse/)  
[https://www.vertabelo.com/blog/data-warehouse-modeling-the-star-schema/](https://www.vertabelo.com/blog/data-warehouse-modeling-the-star-schema/)  
[https://www.vertabelo.com/blog/data-warehouse-modeling-the-snowflake-schema/](https://www.vertabelo.com/blog/data-warehouse-modeling-the-snowflake-schema/)  
[https://www.vertabelo.com/blog/dimensions-of-dimensions-a-look-at-data-warehousings-most-common-dimensional-table-types/](https://www.vertabelo.com/blog/dimensions-of-dimensions-a-look-at-data-warehousings-most-common-dimensional-table-types/)  





[https://medium.com/fox-tech/data-reliability-at-scale-how-fox-digital-architected-its-modern-data-stack-d04c1f7ce201](https://medium.com/fox-tech/data-reliability-at-scale-how-fox-digital-architected-its-modern-data-stack-d04c1f7ce201)  

[https://medium.com/swlh/dataflow-and-apache-beam-the-result-of-a-learning-process-since-mapreduce-c591b2ab180e](https://medium.com/swlh/dataflow-and-apache-beam-the-result-of-a-learning-process-since-mapreduce-c591b2ab180e)  
[https://www.montecarlodata.com/blog-automatic-detection-and-alerting-for-data-incidents-with-monte-carlo/](https://www.montecarlodata.com/blog-automatic-detection-and-alerting-for-data-incidents-with-monte-carlo/)  
[https://www.montecarlodata.com/blog-data-observability-tools-data-engineerings-next-frontier/](https://www.montecarlodata.com/blog-data-observability-tools-data-engineerings-next-frontier/)  
[https://www.montecarlodata.com/blog-how-to-make-your-data-pipelines-more-reliable-with-slas/](https://www.montecarlodata.com/blog-how-to-make-your-data-pipelines-more-reliable-with-slas/)  
[https://www.montecarlodata.com/blog-decoding-the-data-mesh/](https://www.montecarlodata.com/blog-decoding-the-data-mesh/)  
[https://martinfowler.com/articles/data-monolith-to-mesh.html](https://martinfowler.com/articles/data-monolith-to-mesh.html)  
[https://towardsdatascience.com/data-mesh-101-everything-you-need-to-know-to-get-started-72087f5a7d91](https://towardsdatascience.com/data-mesh-101-everything-you-need-to-know-to-get-started-72087f5a7d91)  
[https://towardsdatascience.com/data-catalogs-are-dead-long-live-data-discovery-a0dc8d02bd34](https://towardsdatascience.com/data-catalogs-are-dead-long-live-data-discovery-a0dc8d02bd34)  







[https://towardsdatascience.com/data-mesh-101-everything-you-need-to-know-to-get-started-72087f5a7d91](https://towardsdatascience.com/data-mesh-101-everything-you-need-to-know-to-get-started-72087f5a7d91)  

[https://martinfowler.com/articles/data-monolith-to-mesh.html](https://martinfowler.com/articles/data-monolith-to-mesh.html)  
[https://martinfowler.com/articles/data-mesh-principles.html](https://martinfowler.com/articles/data-mesh-principles.html)  
[https://towardsdatascience.com/data-mesh-applied-21bed87876f2](https://towardsdatascience.com/data-mesh-applied-21bed87876f2)  
[https://towardsdatascience.com/what-is-a-data-mesh-and-how-not-to-mesh-it-up-210710bb41e0](https://towardsdatascience.com/what-is-a-data-mesh-and-how-not-to-mesh-it-up-210710bb41e0)  
[https://read.hyperight.com/is-data-mesh-right-for-your-organisation/](https://read.hyperight.com/is-data-mesh-right-for-your-organisation/)  
[https://www.starburst.io/resources/datanova-2021/?wchannelid=d4oyeh306b&wmediaid=1z50qr8fh6](https://www.starburst.io/resources/datanova-2021/?wchannelid=d4oyeh306b&wmediaid=1z50qr8fh6)  
[https://databricks.com/session_na20/data-mesh-in-practice-how-europes-leading-online-platform-for-fashion-goes-beyond-the-data-lake](https://databricks.com/session_na20/data-mesh-in-practice-how-europes-leading-online-platform-for-fashion-goes-beyond-the-data-lake)  
[https://medium.com/intuit-engineering/intuits-data-mesh-strategy-778e3edaa017](https://medium.com/intuit-engineering/intuits-data-mesh-strategy-778e3edaa017)  
[https://www.youtube.com/watch?v=TO_IiN06jJ4](https://www.youtube.com/watch?v=TO_IiN06jJ4)  
[https://martinfowler.com/articles/data-monolith-to-mesh.html](https://martinfowler.com/articles/data-monolith-to-mesh.html)  
[https://martinfowler.com/articles/data-monolith-to-mesh.html#ArchitecturalFailureModes](https://martinfowler.com/articles/data-monolith-to-mesh.html#ArchitecturalFailureModes)  
[https://www.guru99.com/etl-vs-elt.html](https://www.guru99.com/etl-vs-elt.html)  



[https://db-engines.com/en/system/Google+Cloud+Datastore%3BIBM+Db2](https://db-engines.com/en/system/Google+Cloud+Datastore%3BIBM+Db2)  
[https://cloud.google.com/sql/docs/introduction](https://cloud.google.com/sql/docs/introduction)  
[https://developer.confluent.io/learn-kafka/data-pipelines/intro/](https://developer.confluent.io/learn-kafka/data-pipelines/intro/)  


[https://hevodata.com/learn/dataops-trends/](https://hevodata.com/learn/dataops-trends/)  
[https://towardsdatascience.com/the-rise-of-dataops-2788958034ee](https://towardsdatascience.com/the-rise-of-dataops-2788958034ee)  
[https://towardsdatascience.com/data-pipeline-design-patterns-100afa4b93e3](https://towardsdatascience.com/data-pipeline-design-patterns-100afa4b93e3)  


[Data Engineering Project: Stream Edition](https://www.startdataengineering.com/post/data-engineering-project-for-beginners-stream-edition]  


