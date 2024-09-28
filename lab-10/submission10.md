## Task 1

Artifact registers used for storing, managing and securing various software artifacts.
Software artifact is a whole product used for deployment and my contain the following items:
- Binaries of the application
- Source Code
- Configuration files
- Log files
- Documentation
- etc

In general it's the product by itself.

**_Note:_** This is part was primary for myself



### AWS CodeArtifact:

- Allows to store software packages within multiple verified accounts. 
- Able to fetch packages from public repos.
- Use Pay-As-You-Go cost policy

### AZURE artifact:

- Focused on container images
- Offers built-in vulnerability image scanning
- Cost is based on storage and operations

### GCP artifact:

- Handles multiple artifacts (diff formats) in one repo
- Allows to create the repos in certain geographical region to optimize performance.
- Automatic vulnerability scanning
- Cost based on storage and network usage


## Task 2

All mentioned platform offers three levels of services: IaaS, SaaS, FaaS

**FaaS** stands by `Function as a Service` and allows to execute individual functions in response of tje event without managing whole infrastructure. 

### AWS

- **AWS Fargate** (IaaS)
- **AWS Step Function** (PaaS)
- **AWS Lambda**  (Faas)

### Azure

- **Azure Container Instances** (IaaS) 
- **Azure Logic Apps** (Paas)
- **Azure Functions** (Faas)
 
### GCP

- **Google Could Run** (IaaS)
- **Google App Engine** (PaaS)
- **Google Cloud Functions** (FaaS)