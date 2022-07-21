

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
```










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




