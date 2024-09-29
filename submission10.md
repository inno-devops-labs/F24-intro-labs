## Task 1
### Artifact Registries in AWS, GCP, and Azure

#### AWS: Amazon Elastic Container Registry (ECR)
##### Key Features:
- **Container Image Storage**: Primarily used for storing Docker images.
- **Integration with CI/CD**: Easily integrates with AWS CodeBuild, CodePipeline, and ECS.
- **Security**: Supports image scanning for vulnerabilities using Amazon Inspector.
- **Cross-region Replication**: Automate replication of images across AWS regions.
- **IAM Integration**: Fine-grained access control via AWS Identity and Access Management (IAM).
- **Cost**: Pay-as-you-go pricing for storage and data transfer.

#### GCP: Artifact Registry
##### Key Features:
- **Multi-format Support**: Supports Docker images, Helm charts, Maven, npm, and other package formats.
- **Repository Management**: Allows for multiple repository types within the same project.
- **Security and Compliance**: You can use vulnerability scanning and Binary Authorization for enforcing security policies.
- **IAM Roles and Permissions**: Granular access control using Google Cloud IAM.
- **Regional and Multi-regional Repositories**: Ypu can optimize performance and compliance by choosing the repository location.
- **Cost**: Charged for storage and network egress, with pricing based on usage.

#### Azure: Azure Container Registry (ACR)
##### Key Features:
- **Multi-format Support**: Supports Docker images, Helm charts, and OCI artifacts.
- **Geo-replication**: Allows for replicating container images across multiple Azure regions.
- **Integrated Security**: There is built-in image scanning and Content Trust for verifying images.
- **Task Automation**: Supports running container build tasks in ACR without needing separate CI/CD tools.
- **Integration with Azure Services**: Seamless integration with Azure Kubernetes Service (AKS), Azure DevOps, and Azure Security Center.
- **Cost**: Multiple pricing tiers (Basic, Standard, Premium) based on storage, replication, and network bandwidth needs.

## Task 2
### Serverless Computation platforms
#### AWS Lambda
##### Key Features:
- **Arbitrary executables**: You can configure the Lambda service to run arbitrary executables to process events rather than working with language-specific functions.
- **Custom runtimes**: Users can implement their own language runtimes beyond those provided natively by Amazon.
- **Provisioned concurrency:** The ability to keep event handlers spun up and on standby to help mitigate the cold start problem of allocating resources at the time of the event.
- **Easy access to persistence**: Users can use Amazon's RDS Proxy to connect to database instances securely from their functions and use Elastic File System to store file-based data.

#### Microsoft Azure Functions
##### Key Features:
- **Various deployment options**: Azure offers various plans for serverless functions that bundle features according to your need.
- **Extensible bindings**: You can add extensions to the platform to support different workflows and integrations.
- **Integrated HTTP endpoint**: Azure functions come complete with HTTP endpoint management out of the box.

#### Google Cloud Functions
##### Key Features:
- **Distributed tracing and debugging**: Designed to work well with Google's Cloud Trace and Cloud Debugger tools.
- **Integrated HTTP endpoint**: Google Cloud Functions come complete with HTTP endpoint management out of the box.

for this task I used information from this article: https://dataguide.vercel.app/dataguide/serverless/serverless-comparison#aws-lambda
