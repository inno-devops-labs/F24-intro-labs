# GitOps & SRE Lab

In this lab, you will explore the principles of GitOps and Site Reliability Engineering (SRE). Follow the tasks below to complete the lab assignment.

## Task 1: Key Metrics for SRE and SLAs

**Objective**: Monitor system resources and manage disk space.

1. **Monitor System Resources**:
   - Use commands like `htop` and `iostat` to monitor CPU, memory, and I/O usage.
   - Identify and document the top 3 most consuming applications for CPU, memory, and I/O usage in a `submission5.md` file.

2. **Disk Space Management**:
   - Use `du` and `df` to manage disk space.
   - Identify and log the top 3 largest files in the `/var` directory in the `submission5.md` file.

3. **Documentation**:
   - Create a `submission5.md` file.
   - Provide the output and analysis of the monitored metrics and disk space management.

## Task 2: Terraform Installation and Nginx Deployment

**Objective**: Install Terraform and deploy an Nginx container.

1. **Research and Installation**:
   - Read about Terraform.
   - Install Terraform on your system by following the [official instructions](https://developer.hashicorp.com/terraform/tutorials/docker-get-started).

2. **Nginx Deployment**:
   - Follow the tutorial steps to build, change, and destroy infrastructure.
   - Define variables and query data with outputs.
   - Document your process.

3. **Publish Configuration Files**:
   - Create a `lab5` folder in your repository.
   - Include all Terraform configuration files used in the tutorial in this folder.

4. **Documentation**:
   - Create a Markdown file named `TerraformAndNginx.md` in the `lab5` folder.
   - Include the following details:
     - The version number of Terraform installed.
     - Steps followed to install Terraform.
     - Commands executed to initialize and apply the Terraform configuration.
     - Observations or challenges encountered during the installation and deployment process.

### Guidelines

- Use proper Markdown formatting and structure for the documentation files.
- Organize the files within the lab folder using appropriate naming conventions.
- Create a Pull Request to the main branch of the repository with your completed lab assignment.

> Note: Actively explore SRE metrics and SLAs to understand their importance in measuring system reliability. Additionally, gain hands-on experience with Terraform by provisioning infrastructure and deploying an Nginx container.
