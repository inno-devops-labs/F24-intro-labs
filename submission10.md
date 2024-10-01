# Cloud Computing Lab - Artifact Registries and Serverless Computing Platforms

## Task 1: Artifact Registries Research

**Artifact registries** are services designed to store and manage software artifacts like Docker container images, dependencies, packages, and binary files. They are used to:
- Keep all versions of your software artifacts in one place.
- Provide security features such as access control, encryption, etc.
- Help manage versions of artifacts for easy rollback, updates, and reproducibility.


### AWS Artifact Registry

**AWS Elastic Container Registry (ECR)**

Features:

- Fully managed Docker container registry.
  
- Supports both public and private repositories.

- Integrated with Amazon ECS, EKS, and Lambda for seamless deployment.


ECR works similarly to Docker Hub, but a key feature is its support for private repositories. 

### GCP Artifact Registry

**Google Artifact Registry**

Features:

- Supports multiple package formats (Docker, Maven, npm, etc.).
- Fine-grained access control and security policies.
- Integrated with Google Cloud Build for CI/CD workflows.
  
### Azure Artifacts

**Azure Artifacts**

Features:

- Supports NuGet, npm, Maven, and Python package feeds.

- Allows for sharing packages across teams and projects.

- Integrated with Azure DevOps for build and release pipelines.

## Task 2: Serverless Computing Platform Research

**Serverless computing** abstracts away the underlying infrastructure, allowing developers to run applications without having to manage servers. 

It helps to make software projects more scalable and agile.

### AWS Lambda

Key Features:

- Runs code in response to events without provisioning servers.

- Supports multiple languages (Node.js, Python, Java, etc.).
  
- Scales automatically and only charges for the compute time consumed.
  
### Google Cloud Functions

Key Features:

- Executes code in response to HTTP requests or events from GCP services.

- Supports multiple runtimes (Node.js, Python, Go, etc.).
  
- Integrated with other GCP services for seamless event-driven architectures.
  
### Azure Functions

Key Features:

- Allows running code on-demand without needing to manage infrastructure.
  
- Supports a variety of languages (C#, JavaScript, Python, etc.).

- Offers a flexible consumption plan for cost efficiency.