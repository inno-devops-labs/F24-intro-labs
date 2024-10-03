# Task 1

## AWS

### Amazon Elastic Container Registry

- Docker container image storage and management
- Integration with other AWS services(ECS, EKS and ets)
- Image scanning for vulnrabilities

### AWS Artifacts

- Dependency management (supports NPM, Maven, PyPI, and NuGet) 
- Artifact caching to reduce build time

## GCP

### Google Container  Registry

- Docker container image storage and management
- Integration with Google Kubernetes Engine (GKE) and Cloud Run
- IAM-based access control and encryption support

### Google Artifact Registry

- Supports container images and additional artifact types (Maven, NPM, PyPI)
- Improved GKE integration compared to GCR
- Regional repositories for performance optimization

## Azure

### Azure Container Registry

- Management of Docker and Open Container Initiative images
- Integration with Azure Kubernetes Service and other Azure services
- Vulnerability scanning, data encryption, and Azure Active Directory integration

### Azure Artifacts

- Package management for Maven, NPM, NuGet, and Python ecosystems
- Integration with Azure DevOps for dependency and artifact management
- Caching of external packages to speed up builds

# Task 2


## AWS (Amazon Web Services)

### AWS Lambda

- **Description:** AWS Lambda allows you to run code in response to events, making it easier to create microservices and automate processes without managing infrastructure

- **Key Features:**
  - Event-driven execution (e.g., from S3, DynamoDB, API Gateway)
  - Supports multiple programming languages (Node.js, Python, Java, Go, etc.)
  - Automatic scaling based on the number of function invocations
  - Integration with other AWS services
  - "Provisioned concurrency" option for improved response times

## GCP (Google Cloud Platform)

### Google Cloud Run

- **Description:** Google Cloud Run is a platform for running containerized applications that automatically scales based on traffic. It's perfect for developers looking to quickly deploy applications and leverage the benefits of containerization without managing server infrastructure

- **Key Features:**
  - Supports running containerized applications based on events.
  - Scales down to zero when idle, automatically scaling up with increased traffic
  - Full container support, allowing any program to run in containers
  - Integration with Google Kubernetes Engine (GKE)
  - Pay only for the resources actually used

## Azure

### Azure Functions

- **Description:** Azure Functions allows running code without managing servers, simplifying task automation and API creation

- **Key Features:**
  - Supports executing code in response to events (e.g., HTTP requests, queue messages)
  - Automatic scaling based on load
  - Supports multiple programming languages (C#, Java, Python, JavaScript, etc.)
  - Integration with other Azure services (Logic Apps, Event Grid, etc.)
  - Pay only for the actual execution time of functions