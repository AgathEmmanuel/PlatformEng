

# ML Ops  

## Course  
[https://www.coursera.org/specializations/machine-learning-engineering-for-production-mlops](https://www.coursera.org/specializations/machine-learning-engineering-for-production-mlops)  


Note just build the ml model, but also put them in production  
Systematically plan out the lifecycle of an ML project  
- Scoping  
    - Define the project  
- Data  
    - Define data and establish baseline  
    - Label and organize data  
- Modeling  
    - Select and train model  
    - Perform error analysis  
- Deployment  
    - Deploy in production  
    - Monitor and maintain systems  




```

Deployment


challenges
- concept drift
  size of houses havent changed but prize has changed due to inflation
  definition of what if Y given X

- data drift
  people stoped building larger houses and is building smaller houses
  distribution of X changes event if the mapping of X and Y changes


- software engineering challenges
  Realtime predictions
  Batch predictions
  Cloud service
  Edge service
  Computer Resources Required (CPU/GPU/memory)
  Latency and Throughput (QPS Queries per second)
  Logging
  Security and Privacy


scoping => data => modeling => deployment



Deployment patterns 
- human only without any AI  
- shodow human and run prallely  
- AI assistance with human in the loop  
- partial automation with human in the loop  
- full automation with AI  
- canary  
- blue green  


Monitoring ML systems  
- software metrics: server load, memory, compute, latency, throughput 
- input metrics:  fraction of non-null outputs, avg input length, avg input volume, num missing value   
- output metrics: fraction of missing input values, time return null, time user redoes search, times user swithes to typing   

ML modeling is iterative  
- ML model/data
- experiment
- error analysis

ML deployment is iterative  
- deployment/monitoring
- traffic
- performance analysis


Model maintainance
- set threshold for alarms
- adapt metrics and threshold over time
- manual retraining
- automatic retraining


Pipeling monitoring



Selecting a Training Model

- model centric ai development
- data centric ai development
- ai system = code + data
- model + hyperparameters + data
- error analysis
- audit performance
- low average error isn't good enough
- do not discriminate on any protected attributes
- performance on disproportionately important examples is important
- performance on key slices of the dataset
- its not enought to do well on the test set
- establish a baseline level of performance HLP(human level performance)
- take into account deployment constraints when picking up model
- try to overfit a small training dataset befor training on a large one


Error Analysis and performance auditing

- examine and tag with an initial set of tags
- propose more tags
- what fraction of errors has a specific tag
- what fraction of miclassified data with tag
- what fraction of data that has tag
- can there be an improvement in data with tag
- prioritizing what to work on 
- adding or improving data for specific categories
- skewed datasets 
- performance auditing
- performance on subsets of data, cerain errors, rare classes



Data iteration
- data centric AI development
- use tools to improve data quality
- hold code/model fixed & iteratively improve data
- graph of possible inputs to performances
- creating lot of data using data augmentation
- Add/improve data => training => error analysis
- product reocommendation with Collaborative vs Content based filtering
- adding more features
- robust experiment tracking
- track algorithm/code, dataset, hyperparameter, results
- experiment tracking systems
- desirable features like infor to replicate, results, resource monitoring, error analysis
- moving from big data to good data
- features of good data:
   covers important use cases
   defined consistently
   timely feedback from production data ( with data drift and concept drift )
   is sized properly





Data Stage 

Define Data and Establish Baseline
- small data and label consistency
- improving label consistency

Lable and Organize data
- get into iteration loops asap
- purchasing data
- labeling data in house, outsourced, crowdsourced


Data pipeline
- multiprocessing data in various stages
- data cleaning
- preprocessing scripts
- ex: spam cleanup, user ID merge
- how to replicate preprocessin from dev to prod
- its ok if some data pre-processing is manual
- use tools to make sure data pipeline is replicable
- ex: tensorflow transform, apache beam, airflow, ...
- meta-data, data performance, lineage
- ex: predict if someone looking for rentals
  spam dataset => ml code => anti-spam model => user data => despammed user data
  id merge data => ml code => id merge model
  despammed user data => id merge model => clean user data => ml code => rental search model => prediction
- keep track of dat provenance(where it comes from) and lineage(sequence of steps) 
- make extensive use of meta-data ( data about data )
- balanced train/dev/test splits in small data problems
- random split will be representative in large datasets





ML egnineering Data Lifecycle in production

Collecting data
Lableing data
Validating data
ML Pipelines
Directed Acyclic Graphs and Pipeline Orchestration Frameworks
Intro to Tensorflow Extended (TFX)


"Broken data is the most common cause of problems in production ML systems"


Data Prep

Data cleansing => ingestion => analysis & transformation => validation => feature engineering => data splitting

Model creation

Building model => training optimization => model validation => training at scale => model

Model Rollout

Deploying => serving => monitoring & logging + explainability => fineturen and improvements



Pipeline Orchestration frameworks
- responsible for scheduling various components in an ml pipeline DAG dependencies
- help in pipeline automation
- ex: airflow, argo, celery, luigi, kubeflow



Tensorflow Extended (TFX)

Data ingestion => validation => feature engineering => train model => validate model => push if good => serve model



Preprocessing Operations
- Feature engineering
- never skip normalizing
















```

## ML Pipelines on GCP  

TFX pipelines  
MLflow  
Kubeflow    	: outofbox support for top frameworks like pytorch, tf and xgboost  
Cloud Composer  
AI platform pipelines  




- Model should be under version control
- Entire process from dataset creation to training to deployment must be driven by code  
- Retraining can be triggered by code changes and no-code changes froma a single entry point  
- Easy to monitor performance of models and fix some subset of issues arising without modifying model code  
- CI/CD for kubeflow pipelines  
- Training, Tuning and Serving on ML Platform  
- scalable ML services should be setup  
- Pipelines should be reusable  following the idea of LEGO blocks  
- a market place to publish your solutions like AI Hub in gcp  




Problems  
- keeping track of models, code, hyperparameter values chosen, metrics being evaluated, ideas  
- reproducability is a major concern  
- data scientists want to rerun the best models with minor parameter sweeps  
- team should be able to successfully train a model make it ready for production in a streamlined fashion  
- models in production need to be updated on a regular basis as new data comes in  
- performance, agility and teaceability is important  
- Training phase:    Labeled data => Ml algorithm => Trained model  
- Inference phase:   New data => Served Model => Predictions  
- reduce the time between analyzing the problem, creating models, deploying the solution, maintaining output quality  
- DevOps CI/CD :    Check out code => Perform unit testing => merge and Checkout Code => Build => Test => Release  
- MlOPs CI/CD  :    DevOps CI/CD +   Continous Training:    Serve => Monitor => Measure => Retrain   
- need to test and validate data, data schemes and models  
- need to consider technical depth while building and operating ML system  
- challenges:  model decay, deployment & testing complexity, multi-functional teams, experimental nature  
- Automate training, validation, and depoloyment with inclution of human validation in the loop  
- anyone in the organisation should be able to use the pipelines, modify it and use it  


Ml Project life cycle  
- Defining business use case  
- Data exploration  
- selecting algorithm  
- Data pipeline & feature engineering  
- Build ML model  
- Evaluate  
- Presenting results  
- Deployment of the model  
- Operationalizing the model  
- Monitoring model  
 
Ml Pipeline  
```
				       ________________performance monitoring___________perdiction service _____________________________________
                  		      | 													^
				      |		 												|
Raw data  =>  Data extraction  =>  Data analysis  =>  Data preparation  => Model training  => Model evaluation  =>  Model validation  =>  Trained Model  => Model Registry  




					  __  Confustion Matrix  
Pre-process  =>  Train  =>  Predict  =>  |
                                         |__   ROC  


DAC  :  Directed Acyclic Graph  


```


Vertex AI  
```

Ingest => Analyse => Tansform => Train (Autom ML or custom ML)  => Model => Evaluate (Explainable AI) => Deploy => Predict  
```





### Distributed Computing with Ray.io  

Ray:  universal framework for distributed computing 
      Comprehensive ecosystem of scalable libraries  


- execute remotely functions as tasks 
- instantiate remotely classes as actors  
- support both statefull and stateless computations  
- asynchronous execution using features  
- enable parallelism  
- distributed (immutable) object store  
- efficient communication (send arguments by reference)  
- distributed scheduler  
- direct calls  
- central control store  
- stateless components  
- rlib: scalable RL library  
- tune: hyperparameter tuning library  
- ray serve: deploy ml models in production  
- raysgd: elastic distributed training of machine learning models  






### Data centric ai vs Model centric  
Caring more about data quality than data quantity

1. Data label quality  
2. Data augmentation  
3. Feature engineering  
4. Data versioning  
5. Domain knowledge  


Benefits of data-centric approach  

The advantages of becoming more data-centric are numerous, ranging from improved reporting speed and accuracy to better-informed decision-making. Data-centric infrastructure comes with lots of benefits:  
  
    Improves accuracy, using data as a strategic asset effectively assures more precise estimates, observations, and decisions.   
    Eliminates complex data transformations.  
    Reduces data errors and inconsistencies.  
    Provides valuable insights into internal and external trends that help you make better decisions.  
    Reduces expenses.  
    Makes data more accessible to key stakeholders.  
    Reduce data redundancy.  
    Improves data quality and reliability.  
  
  
  
  












MLOps is concerned with deploying the ML system and the continous evoulution of the models

MLOps principles include

-    Framing ML problems from business objectives
-    Exploratory data analysis (EDA)
-    Architect ML and data solutions for the problem
-    Data Prep and Feature Engineering
-    Model training and experimentation — data science
-    Model training and tuning
-    Building and automating ML pipelines
-    Deploying models to the production system
-    Model review and governance
-    Model inference and serving
-    Model monitoring, optimizing and maintainance
-    Automated model retraining
-    Explainability and interpretability


Machine Learning frameworks such as Keras, PyTorch, Tensorflow
Popular MLOps frameworks like Kubeflow, MLFlow, and DataRobot
Continuous model monitoring and maintenance with focus on:
Feedback loop
Data Drift
Seasonality


This MLOps setup includes the following components:

-    Source control
-    Test and build services
-    Deployment services
-    Model registry
-    Feature store
-    ML metadata store
-    ML pipeline orchestrator.



ML Ops Tools:
- Kubeflow
- MLflow
- Metaflow
- MLReef
- Kedro
- ZenML
- MLRun
- CML
- Cortex Lab
- Seldon Core
- AutoKeras
- H2O AutoML
- Hadoop
- Spark
- Jupyter Notebook
- Data Version Control (DVC)
- Pachyderm
- Flyte


 


## Migrating Apache Spark ML Jobs to Spark + Tensorflow on Kubeflow  
- Install Kubeflow on kubeflow ( use the spark-operator )   
- Use spark in notebook on KF  
- Take Spark job and split it into feature prep and model training  
- have the feature prep job save results in a TF-compatible format  
- create a TF-job  
- Create a Kubeflow (or Argo..) pipeline to train the new model  
- Optional: Use katib to do hyper-parameter tuning  
- Validate if the classic ML or new fancy ML works better  


A traditional Spark ML pipeline  
```
prepPipeline.setStages(Array(
 extensionIndexer,
 tokenizer,
 word2vec,
 featureVec, calssifier))
```
Splitting the Spark ML pipline  
```
prepPipeline.setStages(Array(
 extensionIndexer,
 tokenizer,
 word2vec,
 featureVec))  
```
Making a TF job to use the Spark job output  



## Kubeflow is a Buffet and it includes many options  
- argo  
- automation  
- chainer-job  
- core  
- credential-pod-preset  
- katlib  
- mpi-job  
- mxnet-job  
- openmpi  
- pachyderm  
- pytorch-job  
- seldon  
- spark  
- tfServing  

In General the peices in ML should inclde  
- ML libraries  
- ML models which are version controlled  
- data prep  
- Model management (persistance/deployment/CI)  
- Model Serving  



Research is great  
Everyone else have to manage and put models in prod  
Kubeflow bridges the gap from lab to production  
Allows to answer questions like  
- We want to know in the middle of quarter Why sales are down, and How to fix them  





```
How to Make Your Choice between Saprk Dask and Ray (hint: do you really need to?)

Now that we've looked at the pros and cons of Spark, Dask, and Ray —and after briefly discussing the Dask-on-Ray hybrid— it is clear that this won't be the case of "one size fits all." The three frameworks have had different design goals from the get-go, and trying to shoehorn fundamentally different workflows into a single one of them is probably not the wisest choice. A much better approach would be to design your data science process and accompanying infrastructure with flexibility in mind, ideally enabling you to spin up and use the right tool for the job. A typical pipeline could involve some ETL-like data processing conducted in Spark, followed by a machine learning workflow executed in Ray. A platform that provides the freedom to run both in a controlled, fault-tolerant, and on-demand manner enables the data science team to leverage the benefits of both frameworks.
```
# Links  


[https://dvc.org/](https://dvc.org/)  
[https://mlflow.org/](https://mlflow.org/)  
[https://c17hawke.github.io/wafer_mlops_docs/](https://c17hawke.github.io/wafer_mlops_docs/)  
[https://cloud.google.com/architecture/mlops-continuous-delivery-and-automation-pipelines-in-machine-learning](https://cloud.google.com/architecture/mlops-continuous-delivery-and-automation-pipelines-in-machine-learning)  
[https://chicagodatascience.github.io/MLOps/lecture6/spark_envs/](https://chicagodatascience.github.io/MLOps/lecture6/spark_envs/)  

[https://towardsdatascience.com/data-centric-vs-model-centric-ai-the-answer-is-clear-4b607c58af67](https://towardsdatascience.com/data-centric-vs-model-centric-ai-the-answer-is-clear-4b607c58af67)  



[https://dvc.org/doc/use-cases/versioning-data-and-model-files/tutorial](https://dvc.org/doc/use-cases/versioning-data-and-model-files/tutorial)  
[https://blog.keras.io/building-powerful-image-classification-models-using-very-little-data.html](https://blog.keras.io/building-powerful-image-classification-models-using-very-little-data.html)  



[https://github.com/GoogleCloudPlatform/data-science-on-gcp](https://github.com/GoogleCloudPlatform/data-science-on-gcp)  



[What is Vertex AI?](https://youtu.be/gT4qqHMiEpA)  
[https://cloud.google.com/vertex-ai](https://cloud.google.com/vertex-ai)  



[https://cloud.google.com/vertex-ai/docs/pipelines/migrate-kfp](https://cloud.google.com/vertex-ai/docs/pipelines/migrate-kfp)  

[https://stackoverflow.com/questions/70358400/kubeflow-vs-vertex-ai-pipelines](https://stackoverflow.com/questions/70358400/kubeflow-vs-vertex-ai-pipelines)  
[https://medium.com/datasparq-technology/kubeflow-pros-and-cons-kubeflow-vs-airflow-vs-sagemaker-4942d7e7910a](https://medium.com/datasparq-technology/kubeflow-pros-and-cons-kubeflow-vs-airflow-vs-sagemaker-4942d7e7910a)  
[https://medium.com/@vignesh093/running-preprocessing-and-ml-workflow-in-kubeflow-with-google-dataproc-84103a9ef67e](https://medium.com/@vignesh093/running-preprocessing-and-ml-workflow-in-kubeflow-with-google-dataproc-84103a9ef67e)  







[https://www.arrikto.com/blog/kubeflow/news/minikf-a-fast-and-easy-way-to-deploy-kubeflow-on-your-laptop/](https://www.arrikto.com/blog/kubeflow/news/minikf-a-fast-and-easy-way-to-deploy-kubeflow-on-your-laptop/)
[Introduction to Kubeflow: Fundamentals - Install MiniKF 1.4 on GCP](https://youtu.be/6QdVAbjnoXI)
[webinar MiniKF: Kubeflow on your laptop](https://youtu.be/oDGr6biTvwQ)
[Migrating Apache Spark ML Jobs to Spark + Tensorflow on Kubeflow - Holden Karau Independent](https://youtu.be/0P5WO8f8qJg)









[https://cloud.google.com/architecture/mlops-continuous-delivery-and-automation-pipelines-in-machine-learning](https://cloud.google.com/architecture/mlops-continuous-delivery-and-automation-pipelines-in-machine-learning)
[https://cloud.google.com/architecture/architecture-for-mlops-using-tfx-kubeflow-pipelines-and-cloud-build](https://cloud.google.com/architecture/architecture-for-mlops-using-tfx-kubeflow-pipelines-and-cloud-build)
[https://neptune.ai/mlops-tool-stack](https://neptune.ai/mlops-tool-stack)
[https://neptune.ai/blog/best-open-source-mlops-tools](https://neptune.ai/blog/best-open-source-mlops-tools)
[https://www.kubeflow.org/docs/components/pipelines/introduction/](https://www.kubeflow.org/docs/components/pipelines/introduction/)
[https://neptune.ai/blog/ways-ml-teams-use-ci-cd-in-production](https://neptune.ai/blog/ways-ml-teams-use-ci-cd-in-production)
[How does Ray compare to Apache Spark??](https://youtu.be/yLKHHiT2nWw)
[Introduction to Distributed Computing with the Ray Framework](https://youtu.be/cEF3ok1mSo0)
[Autoscaling machine learning APIs in Python with Ray](https://youtu.be/Xa_94PuUYQI)
[https://tryolabs.com/guides/retail-innovations-machine-learning](https://tryolabs.com/guides/retail-innovations-machine-learning)
[https://medium.com/@karl.utermohlen/4-applications-of-machine-learning-ml-in-retail-f637c2fe196a](https://medium.com/@karl.utermohlen/4-applications-of-machine-learning-ml-in-retail-f637c2fe196a)
[https://analyticsindiamag.com/how-can-ai-iot-data-help-streamline-vehicle-rental-services/](https://analyticsindiamag.com/how-can-ai-iot-data-help-streamline-vehicle-rental-services/)
[https://towardsdatascience.com/ai-and-real-state-renting-in-amsterdam-part-1-5fce18238dbc](https://towardsdatascience.com/ai-and-real-state-renting-in-amsterdam-part-1-5fce18238dbc)
[https://venturebeat.com/2021/11/04/using-ai-to-verify-renter-eligibility-and-risk/](https://venturebeat.com/2021/11/04/using-ai-to-verify-renter-eligibility-and-risk/)



[Deep Reinforcement Learning-Based Dynamic Scheduling in Smart Manufacturing](https://youtu.be/AE7Mz21dYww)  
[AlphaDow: Reinforcement Learning for Industrial Production Scheduling - Adam Kelloway, Dow Chemical](https://youtu.be/DQm3e7mMBt4)  

[Deep Reinforcement Learning in Python Tutorial - A Course on How to Implement Deep Learning Papers](https://youtu.be/GJJc1t0rtSU)  




[https://docs.ray.io/en/latest/cluster/kubernetes.html](https://docs.ray.io/en/latest/cluster/kubernetes.html)  

[Distributed Computing is the Future of Computing with Robert Nishihara](https://youtu.be/zRaWCFJcagI)  



[https://cloud.google.com/dataproc/docs/guides/dpgke/quickstarts/dataproc-gke-quickstart-create-cluster](https://cloud.google.com/dataproc/docs/guides/dpgke/quickstarts/dataproc-gke-quickstart-create-cluster)  


[https://www.slideshare.net/databricks/migrating-apache-spark-ml-jobs-to-spark-tensorflow-on-kubeflow](https://www.slideshare.net/databricks/migrating-apache-spark-ml-jobs-to-spark-tensorflow-on-kubeflow)  

[https://learnopencv.com/pytorch-to-tensorflow-model-conversion/](https://learnopencv.com/pytorch-to-tensorflow-model-conversion/)  


[How does Ray compare to Apache Spark??](https://youtu.be/yLKHHiT2nWw)  
[Introduction to Distributed Computing with the Ray Framework](https://youtu.be/cEF3ok1mSo0)  
[Autoscaling machine learning APIs in Python with Ray](https://youtu.be/Xa_94PuUYQI)  
[https://towardsdatascience.com/deep-learning-with-apache-spark-part-1-6d397c16abd](https://towardsdatascience.com/deep-learning-with-apache-spark-part-1-6d397c16abd)  


[https://eng.lyft.com/flyte-joins-lf-ai-data-48c9b4b60eec](https://eng.lyft.com/flyte-joins-lf-ai-data-48c9b4b60eec)  

[https://github.com/flyteorg/flyte](https://github.com/flyteorg/flyte)  
[https://www.union.ai/](https://www.union.ai/)  
[https://www.ray.io/](https://www.ray.io/)  
[https://github.com/ray-project/ray](https://github.com/ray-project/ray)  

[https://medium.com/riselab/rayonspark-running-emerging-ai-applications-on-big-data-clusters-with-ray-and-analytics-zoo-923e0136ed6a](https://medium.com/riselab/rayonspark-running-emerging-ai-applications-on-big-data-clusters-with-ray-and-analytics-zoo-923e0136ed6a)  
[https://www.businesswire.com/news/home/20201021005541/en/Anyscale-Announces-40M-in-Series-B-Funding-Led-by-NEA](https://www.businesswire.com/news/home/20201021005541/en/Anyscale-Announces-40M-in-Series-B-Funding-Led-by-NEA)  

[https://docs.flyte.org/projects/cookbook/en/latest/](https://docs.flyte.org/projects/cookbook/en/latest/)  
[https://lfaidata.foundation/blog/2021/03/17/flyte-joins-lf-ai-data-as-new-incubation-project/](https://lfaidata.foundation/blog/2021/03/17/flyte-joins-lf-ai-data-as-new-incubation-project/)  


[https://medium.com/paypal-tech/tuning-spark-applications-to-efficiently-utilize-dataproc-cluster-11bd51b36fe1](https://medium.com/paypal-tech/tuning-spark-applications-to-efficiently-utilize-dataproc-cluster-11bd51b36fe1)  
[https://towardsdatascience.com/the-what-why-and-when-of-apache-spark-6c27abc19527](https://towardsdatascience.com/the-what-why-and-when-of-apache-spark-6c27abc19527)  
[https://eng.lyft.com/lyftlearn-ml-model-training-infrastructure-built-on-kubernetes-aef8218842bb](https://eng.lyft.com/lyftlearn-ml-model-training-infrastructure-built-on-kubernetes-aef8218842bb)  
[https://eng.lyft.com/ml-feature-serving-infrastructure-at-lyft-d30bf2d3c32a](https://eng.lyft.com/ml-feature-serving-infrastructure-at-lyft-d30bf2d3c32a)  
[https://eng.lyft.com/how-lyftlearn-democratizes-distributed-compute-through-kubernetes-spark-and-fugue-c0875b97c3d9](https://eng.lyft.com/how-lyftlearn-democratizes-distributed-compute-through-kubernetes-spark-and-fugue-c0875b97c3d9)  






[https://www.bmc.com/blogs/hadoop-cloud-native-kubernetes/](https://www.bmc.com/blogs/hadoop-cloud-native-kubernetes/)  
[https://www.databricks.com/session/hdfs-on-kubernetes-lessons-learned](https://www.databricks.com/session/hdfs-on-kubernetes-lessons-learned)  
[https://techgenix.com/kubernetes-hadoop-big-data/](https://techgenix.com/kubernetes-hadoop-big-data/)  


[https://itnext.io/running-spark-job-on-kubernetes-minikube-958cadaddd55](https://itnext.io/running-spark-job-on-kubernetes-minikube-958cadaddd55)  
[https://kienmn97.medium.com/deployment-of-standalone-spark-cluster-on-kubernetes-ba15978658bf](https://kienmn97.medium.com/deployment-of-standalone-spark-cluster-on-kubernetes-ba15978658bf)   
[https://towardsdatascience.com/apache-spark-with-kubernetes-and-fast-s3-access-27e64eb14e0f](https://towardsdatascience.com/apache-spark-with-kubernetes-and-fast-s3-access-27e64eb14e0f)  


[https://www.dominodatalab.com/blog/spark-dask-ray-choosing-the-right-framework](https://www.dominodatalab.com/blog/spark-dask-ray-choosing-the-right-framework)  
[https://docs.ray.io/en/latest/data/raydp.html](https://docs.ray.io/en/latest/data/raydp.html)  



[https://vishnudeva.medium.com/scaling-applications-on-kubernetes-with-ray-23692eb2e6f0](https://vishnudeva.medium.com/scaling-applications-on-kubernetes-with-ray-23692eb2e6f0)  
[https://scalingpythonml.com/2020/08/16/poke-at-ray.html](https://scalingpythonml.com/2020/08/16/poke-at-ray.html)  




