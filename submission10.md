## Task 1

### AWS - Amazon Elastic Container Registry

Used to share and deploy container software.

Key features:

- secure sharing and downloading (uses HTTPS with automatic encryption and access controls)
- fast, easy, scalable and reliable
- can identify software vulnerabilities in the container images using image scanning
- helps to manage the lifecycle of the images in repositories (for example, based on the given rules clean some images)

### GCP - Google Artifact Registry
Used to store and manage packages and Docker container images.

Key features:
- integration with Google Cloud CI/CD services or your existing CI/CD tools
- protection of the software supply chain

### Azure - Azure Artifacts

Helps to manage and share dependencies for developers.

Key features:
- supports NuGet, npm, Python, Maven, Cargo, and Universal Packages
- allows to add packages to any pipeline
- share code across small teams and large enterprise
- protects packages in your feed

## Task 2
### AWS - Lambda
**Lambda** is a serverless compute service for running code.

Key features:
- does not require provisioning, configuration and maintenance of servers
- automatic scaling of underlying infrastructure based on the requests
- pay-as-you-go: pay only for time when you are using the server
- performance optimization by memory management

### AWS - Fargate

**AWS Fargate** is a serverless computing engine that allows you to run containers in the cloud without having to manage the underlying infrastructure.

Key features:

- no operational overhead to scale, patch, help secure, and manage servers
- build-in monitoring
- workload isolation for security
- pay-as-you-go: payment corresponds to the consumed resources

### GCP - Cloud Run
**Cloud Run** is a platform that allows to run the code directly on the Google infrastructure.

Key features:
- supports all languages and frameworks
- automatically scales containers allowing to pay only for time when the code is actually running
- offers access to NVIDIA L4 GPUs
- direct creation and deployment of functions
- automatic build and deployment of the code whenever new commits are pushed to a given branch of a Git repository
- allows batch processing with instances running in parallel
- direct VPC connectivity: secure communication of servers or resources inside your VPC.

### Azure - Azure Functions
**Azure Functions** is a serverless compute service to execute event-driven code.

Key features:
- development of event-driven apps
- app scaling
- development of serverless applications with built-in DevOps tools that simplify the development and management processes 
- flexible hosting options

