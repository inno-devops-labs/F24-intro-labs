# Task 1: Artifact Registries Research

### AWS CodeArtifact
AWS CodeArtifact is a fully managed software package management solution that enables organizations to store, publish, 
and share software packages and libraries needed for development. It supports major package formats (e.g., npm, pip, Maven)
and serves as a mirror for public repositories.

#### Key Points:
1) Functionality:
    - Stores Packages: Organizes packages in repositories within a single domain for easy access and sharing across development teams.
    - Package Management: Connects to public repositories for importing open-source packages.
2) Types of Artifacts:
    - Deployment Artifacts: Executables for public use (e.g., .deb, .exe).
    - Library Artifacts: Packages for use in other development efforts (e.g., npm, Maven).
    - Bundle Artifacts: Collections of multiple artifacts for deployment.
    - Pipeline Artifacts: Temporary files or results used in CI/CD processes.
3) Features:

   - High Availability and Resilience: Uses Amazon S3 and DynamoDB for data storage.
   - Managed Service: Reduces the need for infrastructure maintenance.
   - VPC Accessibility: Uses AWS PrivateLink for secure access.
   - Integration with Package Managers: Simplifies package publishing and sharing.
   - Supports Docker.
   - No upfront costs; pay for storage, requests, and data transfer.

### GCP
Google Cloud Artifact Registry is a centralized service for storing and managing software packages and Docker container 
images. It integrates with Google Cloud's CI/CD tools and provides robust security features for protecting your software 
supply chain.

#### Key Points:
1) Centralized Storage:
    - Manage packages and Docker images in a single location.
    - Create multiple regional repositories within a Google Cloud project for better organization.

2) Integration:
    - Works with Google Cloud CI/CD services, including Cloud Build.
    - Deploy artifacts to various Google Cloud runtimes (GKE, Cloud Run, Compute Engine, App Engine).

3) Security:
    - Protects the software supply chain with features like Artifact Analysis for vulnerability scanning and Binary Authorization for enforcing deployment policies.
    - Supports VPC Service Controls for securing repositories.

4) Dependency Management:
    - Caches dependencies from public sources and enables scanning for vulnerabilities.
    - Virtual repositories group remote and private repositories for easier access.

5)  Software Delivery Shield:
    - A comprehensive security solution that enhances the security of the software supply chain by integrating with Google Cloud services.

### Azure Artifacts

`A little known about Azure...`

Azure Artifacts allows developers to manage dependencies in one place, for instance, they can:

- Publish packages to feeds and share them within teams, across organizations, or publicly.
- Consume packages from various feeds and public registries like NuGet.org or npmjs.com.
- Use supported package types include NuGet, npm, Python, Maven, Cargo, and Universal Packages.


# Task 2: Serverless Computing Platform Research

### AWS

**Key Components of AWS Serverless Computing**

1. **AWS Lambda:**
   - A core serverless compute service that lets you run code in response to events, such as HTTP requests, changes in data, or modifications to files in Amazon S3.
   - Supports multiple programming languages (Node.js, Python, Java, Go, etc.) and automatically scales based on incoming requests.
   - Ideal for microservices, data processing, and real-time stream processing.

2. **Amazon API Gateway:**
   - A fully managed service that enables you to create, publish, and manage APIs for your applications.
   - Works seamlessly with AWS Lambda to create serverless backends for your APIs.
   - Provides features such as request/response transformation, authorization, and caching.

3. **AWS Fargate:**
   - A serverless compute engine for containers that works with Amazon ECS (Elastic Container Service) and EKS (Elastic Kubernetes Service).
   - Eliminates the need to manage servers and allows you to focus on deploying and managing your containers.
   - Automatically scales resources based on demand, ensuring optimal performance.

4. **Amazon S3 (Simple Storage Service):**
   - While primarily a storage service, S3 can trigger AWS Lambda functions in response to events, enabling serverless data processing workflows.
   - Ideal for storing and managing data, images, and videos used in serverless applications.

### GCP
**Key Components of GCP Serverless Computing**

1. **Cloud Functions:**
   - A lightweight, event-driven compute service that allows you to run small pieces of code (functions) in response to events, such as HTTP requests, Cloud Pub/Sub messages, or changes to Cloud Storage.
   - Supports multiple programming languages (Node.js, Python, Go, etc.) and automatically scales based on demand.
   - Ideal for microservices, data processing, and real-time file processing.

2. **Cloud Run:**
   - A fully managed compute platform that automatically scales your containerized applications in response to incoming traffic.
   - Supports any language or runtime that can be packaged in a container, allowing you to leverage existing code and libraries.
   - Provides seamless integration with other GCP services and offers HTTP-based invocation, making it suitable for web applications and APIs.

3. **App Engine:**
   - A platform-as-a-service (PaaS) that enables you to build scalable web applications and mobile backends without managing the underlying infrastructure.
   - Offers built-in services like user authentication, NoSQL databases (Datastore), and caching (Memorystore).
   - Supports multiple programming languages (Java, Python, PHP, Go, etc.) and automatically scales your application based on traffic.

4. **Firebase:**
   - A platform for building mobile and web applications that provides a suite of tools, including real-time databases, authentication, hosting, and analytics.
   - Firebase Functions allows you to run serverless backend code in response to Firebase events, such as changes in the database or user authentication.

### Azure
**Key Components of Azure Serverless Computing**

1. **Azure Functions:**
   - A serverless compute service that allows you to run event-driven code without provisioning or managing servers.
   - Supports multiple programming languages, including C#, Java, JavaScript, Python, and PowerShell.
   - Ideal for building APIs, processing data, integrating systems, and creating microservices.

2. **Azure Logic Apps:**
   - A cloud-based service that enables you to automate workflows and integrate applications and data across different services.
   - Uses a visual designer to create workflows and orchestrate business processes without writing code.
   - Connects with various services, including Office 365, Salesforce, and custom APIs.

3. **Azure Event Grid:**
   - A fully managed event routing service that enables you to build event-driven applications by routing events from various sources to handlers.
   - Facilitates seamless integration between different Azure services, such as Azure Functions and Logic Apps.
   - Supports custom events from your applications or third-party services.

4. **Azure Container Instances (ACI):**
   - A serverless container service that allows you to run containers without managing servers or virtual machines.
   - Ideal for running short-lived tasks, batch jobs, or microservices that need quick scaling.
   - Supports Linux and Windows containers and integrates with Azure Kubernetes Service (AKS).

5. **Azure API Management:**
   - A fully managed service that enables you to publish, secure, and analyze APIs.
   - Works seamlessly with Azure Functions to create serverless APIs.
   - Provides features like traffic management, security policies, and analytics.
