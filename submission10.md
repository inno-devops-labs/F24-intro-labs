# Artifact Registries in AWS, GCP, and Azure

## AWS: Amazon Elastic Container Registry (ECR)
### Key Features:
- **Container Image Storage**: Primarily used for storing Docker images.
- **Integration with CI/CD**: Easily integrates with AWS CodeBuild, CodePipeline, and ECS.
- **Security**: Supports image scanning for vulnerabilities using Amazon Inspector.
- **Cross-region Replication**: Automate replication of images across AWS regions.
- **IAM Integration**: Fine-grained access control via AWS Identity and Access Management (IAM).
- **Cost**: Pay-as-you-go pricing for storage and data transfer.

## GCP: Artifact Registry
### Key Features:
- **Multi-format Support**: Supports Docker images, Helm charts, Maven, npm, and other package formats.
- **Repository Management**: Allows for multiple repository types within the same project.
- **Security and Compliance**: You can use vulnerability scanning and Binary Authorization for enforcing security policies.
- **IAM Roles and Permissions**: Granular access control using Google Cloud IAM.
- **Regional and Multi-regional Repositories**: Ypu can optimize performance and compliance by choosing the repository location.
- **Cost**: Charged for storage and network egress, with pricing based on usage.

## Azure: Azure Container Registry (ACR)
### Key Features:
- **Multi-format Support**: Supports Docker images, Helm charts, and OCI artifacts.
- **Geo-replication**: Allows for replicating container images across multiple Azure regions.
- **Integrated Security**: There is built-in image scanning and Content Trust for verifying images.
- **Task Automation**: Supports running container build tasks in ACR without needing separate CI/CD tools.
- **Integration with Azure Services**: Seamless integration with Azure Kubernetes Service (AKS), Azure DevOps, and Azure Security Center.
- **Cost**: Multiple pricing tiers (Basic, Standard, Premium) based on storage, replication, and network bandwidth needs.

