## Nginx Deployment

1.**Install terraform:**

- I installed Terraform via the Yandex Cloud Mirror.
    - Add to the PATH:
        ```bash
      export PATH=$PATH:/path/to/terraform
      ```
    - Set up the provider:

        ```bash
        nano ~/.terraformrc
        ```
    - Put the following text inside:
      ```
        provider_installation {
          network_mirror {
            url = "https://terraform-mirror.yandexcloud.net/"
            include = ["registry.terraform.io/*/*"]
          }
          direct {
            exclude = ["registry.terraform.io/*/*"]
          }
        }
        ```

2. **Preparations**
    - Create the directory fot terraform instance `mkdir <dir>`, `cd <dir>`
    - Define the infrastructure in `main.tf`

   ```
   terraform {
      required_providers {
        docker = {
          source  = "kreuzwerker/docker"
          version = "~> 3.0.1"
        }
      }
    }
    
    provider "docker" {
     host ="unix:///home/t/.docker/desktop/docker.sock"
    }
    
    resource "docker_image" "nginx" {
      name         = "nginx"
      keep_locally = false
    }
    
    resource "docker_container" "nginx" {
      image = docker_image.nginx.image_id
      name  = "tutorial"
      hostname = "tim"
    
      ports {
        internal = 80
        external = 8000
      }
    }
    ```

3. **Start the Nginx!**
    - With the command `terraform apply` start the server.

   ![deployment](deployment.png)

4. **Change infrastructure:**
    - For example as in the tutorial I will change the external port of container:

    ```
    resource "docker_container" "nginx" {
      image = docker_image.nginx.latest
      name  = "tutorial"
      hostname = "learn-terraform-docker"
      ports {
        internal = 80
        external = 8080
      }
    }
    ```

    - Update terraform with `terraform apply`.
    ```
   $ docker ps
   CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS                  NAMES
   e86e45a68d0b   39286ab8a5e1   "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:8080->80/tcp   tutorial
   ```

    - Changes were submitted and port changed.

5. **Define Variables:**

    - Let's define some variable in new file `variables.tf`.

    ```
    variable "container_name" {
      description = "Value of the name for the Docker container"
      type        = string
      default     = "DevOps-Practice-Nginx"
    }
    ```
   - And change infrastructure in `main.tf`.
    ```
    resource "docker_container" "nginx" {
      image = docker_image.nginx.image_id
    + name  = var.container_name
      ports {
        internal = 80
        external = 8080
      }
    }
   ```
   - Restart again!
   ```shell
   terraform apply
   ```
   ```
   $ docker ps
    CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
    ab202a66c3ba   39286ab8a5e1   "/docker-entrypoint.…"   4 seconds ago   Up 4 seconds   0.0.0.0:8080->80/tcp   DevOps-Practice-Nginx
    ```

6. **Outputs:**
    - Heading the terraform tutorial, I add foe the output both container and image IDs.:
    - Create the output setting in `outputs.tf`:
    ```
   output "container_id" {
      description = "ID of the Docker container"
      value       = docker_container.nginx.id
    }
    
    output "image_id" {
      description = "ID of the Docker image"
      value       = docker_image.nginx.id
    }
   ```
    - Apply the changes and restart one more time.
    ```
    Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
    
    Outputs:
    
    container_id = "80bd17c106b3d307591a9cf0cd323a9bf307b222f7120a062bf28bc36f42741b"
    image_id = "sha256:39286ab8a5e14aeaf5fdd6e2fac76e0c8d31a0c07224f0ee5e6be502f12e93f3nginx"
    ```

7. **Destroy infrastructure:**
    
    - As I don't need the infrastructure anymore, it's time to destroy.
   To do this I run `terraform destroy`:
    
    ```
    docker_image.nginx: Refreshing state... [id=sha256:39286ab8a5e14aeaf5fdd6e2fac76e0c8d31a0c07224f0ee5e6be502f12e93f3nginx]
    docker_container.nginx: Refreshing state... [id=80bd17c106b3d307591a9cf0cd323a9bf307b222f7120a062bf28bc36f42741b]
   
    ...

    docker_container.nginx: Destroying... [id=80bd17c106b3d307591a9cf0cd323a9bf307b222f7120a062bf28bc36f42741b]
    docker_container.nginx: Destruction complete after 0s
    docker_image.nginx: Destroying... [id=sha256:39286ab8a5e14aeaf5fdd6e2fac76e0c8d31a0c07224f0ee5e6be502f12e93f3nginx]
    docker_image.nginx: Destruction complete after 0s
    
    Destroy complete! Resources: 2 destroyed.
   ```
   
   - To confirm the docker container:
   ```
   $ docker ps
   CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
   ```
   
    - There is no any docker container active