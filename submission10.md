# Introduction to DevOps Lab 10
## Ruslan Izmailov B22-DS-01 

### Task 1: Artifact Registries Research

#### Amazon Web Services
##### AWS CodeArtifact
https://aws.amazon.com/codeartifact 
Key features: 
1. Provides access control, encryption, and versioning features.
2. Supports popular package formats and integrates with different IDEs. 


##### Amazon Elastic Container Registry (ECR)
https://aws.amazon.com/ecr/
Key features: 
1. Fully-managed Docker container registry. 
2. Integrates with AWS services like Amazon Elastic Kubernetes Service (EKS) and AWS Fargate.


#### Google Cloud Platform 
##### Google Artifact Registry
https://cloud.google.com/artifact-registry/docs/overview
Key features: 
1. Supports both packages and docker containers. 
2. Provides an instrument for transition from other service. 
3. Has a lot of practical guides in documentation. 
4. Has vulnerability scanning feature. 

#### Azure 
##### Azure Artifacts
https://azure.microsoft.com/en-us/products/devops/artifacts
Key features: 
1. Provides Azure Pipelines CI/CD tool to automatically build and release self-created artifacts. 
2. Has free trial period (1 month). 
3. Can be easily integrated with different IDEs. 

### Task 2: Serverless Computing Platform Research
#### Amazon Web Services
##### AWS Lambda
https://aws.amazon.com/lambda/
Key features: 
1. Automatically manages the compute resources
2. Supports integration with various AWS services
3. Save costs by paying only for the compute time you use by the millisecond

#### Google Cloud Platform 
##### Google Cloud Run Functions
https://cloud.google.com/functions#key-features
Key features: 
1. Supports integration with various GCP services.
2. Cloud Run functions automatically manages and scales underlying infrastructure with the size of workload.

##### Google Cloud Workflows
https://cloud.google.com/workflows#key-features
Key features: 
1. Self-documented workflows 
2. Supports integration with various GCP services.
3. Integrated logging and monitoring


#### Azure 
##### Azure Functions
https://azure.microsoft.com/en-us/products/functions
Key features: 
1. Flexible hosting options
2. Built in orchestration tools
3. Supports integration with Microsoft services
4. Has built in tools to work with generative AI.  

##### Azure Event Grid      
https://learn.microsoft.com/en-us/azure/event-grid/overview
Key features: 
1. Provides filtering and routing features to control event flow.
2. Flexible Event Consumption Model: allowing consumers to consume events using pull or push delivery mode
3. Usage of modern MQTT Messaging protocol, what useful for creation data pipelines. 
