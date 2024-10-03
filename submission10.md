## Task 1: Artifact Registries Research

### AWS Artifact Registries

- **Amazon Elastic Container Registry (ECR)**
  - A fully managed Docker container registry.
  - Integrated with Amazon ECS, EKS, and AWS Lambda.
  - Supports storing container images and OCI artifacts.
  - Enhanced security features with image vulnerability scanning.

- **AWS CodeArtifact**
  - A fully managed service for storing and sharing software packages.
  - Supports multiple package formats (Maven, npm, PyPI, and NuGet).
  - Integrates with AWS CodeBuild and CI/CD pipelines.
  - Secure access with AWS Identity and Access Management (IAM).

### GCP Artifact Registries

- **Google Artifact Registry**
  - A fully managed service for storing container images, Maven, npm, and PyPI artifacts.
  - Supports OCI artifacts and integrates with Google Kubernetes Engine (GKE).
  - Provides vulnerability scanning and metadata management.
  - Enables secure access with Google Cloud Identity and Access Management (IAM).

- **Google Container Registry**
  - Managed Docker container registry.
  - Integrated with Google Cloud Build and Google Kubernetes Engine.
  - Features container vulnerability scanning and access management through IAM.
  - Automated build and push functionalities.

### Azure Artifact Registries

- **Azure Container Registry**
  - A fully managed Docker container registry.
  - Integrated with Azure Kubernetes Service (AKS) and CI/CD pipelines.
  - Features vulnerability scanning and geo-replication.
  - Supports Helm charts and OCI artifacts.

- **Azure Artifacts**
  - A service for storing and sharing Maven, npm, PyPI, and NuGet packages.
  - Integrated with Azure DevOps for continuous delivery.
  - Provides fine-grained access controls and supports upstream sources for packages.
  - Offers universal package repository support.

---

## Task 2: Serverless Computing Platform Research

### AWS Serverless Computing Platforms

- **AWS Lambda**
  - Serverless compute service that automatically scales based on demand.
  - Supports a wide range of programming languages.
  - Integrated with AWS services like API Gateway, S3, and DynamoDB.
  - Features event-driven execution and only charges for the compute time used.

- **AWS Fargate**
  - Serverless compute engine for containers.
  - Removes the need to provision or manage EC2 instances.
  - Works with both Amazon ECS and Amazon EKS.
  - Ideal for microservices architecture.

### GCP Serverless Computing Platforms

- **Google Cloud Functions**
  - Event-driven serverless compute service.
  - Automatically scales in response to traffic.
  - Supports triggers from Google Cloud services and HTTP requests.
  - Simplifies back-end service orchestration.

- **Google Cloud Run**
  - Serverless platform for running containerized applications.
  - Based on Knative, supporting any stateless containers.
  - Automatically scales applications from zero to as many instances as needed.
  - Integrated with GKE for container orchestration.

### Azure Serverless Computing Platforms

- **Azure Functions**
  - Event-driven serverless compute platform.
  - Supports a wide variety of languages and integrates with Azure services.
  - Automatically scales based on the number of events.
  - Supports triggers such as HTTP requests, timers, and Azure Queue storage.

- **Azure Container Instances (ACI)**
  - Serverless platform for running containers.
  - Eliminates the need for virtual machines, handling infrastructure automatically.
  - Supports rapid deployment of containerized workloads.
  - Integrated with Azure Virtual Networks for secure communication.
