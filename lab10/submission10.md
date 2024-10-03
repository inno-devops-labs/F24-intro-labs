# Task 1. Artifact Registries Research

> Artifact Registry provides a single location for storing and managing your packages, artifacts, and Docker container images.

## AWS

[source1](https://dzone.com/articles/what-is-aws-codeartifact), [source2](https://docs.aws.amazon.com/codeartifact/latest/ug/welcome.html)

> AWS (Amazon Web Services) - is a subsidiary of Amazon that provides on-demand cloud computing platforms and APIs to individuals, companies, and governments, on a metered, pay-as-you-go basis. AWS services are delivered to customers via a network of AWS server farms located throughout the world.

**AWS Code Artifact:** secure, highly scalable, managed artifact repository service that makes it easier for organizations of any size to securely store, publish, and share software packages used in their software development process.

- Security: safely share private packages across organizations by publishing to a central organizational repository.
- Storage: no limits on the number or total size of the packages.
- Repositories are polyglot: packages of any supported types in a single repository.
- Packages sharing: you can make packages in one repository available to another repository in the same domain.
- Allows package version control and dependency resolution.
- Integration: can be integrated with all CI/CD tools.
- Integration: compatible with tools like Eclipse, IntelliJ, Hudson, Jenkins, Puppet, Chef, Docker, and more.

## GCP

[source](https://cloud.google.com/artifact-registry/docs/overview#:~:text=Artifact%20Registry%20provides%20a%20single,Store%20artifacts%20from%20Cloud%20Build.)

> GCP (Google Cloud Platform) lets you build, deploy, and scale applications, websites, and services on the same infrastructure as Google.


**Google Cloud Artifact Registry:** enables you to centrally store artifacts and build dependencies as part of an integrated Google Cloud experience.

- Integration: Integrate Artifact Registry with Google Cloud CI/CD services or your existing CI/CD tools (or other tools written below).
- Deploy: deploy artifacts to Google Cloud runtimes, including Google Kubernetes Engine, Cloud Run, Compute Engine, and App Engine flexible environment.
- Protect your software supply chain: manags container metadata and scan for container vulnerabilities with Artifact Analysis.
- Convenient managing: Create multiple regional repositories within a single Google Cloud project. Group images by team or development stage and control access at the repository level.
- Artifact Registry provides:
    -  remote repositories to cache dependencies from upstream public sources so that you have greater control over them and can scan them for vulnerabilities, build provenance, and other dependency information.
    - virtual repositories to group remote and private repositories behind a single end point. Set a priority on each repository to control search order when downloading or installing an artifact.


## Azure (Microsoft)

[source](https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary/what-is-azure)

> Azure Artifacts: more than 200 products and cloud services designed to help you bring new solutions to life—to solve today’s challenges and create the future. Build, run, and manage applications across multiple clouds, on-premises, and at the edge, with the tools and frameworks of your choice.

**Azure Artifacts:** add fully integrated package management to your continuous integration/continuous delivery (CI/CD) pipelines with a single click. Create and share Maven, npm, NuGet, Python, and Rust package feeds from public and private sources with teams of any size.

- Versatility among package types: universal artifact management for Maven, npm, NuGet, and Python.
- Universal packages: there's no need to store binaries in Git—simply store them using Universal Packages.
- Integration with Azure DevOps and suooirt of CI/CD.
- Access control and Security: keep every public source package you use safe in your feed where only you can delete it, and where it's backed by the enterprise-grade Azure SLA.
- Both types of repositories are available: public and private
- Additional tools: versioning, retention policies, and automatic clean-up of unused packages.


# Task 2. Serverless Computing Platform

## AWS

[source1](https://aws.amazon.com/lambda/), [source2](https://docs.aws.amazon.com/whitepapers/latest/security-overview-aws-lambda/security-overview-aws-lambda.html)

**AWS Lambda:** event-driven, serverless compute service that extends other AWS services with custom logic, or creates other backend services that operate with scale, performance, and security.

- No need for managing servers: run code without provisioning or managing infrastructure.
- Automatic scaling: automatically respond to code execution requests at any scale.
- Performance optimization: Optimize performance with the right function memory size. Respond to high demand in double-digit milliseconds with Provisioned Concurrency.
- Integration: can be used with almost any Amazon service (API Gareway, Simple Storage Device, DynamoDB, etc.).
- Versatility among languages: Node.js, Python, Java, C#, Go, Ruby, and PowerShell.
- Versioning: versioning is supported.


## GCP

[source](https://cloud.google.com/functions#all-features)

**Cloud Run functions:** scalable pay as you go Functions-as-a-Service (FaaS) offering to run your code with zero server management. 

- No server management: deploy and scale for yourself
- Pay only for what you use	- pay for function’s execution time, no more
- Avoid lock-in: use FaaS framework for running functions across multiple environments and prevent lock-in.
- Develop locally, scale globally: Cloud Run manages and scales underlying infrastructure with the size of workload.
- Supports various runtimes such as Python, Go, Node.js.
- Integrates with Firebase, Google Cloud Pub/Sub, and other services.


## Azure

[source](https://azure.microsoft.com/en-us/products/functions)

**Azure Functions:** serverless computing service, hosted on the Microsoft Azure public cloud, that streamlines the development of systems and applications.

- Versatility among languages: C#, JavaScript, Python.
- Integration: with Azure services (Event Hub, Blob Storage).
- Provides durable functions for workflows.
- Real-time processing: process your files, data, and event streams in near real-time.
