## Task 1: Artifact Registries Research

### AWS Artifact Registries

- **Amazon Elastic Container Registry (ECR)**
  - A fully managed service for storing and sharing Docker container images.
  - Seamless integration with other AWS services like Amazon ECS, EKS, and Lambda.
  - Supports not only container images but also OCI artifacts.
  - **Security-focused**: offers image vulnerability scanning to help catch issues early.

- **AWS CodeArtifact**
  - This service is perfect for managing software packages such as Maven, npm, PyPI, and NuGet.
  - Works great with AWS CodeBuild and CI/CD workflows.
  - **Security and access control**: handled using IAM, ensuring only the right people have access to packages.

### GCP Artifact Registries

- **Google Artifact Registry**
  - A versatile, fully managed registry supporting various formats: containers, Maven, npm, and PyPI.
  - Excellent integration with Google Kubernetes Engine (GKE).
  - **Enhanced features**: includes vulnerability scanning and metadata management.
  - Robust security with Google Cloud IAM access control.

- **Google Container Registry**
  - Another option for managing Docker images, but a bit more container-specific compared to Artifact Registry.
  - Integrates well with Google Cloud Build and GKE.
  - Offers vulnerability scanning and access control through IAM, just like Google Artifact Registry.
  - **Automation**: automates builds and image pushes.

### Azure Artifact Registries

- **Azure Container Registry**
  - Azure’s solution for container images, Helm charts, and OCI artifacts.
  - **Deep integration** with AKS and CI/CD pipelines for easy deployment.
  - Features like geo-replication ensure your registry works efficiently across different regions.
  - **Security-minded**: includes vulnerability scanning.

- **Azure Artifacts**
  - Azure’s universal package management solution, supporting Maven, npm, PyPI, and NuGet.
  - Works tightly with Azure DevOps to streamline package management in CI/CD pipelines.
  - **Access control**: offers detailed control over who can use and publish packages.
  - Supports upstream sources, letting you use external package feeds while keeping control over what enters your environment.

---

## Task 2: Serverless Computing Platform Research

### AWS Serverless Computing Platforms

- **AWS Lambda**
  - The **quintessential serverless service**. You write code, AWS handles the rest—scaling, provisioning, and managing infrastructure.
  - Supports multiple programming languages and integrates beautifully with other AWS services like API Gateway and DynamoDB.
  - **Pay only for what you use**: Lambda charges based on the compute time your code actually runs.

- **AWS Fargate**
  - A serverless compute engine for containers—**no need to manage EC2 instances**.
  - It powers containerized applications using Amazon ECS and EKS.
  - Best for when you want the benefits of containers but don’t want to manage infrastructure.
  
### GCP Serverless Computing Platforms

- **Google Cloud Functions**
  - A super simple, event-driven compute service that scales automatically.
  - Works with a wide range of Google services and **responds instantly to events**.
  - You only pay for the compute time used when functions are running.

- **Google Cloud Run**
  - A standout service if you’re looking to run containerized applications serverlessly.
  - **Flexibility**: It supports any stateless container, scaling automatically based on demand.
  - Fully integrated with GKE, so you can combine the best of both worlds—containers and serverless.

### Azure Serverless Computing Platforms

- **Azure Functions**
  - Azure’s answer to AWS Lambda: write code and let Azure handle the scaling and provisioning.
  - Supports various triggers, including HTTP requests, timers, and events from other Azure services.
  - You only pay for the time your functions run, making it **cost-effective**.

- **Azure Container Instances (ACI)**
  - Azure’s serverless platform for running containers—**no need for VMs or orchestration**.
  - Best for quickly deploying containers without worrying about the underlying infrastructure.
  - Integrates with Azure Virtual Networks for **secure, private networking**.
