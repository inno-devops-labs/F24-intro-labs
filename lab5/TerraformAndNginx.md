# Task 2: Terraform Installation and Nginx Deployment

## Terraform Version
Terraform v1.9.5 on linux_amd64

## Installation Steps

1. Configure Terraform CLI:
   - Opened ~/.terraformrc
   - Added provider installation configuration for Yandex Cloud mirror

2. Download and install Terraform:
   ```
   wget https://hashicorp-releases.yandexcloud.net/terraform/1.9.5/terraform_1.9.5_linux_amd64.zip
   unzip terraform_1.9.5_linux_amd64.zip
   export PATH=$PATH:$(pwd)
   ```

3. Verify installation:
   ```
   terraform version
   ```

## Nginx Deployment

1. Created a `lab5` folder in the repository

2. Created `main.tf` in the `lab5` folder with the following configuration:
   ```hcl
   terraform {
     required_providers {
       docker = {
         source  = "kreuzwerker/docker"
         version = "~> 2.13.0"
       }
     }
   }

   provider "docker" {}

   resource "docker_image" "nginx" {
     name         = "nginx:latest"
     keep_locally = false
   }

   resource "docker_container" "nginx" {
     image = docker_image.nginx.name
     name  = var.container_name
     ports {
       internal = 80
       external = 8000
     }
   }

   variable "container_name" {
     description = "Value of the name for the Docker container"
     type        = string
     default     = "ExampleNginxContainer"
   }

   output "container_id" {
     description = "ID of the Docker container"
     value       = docker_container.nginx.id
   }

   output "image_id" {
     description = "ID of the Docker image"
     value       = docker_image.nginx.id
   }
   ```

3. Initialize Terraform:
   ```
   terraform init
   ```

4. Apply the configuration:
   ```
   terraform apply
   ```

5. After applying, received container_id and image_id outputs

6. Destroyed the infrastructure:
   ```
   terraform destroy
   ```

## Observations and Challenges

- Successfully installed Terraform using Yandex Cloud mirror
- Encountered no significant challenges during the installation or deployment process
- The Nginx container was successfully created and could be accessed at http://localhost:8000 before destruction.
