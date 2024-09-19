### Terraform Installation and Nginx Deployment

**Terraform Version**: 1.5.0 (example version, check your installed version)

#### Steps Followed to Install Terraform:
1. Installed Terraform using Homebrew:
    ```bash
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform
    ```

2. Verified the installation:
    ```bash
    terraform -v
    ```

#### Terraform Configuration:
- Created the `main.tf` file with the following content:
    ```hcl
    terraform {
      required_providers {
        docker = {
          source = "kreuzwerker/docker"
          version = "~> 2.0"
        }
      }
    }

    provider "docker" {}

    resource "docker_image" "nginx" {
      name         = "nginx:latest"
      keep_locally = false
    }

    resource "docker_container" "nginx_container" {
      image = docker_image.nginx.latest
      name  = "nginx-server"
      ports {
        internal = 80
        external = 8080
      }
    }
    ```

#### Commands Executed:
1. Initialized Terraform:
    ```bash
    terraform init
    ```
2. Applied the Terraform configuration:
    ```bash
    terraform apply
    ```
   - Entered `yes` to confirm the deployment.

#### Observations:
- The Nginx container was successfully deployed and is accessible at `http://localhost:8080`.
- Encountered a warning about the deprecated `latest` attribute, but it did not affect the deployment.

#### Challenges:
- Initially encountered an issue where Terraform could not connect to the Docker daemon. This was resolved by starting Docker Desktop.
- Adjusted the provider to `kreuzwerker/docker` as `hashicorp/docker` was deprecated.

#### Cleanup:
- Destroy the infrastructure when no longer needed:
    ```bash
    terraform destroy
    ```
   - Enter `yes` to confirm the destruction of resources.
