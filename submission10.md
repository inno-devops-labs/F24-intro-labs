# Task 1: Artifact Registries in AWS, GCP, and Azure

## AWS (Amazon Web Services)

### 1. Amazon Elastic Container Registry (ECR)

- **Description:** A fully managed container registry that makes it easy for developers to store, manage, and deploy Docker container images.
- **Key Features:**
  - Integration with Amazon ECS, EKS, and Lambda.
  - Supports private and public repositories.
  - Image vulnerability scanning.
  - Lifecycle policies for automated image cleanup.
  - Encryption at rest with AWS Key Management Service (KMS).
  - Fine-grained access control using AWS IAM.

### 2. AWS CodeArtifact

- **Description:** A fully managed artifact repository service that enables organizations to securely store, publish, and share software packages used in their development process.
- **Key Features:**
  - Supports multiple package formats: Maven, Gradle, npm, Yarn, Twine (Python), and NuGet.
  - Seamless integration with AWS CodeBuild and other CI/CD tools.
  - Automated software package dependency management.
  - Pay-as-you-go pricing model.
  - Secure cross-account sharing.

## GCP (Google Cloud Platform)

### 1. Google Artifact Registry

- **Description:** A single place for your organization to manage container images and language packages.
- **Key Features:**
  - Supports Docker container images and non-container artifacts (Maven, npm, Python).
  - Integration with Google Kubernetes Engine (GKE) and Cloud Build.
  - Regional and multi-regional repositories.
  - VPC Service Controls for enhanced security.
  - IAM-based access control.

### 2. Google Container Registry (GCR)

- **Description:** A private Docker image storage system on Google Cloud.
- **Key Features:**
  - Global availability of container images.
  - Integration with GCP services like GKE and Cloud Run.
  - Vulnerability scanning of container images.
  - Automated backups and redundancy.
  - **Note:** GCR functionality is being migrated to Google Artifact Registry.

## Azure

### 1. Azure Container Registry (ACR)

- **Description:** A managed, private Docker registry service based on the open-source Docker Registry 2.0.
- **Key Features:**
  - Geo-replication across multiple Azure regions.
  - Integrated with Azure Kubernetes Service (AKS) for seamless deployments.
  - Supports Helm charts and OCI artifacts.
  - Task automation for image builds and maintenance.
  - Content trust for image integrity.
  - Authentication via Azure Active Directory.

### 2. Azure Artifacts

- **Description:** A universal package management system that hosts all of your packages, from Maven, npm, NuGet, Python, and more.
- **Key Features:**
  - Integrated with Azure DevOps for streamlined CI/CD processes.
  - Upstream sources to manage dependencies from public registries.
  - Scoped feeds for granular access control.
  - Flexible retention policies.
  - Unified tooling for package management.

# Task 2: Serverless Computing Platforms in AWS, GCP, and Azure

## AWS (Amazon Web Services)

### 1. AWS Lambda

- **Description:** A serverless compute service that lets you run code without provisioning or managing servers.
- **Key Features:**
  - Supports various programming languages: Node.js, Python, Java, C#, Go, Ruby, and PowerShell.
  - Automatic scaling in response to incoming demand.
  - Pay-per-use pricing model based on compute time.
  - Integration with a wide array of AWS services and third-party applications.
  - Built-in fault tolerance and high availability.
  - Environment variables and versioning support.

### 2. AWS Fargate

- **Description:** A serverless compute engine for containers, compatible with Amazon ECS and Amazon EKS.
- **Key Features:**
  - Eliminates the need to manage servers or clusters.
  - Automatically scales to match application demand.
  - Secure by design with application isolation.
  - Supports Docker containers.
  - Pay for resources per application without over-provisioning.
  - Simplifies container deployment with minimal configuration.

## GCP (Google Cloud Platform)

### 1. Google Cloud Functions

- **Description:** A serverless execution environment for building and connecting cloud services.
- **Key Features:**
  - Supports multiple languages: Node.js, Python, Go, Java, .NET, and Ruby.
  - Event-driven execution in response to cloud events.
  - Automatic scaling based on workload.
  - Pay-per-use billing model.
  - Deep integration with GCP services and Firebase.
  - Built-in security at role and per-function levels.

### 2. Google Cloud Run

- **Description:** A managed compute platform that automatically scales your stateless containers.
- **Key Features:**
  - Runs any containerized application in a serverless fashion.
  - Automatic scaling from zero to N based on traffic.
  - Supports any language or library due to containerization.
  - Integrated logging and monitoring.
  - Simple deployment directly from source or container images.
  - Ability to run services on a fully managed platform or on GKE.

## Azure

### 1. Azure Functions

- **Description:** An event-driven, serverless compute service that helps you run code on-demand without explicitly provisioning or managing infrastructure.
- **Key Features:**
  - Supports programming languages like C#, JavaScript, F#, Java, Python, and PowerShell.
  - Triggered by events from other Azure services or third-party services.
  - Automatic scaling based on demand.
  - Consumption-based pricing model.
  - Integration with Azure services and DevOps tools.
  - Provides deployment slots and extensive monitoring.

### 2. Azure Container Instances (ACI)

- **Description:** A service that offers the fastest and simplest way to run a container in Azure without having to manage any virtual machines.
- **Key Features:**
  - Rapid, straightforward deployment of containers.
  - No need to provision or manage infrastructure.
  - Supports both Linux and Windows containers.
  - Customizable with specific CPU and memory requirements.
  - Per-second billing for compute resources used.
  - Virtual network deployment for secure communication.
