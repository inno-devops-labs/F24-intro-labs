
# Lab 10: Cloud Computing - Artifact Registries and Serverless Computing Platforms

## Task 1: Artifact Registries Research

### Artifact Registries in AWS, GCP, and Azure

### 1. AWS

#### **Amazon Elastic Container Registry (ECR)**
- **Key Features**:
  - Fully managed Docker container registry.
  - Securely store, manage, and deploy Docker container images.
  - Integrated with Amazon ECS, EKS, and Lambda for easy deployment.
  - Supports image scanning for vulnerabilities.
  - Lifecycle policies to manage image versions.

#### **AWS CodeArtifact**
- **Key Features**:
  - Fully managed artifact repository service.
  - Supports multiple package formats including Maven, npm, and PyPI.
  - Integrates with AWS CodeBuild and other AWS developer tools.
  - Fine-grained access control via AWS Identity and Access Management (IAM).
  - Easy package versioning and dependency management.

### 2. GCP

#### **Google Container Registry (GCR)**
- **Key Features**:
  - Fully managed Docker image storage.
  - Integrated with Google Kubernetes Engine (GKE).
  - Private, secure storage for container images.
  - Image vulnerability scanning.
  - Supports multi-region and multi-zonal repositories.

#### **Google Artifact Registry**
- **Key Features**:
  - Unified repository for multiple artifact formats (Docker, Maven, npm).
  - Integrated with Google Cloud services for CI/CD workflows.
  - Fine-grained access controls and permissions.
  - Automated version management and dependency resolution.
  - Enhanced security features including vulnerability scanning.

### 3. Azure

#### **Azure Container Registry (ACR)**
- **Key Features**:
  - Managed Docker container registry service.
  - Integrated with Azure Kubernetes Service (AKS).
  - Geo-replication for high availability across regions.
  - Image scanning for security vulnerabilities.
  - Supports Helm charts for Kubernetes deployments.

#### **Azure Artifacts**
- **Key Features**:
  - Universal package management with support for NuGet, npm, Maven, and more.
  - Integrated with Azure DevOps for CI/CD workflows.
  - Fine-grained access control with Azure Active Directory.
  - Package versioning and retention policies.
  - Publish and consume packages easily within teams.

## Task 2: Serverless Computing Platform Research

### Serverless Computing Platforms in AWS, GCP, and Azure

### 1. AWS

#### **AWS Lambda**
- **Key Features**:
  - Run code in response to events without provisioning servers.
  - Supports multiple programming languages (Python, Node.js, Java, etc.).
  - Automatic scaling with no need to manage infrastructure.
  - Integrated with a wide range of AWS services (S3, DynamoDB, API Gateway).
  - Pay only for compute time consumed (measured in milliseconds).

### 2. GCP

#### **Google Cloud Functions**
- **Key Features**:
  - Event-driven serverless platform for building microservices.
  - Supports multiple languages (Node.js, Python, Go, etc.).
  - Integrated with Google Cloud services for seamless workflows.
  - Automatic scaling based on incoming requests.
  - Pay-per-execution pricing model.

### 3. Azure

#### **Azure Functions**
- **Key Features**:
  - Serverless compute service to run event-driven code.
  - Supports multiple programming languages (C#, Java, JavaScript, Python, etc.).
  - Integrated with Azure services and third-party APIs.
  - Automatic scaling based on demand.
  - Consumption plan that allows pay-per-execution billing.

