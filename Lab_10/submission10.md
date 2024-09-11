# Task 1: Artifact Registries Research


## 1. AWS Artifact Registries

### - AWS CodeArtifact
- **Aim**: Securely store and share software packages in repositories.
- **Key Features**:
  - Supports many package formats (Maven, npm, NuGet, PyPI, etc).
  - Integrated with AWS CodeBuild and AWS CodePipeline.
  - Secure access via AWS Identity and Access Management (IAM).
  - Automatic dependency resolution.

## 2. GCP Artifact Registries

### - Google Artifact Registry
- **Aim**: Single place for your organization to manage container images and language packages (such as Maven and npm). 
- **Key Features**:
  - Fully managed service to store container images and non-container artifacts.
  - Supports multi-regional locations.
  - Integrated with Google Kubernetes Engine (GKE) and Cloud Run.
  - Vulnerability scanning for images.
  - Fine-grained identity and access management via IAM.
  - Evolution of Google Container Registry.

## 3. Azure Artifact Registries

### Azure Container Registry (ACR)
- **Aim**: Service that stores and distributes container images and related artifacts
- **Key Features**:
  - Fully integrated with Azure Kubernetes Service (AKS) and Azure DevOps.
  - Supports geo-replication for multi-region redundancy.
  - Image vulnerability scanning and patching.
  - Helm chart repositories and OCI artifacts.
  - Fine-grained access control with Azure Active Directory (AAD).


# Task 2: Serverless Computing Platform Research


## 1. AWS Services

### - AWS Lambda
- **Aim**: For running code, managing data, and integrating applications, all without managing servers. 
- **Key Features**:
  - Supports multiple languages (Node.js, Python, Go, etc.).
  - Automatic scaling and pay-per-use pricing.
  - Integrated with other AWS services like API Gateway and DynamoDB.
  - Event-driven execution model.
  - Fine-grained IAM permissions.

## 2. GCP Services

### - Google Cloud Functions
- **Aim**: Run event-driven functions without managing servers.
- **Key Features**:
  - Pay-per-execution model.
  - Automatic scaling.
  - Supports various programming languages (Python, Go, JavaScript, etc).
  - Integrated with GCP services like Cloud Pub/Sub and Firestore.
  - Fine-grained IAM-based access control.

### - Google Cloud Run
- **Aim**: Run containerized applications in a serverless environment.
- **Key Features**:
  - Fully managed container deployment.
  - Scales automatically to zero based on traffic.
  - Supports any programming language via containers.
  - Integrated with GCP services (e.g., Cloud Logging, Cloud Monitoring).
  - Pay-per-use pricing model.

## 3. Azure Services

### - Azure Functions
- **Aim**: Run event-driven code without managing servers.
- **Key Features**:
  - Support for multiple languages (C#, JavaScript, Python, etc.).
  - Automatic scaling based on demand.
  - Integrated with Azure services like Event Grid and Service Bus.
  - Pay-per-execution pricing.
  - Role-based access control via Azure Active Directory.
